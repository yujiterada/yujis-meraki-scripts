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

There's a sample in this repository.
### 2. Copy _output.csv_ and rename to _input.csv_
```
cp output.csv input.csv
```
### 3. Edit _input.csv_
Edit _input.csv_ to your preferred configuration. There's a sample in this repository.

For example, let's say I want to change the configuration to the following.

| Network ID (Hub ID) | Network name | Primary hub ID | Primary hub useDefaultRoute | Secondary hub ID | Secondary hub useDefaultRoute |
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
| L_669347494617955075 | Office - Sydney | L_726205439913497716  | False | N_726205439913511178 | False |

Then, I would alter the row for _Office - Sydney_ and add the primary and secondary hub configuration in _input.csv_.

Note that editting the file via Microsoft Excel could change unwanted rows. For example, I noticed that 'False' was changed to 'False'.

### 4. Run _update_auto_vpn_hub_priority.py_
```
python3 update_auto_vpn_hub_priority.py
```
This will create update.log to record the changes.

### 5. If you need to rollback, run rollback_auto_vpn_hub_priority.py_
```
python3 rollback_auto_vpn_hub_priority.py
```
This will create update.log to record the changes.
