# update-autovpn-hub-priority
Script to update Auto VPN hub priorities of a spoke via CSV.

## Installation

Create a virtual environment ([venv](https://docs.python.org/3/library/venv.html)) and use the package manager [pip](https://pip.pypa.io/en/stable/) to install foobar.

```bash
python3 -m venv venv
```

On Windows, run:
```
.\venv\Scripts\activate
```

On macOS and Linux run:
```
source venv/bin/activate
```

```bash
pip3 install meraki python-dotenv
```
## Setup
Create .env file including the API_KEY and ORG_ID.
```
API_KEY=""
ORG_ID=""
```
If you do not know your ORG_ID, configure API_KEY only, and run _output_auto_vpn_hub_priority.py_.
```
python3 output_auto_vpn_hub_priority.py
```
## Usage
### 1. Run _output_auto_vpn_hub_priority.py_
```
python3 output_auto_vpn_hub_priority.py
```
This will create the file _output.csv_ which has the Auto VPN configuration of each network. Each row includes the following data in order.
- Network ID (Hub ID)
- Network name
- Mode
- Primary Hub ID
- Primary Hub use default route
- Secondary Hub ID
- Secondary use default route
- Tertiary Hub ID
- Tertiary use default route
- Quaternary Hub ID
- Quaternary use default route
### 2. Edit _output.csv_