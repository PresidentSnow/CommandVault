#!/bin/bash
# 2025/10/21

# See group information:
# aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId,
# Tags[?Key==`Name`].Value | [0], SecurityGroups[*].GroupId]' --output table

echo " "
aws ec2 terminate-instances \
        --instance-ids #[id_grupo]

aws ec2 wait instance-terminated \
        --instance-ids #[id_grupo]

echo -e "\nInstancia eliminada con exito!\n"

aws ec2 delete-security-group \
        --group-name #[SG_name]

echo -e "Grupo de seguridad eliminado con exito!\n"

aws ec2 delete-key-pair \
        --key-name #[key_name]

echo -e "Key pair PEM eliminated succesfully!\n"
