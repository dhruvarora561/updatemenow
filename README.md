# updatemenow
Always have updated windows 11 image ready to install.

## What does it do?
When Microsoft pushes update to Windows 11 it takes some time to have the updated image available. This project uses ```packer``` to create up to date windows images with customizations like unattended setup and removing the microsoft account requirement during the setup process. 

## How does it work?
It will use ```packer``` to apply the customizations to base windows 11 image and it will run once every week to ensure latest up to date images are available. 

## What do I need?
1. Azure SPN
2. Azure account 
