:: Objetivos

:: Alterar PATH (Para adicionar comandos do vagrant e virtualbox)
setx path "%PATH%;D:\Hashicorp\Vagrant\bin;C:\Program Files\Oracle\virtualbox" /m

:: Definir VAGRANT_HOME (Para salvar as boxes no diretório D:\GPCN\Boxes)
setx VAGRANT_HOME "D:\GPCN\Boxes" /m

:: Definir VBOX_USER_HOME (Para salvar as VMs no direótiro D:\GPCN)
setx VBOX_USER_HOME "D:\GPCN\.Virtualbox\" /m

:: Alterar machinefolder (Para salvar as VMS no diretório D:\GPCN\VMs)
vboxmanage setproperty machinefolder D:\GPCN\VMs
