import ovmclient
import json
import requests
import warnings
from urllib3.exceptions import  InsecureRequestWarning
warnings.simplefilter('ignore',InsecureRequestWarning)

#vars
user = 'p2906297'
password = 'THem5dax'

client = ovmclient.Client(
    'https://ovmdmgr04:7002/ovm/core/wsapi/rest', user, password)

# Make sure the manager is running
client.managers.wait_for_manager_state()

# Discover a new host and take ownership
# r = client.servers.discover()
#  print(client)
# Get an existing VM or a VM template
vm_id = client.vms.get_id_by_name('SUPER_MAN')
print("This is the vm id of\n test001")
print(vm_id)

vm_template = client.vms.get_by_name('ol7-template-UEK-kernel')
print("This is the template\n" "ol7-template-UEK-kernel\n")
print(vm_template)

# # Make sure the manager is running
# client.managers.wait_for_manager_stat
# e()
# print("make sure manager is running")
# print(vm_id)

# # Discover a new host and take ownership
# vm_discover = client.servers.discover(vm_id)
# print("discover server")
# print(vm_discover)