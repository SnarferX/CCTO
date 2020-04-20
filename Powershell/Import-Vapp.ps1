Connect-VIServer d05nutlp0002.twcable.com
#Define your OVF Path
#$ovfPath = "D:\BuildTeam\OVF_Files\ArchivingVirtualAppliance-Mallard-Outlook2016.ovf"
$ovfPath = "OVFPATH"
$ovfConfig = Get-OvfConfiguration -Ovf $ovfPath
#Define your Network Port Group
$ovfConfig.NetworkMapping.VM_Network.Value = "VMNETWORK"
#Define your cluster
$Cluster = Get-Cluster -Name "CLUSTERNAME"
$VMHost = Get-Cluster $Cluster | Get-VMHost | Sort-Object MemoryGB | Select-Object -First 1
#Give the VM a machine name
$VMName = "VMNAME"
#The following line can get you into trouble, check your datastores first! NO LOCALS!!!
$Datastore = Get-DatastoreCluster | Get-Datastore | Sort-Object FreeSpaceGB -Descending | Select-Object -First 1 
$DiskFormat = "THICK"
#Import-VApp -Source $ovfpath -OvfConfiguration $ovfConfig -VMHost 'ncepevmesxh0081.corp.chartercom.com' -Name $VMName -Location $Cluster -Datastore $Datastore -DiskStorageFormat $DiskFormat -Confirm:$false 
Import-VApp -Source $ovfpath -OvfConfiguration $ovfConfig -Name $VMName -VMHost $VMHost -Location $Cluster -DiskStorageFormat $DiskFormat -Datastore $Datastore -Confirm:$false