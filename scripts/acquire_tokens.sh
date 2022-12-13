#!/bin/bash
cat << EOF > terraform/secret.tfvars
	yc_token = "$(yc iam create-token)"
	yc_cloud_id = "$(yc config get cloud-id)"
	yc_folder_id = "$(yc config get folder-id)"
EOF
	echo "Acquired YC token, cloud and folder ids!"
