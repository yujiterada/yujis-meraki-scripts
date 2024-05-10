import difflib
import os
import re
import logging

import meraki
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

NETWORK_OR_HUB_ID = 0
NETWORK_NAME = 1
MODE = 2
PRIMARY_HUB_ID = 3
PRIMARY_USE_DEFAULT_ROUTE = 4
SECONDARY_HUB_ID = 5
SECONDARY_USE_DEFAULT_ROUTE = 6
TERTIARY_HUB_ID = 7
TERTIARY_USE_DEFAULT_ROUTE = 8
QUATERNARY_HUB_ID = 9
QUATERNARY_USE_DEFAULT_ROUTE = 10

# Retrieve API_KEY from environment variables
API_KEY = os.getenv("API_KEY")
ORG_ID = os.getenv("ORG_ID")
if not API_KEY:
    print("Please provide API_KEY in .env file")

# Configure logging
OUTPUT_FILENAME = 'update.log'
logging.basicConfig(filename=OUTPUT_FILENAME, level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

# Initialize the Dashboard API with your API key
m_client = meraki.DashboardAPI(API_KEY, output_log=False, suppress_logging=True)

def update_mx_vpn_hub_priority(network_id, mode, request_body):
    result = m_client.appliance.updateNetworkApplianceVpnSiteToSiteVpn(network_id, mode, **request_body)
    logging.info(f"Updated network {network_id} with mode {mode} and hubs: {request_body['hubs']}")
    return result

def compare_csv_files(output_file, input_file):
    list_to_return = []

    if not os.path.exists(input_file):
        print("Please run output_network_id_and_hub_id.py first, copy output.csv to input.csv, and alter input.csv to your preference.")
        return

    # Read and normalize the content of both files
    with open(output_file, 'r', newline='') as f_output, open(input_file, 'r', newline='') as f_input:
        # Normalize spaces and tabs, but keep newlines
        output_data = [re.sub(r'[ \t]+', ' ', line) for line in f_output.readlines()]
        input_data = [re.sub(r'[ \t]+', ' ', line) for line in f_input.readlines()]

    # Create a Differ object
    differ = difflib.Differ()

    # Calculate the differences
    diff = list(differ.compare(output_data, input_data))

    # Check if there are differences and print them
    differences_exist = False
    for line in diff:
        if line.startswith('- '):
            differences_exist = True
        if line.startswith('+ '):
            differences_exist = True
            list_to_return.append(line[2:].strip())

    if differences_exist:
        return list_to_return
    else:
        return None


# Specify the file names
output_csv = 'output.csv'
input_csv = 'input.csv'

if os.path.exists(input_csv):
    diff = compare_csv_files(output_csv, input_csv)
    if diff:
        for line in diff:
            vpn_config = line.split(',')
            network_id = vpn_config[NETWORK_OR_HUB_ID]
            mode = vpn_config[MODE]
            primary_hub_id = vpn_config[PRIMARY_HUB_ID]
            primary_use_default_route = vpn_config[PRIMARY_USE_DEFAULT_ROUTE]
            secondary_hub_id = vpn_config[SECONDARY_HUB_ID]
            secondary_use_default_route = vpn_config[SECONDARY_USE_DEFAULT_ROUTE]
            tertiary_hub_id = vpn_config[TERTIARY_HUB_ID]
            tertiary_use_default_route = vpn_config[TERTIARY_USE_DEFAULT_ROUTE]
            quaternary_hub_id = vpn_config[QUATERNARY_HUB_ID]
            quaternary_use_default_route = vpn_config[QUATERNARY_USE_DEFAULT_ROUTE]
            
            request_body = {
                "hubs": [
                ]
            }
            if primary_hub_id:
                request_body["hubs"].append({
                    "hubId": primary_hub_id,
                    "useDefaultRoute": primary_use_default_route
                })
            if secondary_hub_id:
                request_body["hubs"].append({
                    "hubId": secondary_hub_id,
                    "useDefaultRoute": secondary_use_default_route
                })
            if tertiary_hub_id:
                request_body["hubs"].append({
                    "hubId": tertiary_hub_id,
                    "useDefaultRoute": tertiary_use_default_route
                })
            if quaternary_hub_id:
                request_body["hubs"].append({
                    "hubId": quaternary_hub_id,
                    "useDefaultRoute": quaternary_use_default_route
                })
            result = update_mx_vpn_hub_priority(network_id, mode, request_body)


    else:
        print("No changes detected between the files.")
else:
# Run the comparison
    print("Please run output_network_id_and_hub_id.py first, copy output.csv to input.csv, and alter input.csv to your preference.")
