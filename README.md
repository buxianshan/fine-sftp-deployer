# Fine SFTP Deployer

GitHub Action：Deploy files to your server with SFTP.

## Installation

Copy and paste the following snippet into your .yml file.

```yaml
- name: Fine SFTP Deployer
  # You may pin to the exact commit or the version.
  # uses: buxianshan/fine-sftp-deployer@57d6f88cf28663ccead95df84dc5ce752e2c8327
  uses: buxianshan/fine-sftp-deployer@v0.1.5
  with:
    # username
    username: 
    # your server ip or domain
    server: 
    # your server ssh port, the default is 22
    port: # default is 22
    # ssh private key
    ssh_private_key: 
    # local dist file path
    local_path: # default is ./*
    # dist file path on your server
    remote_path: 
    # whether or not delete all files in remote_path(true or false, default is false)
    clear_remote_path: 
```

