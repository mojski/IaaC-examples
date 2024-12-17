## 1. Generate wild card certificate

1. Log into control plane machine

2. Install cerrtbot if not installed (4). Then request certificate:

```bash
	certbot certonly --manual --preferred-challenges=dns --email test@test.com
```

then get prompted challenge record and add it to your domain supplier website as a dns record. It can take some time (~10 minutes)
// TODO add screenshot

After dns successful propagation, you may continue. 
Certbot will generate a certificate if the record has been added and readed from domain supplier. 

Files are usually saved in 
```
/etc/letsencrypt/yourdomain/privkey.pem
/etc/letsencrypt/yourdomain/fullchain.pem
```
## Run ansible playbook to copy files
```
ansible-playbook copy_files.yml -i inventory
```
Or Do it manually, by copying it via sftp to specific location, change owner for your user and change content by:

```
cat your_directory/fullchain.pem > /etc/letsencrypt/live/your_domain/fullchain.pem

cat your_directory/fullchain.pem > /etc/letsencrypt/live/your_domain/privkey.pem
```
then restart nginx

```
systemctl restart nginx.service
```


