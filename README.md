# updatemenow
Always have updated windows 11 image ready to install.

## What does it do?
When Microsoft pushes update to Windows 11 it takes some time to have the updated image available. This project uses ```packer``` to create up to date windows images with customizations like removing the microsoft account requirement during the setup process(coming soon). 

## How does it work?
It will use ```packer``` to apply the customizations to base windows 11 image and it will run once every week to ensure latest up to date images are available. 

## What do I need?
1. Azure SPN
2. Azure account 

## Environment variables
```
set PKR_VAR_CLIENT_ID=your-client-id
set PKR_VAR_CLIENT_SECRET=your-client-secret
set PKR_VAR_SUBSCRIPTION_ID=your-subscription-id
set PKR_VAR_TENANT_ID=your-tenant-id
set PKR_VAR_WINRM_PASSWORD=your password
```
These values are necessary to build the image.

## How do I run it?
1. Run ```packer build windows.pkr.hcl```

## How do I get the image?
When creating an image on azure you can specify to use this version to create the vm

