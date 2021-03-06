#!/bin/sh
# Returns:
#       0 if successful
#       1 if it fails

datenow=$(date +%Y_%m_%d_%H:%M:%S)
path="binaries/${datenow}_coreboot.rom"
filepath="$1/build/coreboot.rom"
RESPONSE=$(aws s3api put-object \
            --bucket coreboot-spr-sp-images \
            --body $filepath \
            --key $path)
if [ ${?} -ne 0 ]; then
    errecho "ERROR: AWS reports put-object operation failed.\n$RESPONSE"
    return 1
else
    echo "successful uploaded binary 'coreboot.rom' to S3 bucket"
fi
