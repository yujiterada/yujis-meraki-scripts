import csv
import os
import sys

from dotenv import load_dotenv
import meraki

# Load environment variables from .env file
load_dotenv()

# Retrieve API_KEY from environment variables
API_KEY = os.getenv("API_KEY")
ORG_ID = os.getenv("ORG_ID")
if not API_KEY:
    print("Please provide API_KEY in .env file")

# Initialize the Dashboard API with your API key
m_client = meraki.DashboardAPI(API_KEY, output_log=False, suppress_logging=True)

if not ORG_ID:
    print("Please provide ORG_ID in .env file")
    orgs = m_client.organizations.getOrganizations()
    for org in orgs:
        print(org['id'], org['name'])
    sys.exit(0)

networks = m_client.organizations.getOrganizationNetworks(ORG_ID)

# Prepare to write to CSV
with open('output.csv', 'w', newline='') as file:
    writer = csv.writer(file)
    # Write the header
    writer.writerow(['network_id/hub_id', 'network_name', 'mode',
                     'primary hub_id', 'primary useDefaultRoute',
                     'secondary hub_id', 'secondary useDefaultRoute',
                     'tertiary hub_id', 'tertiary useDefaultRoute',
                     'quaternary hub_id', 'quaternary useDefaultRoute'
                     ])

    # Process each network
    for network in networks:
        if 'appliance' in network['productTypes']:
            network_id = network['id']
            network_name = network['name']

            # Get VPN details or similar, assuming there's a function to get such details
            s2s_config = m_client.appliance.getNetworkApplianceVpnSiteToSiteVpn(network_id)
            mode = s2s_config['mode']

            # Assuming vpn_data contains hub information in a list
            if mode == 'none':
                s2s_config['hubs'] = []
            hubs = s2s_config['hubs']
            
            # Prepare row data based on the existence of hub information
            row = [network_id, network_name, mode]
            
            # Check if there are at least two hubs, append their details to the row
            for i in range(4):
                if i < len(hubs):
                    row.extend([hubs[i]['hubId'], hubs[i]['useDefaultRoute']])
                else:
                    # If less than 4 hubs, fill with empty values
                    row.extend(['', ''])

            # Write the row to the CSV file
            writer.writerow(row)