#  AMI - CSYE 6225

The AMI is a supported and maintained Ubuntu image for use on Amazon Elastic Compute Cloud (Amazon EC2). It is designed to provide a stable, secure, and high performance execution environment for applications running on Amazon EC2.

## Installation

Use the Hashicorp Packer Image  to build the AMI.

```
hashicorp/packer
```

## Setup
```json
{
    "aws_region": "",
    "aws_access_key": "",
    "aws_secret_key": "",
    "subnet_id": "",
    "source_ami": "",
    "ssh_username": "",
    "ami_users": ""
}
```

## Usage

```bash
packer validate -var-file=./vars.json ubuntu-ami.json
packer build -var-file=./vars.json ubuntu-ami.json
```



## License
[MIT](https://choosealicense.com/licenses/mit/)
