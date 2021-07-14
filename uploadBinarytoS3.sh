#!/bin/sh
# Returns:
#       0 if successful
#       1 if it fails

datenow=$(date +%Y_%m_%d_%H:%M:%S)
path="binaries/${datenow}_coreboot.rom"
RESPONSE=$(aws s3api put-object \
            --bucket 9e-contest \
            --body /tmp/coreboot/build/coreboot.rom \
            --key $path)
if [ ${?} -ne 0 ]; then
    errecho "ERROR: AWS reports put-object operation failed.\n$RESPONSE"
    return 1
else
    echo "successful uploaded binary 'coreboot.rom' to S3 bucket"
fi
