# SSH

## OpenSSH Server port

- Edit `/etc/ssh/sshd_config`
- Add line `Port 4242` (non-privileged between 1024-65535)
- (Optional) update ufw: `ufw allow 4242/tcp`
- Restart ssh `systemctl restart sshd`

## SSH Client Options

~/.ssh/config

```
Host nameicanremember
    HostName my.fqdn.com.oranipaddress
    User alice
    Port 4242
    #ForwardAgent yes
```
