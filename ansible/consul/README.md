
Windows
- winget isntall Hashicorp.Consul
- create Tools/Consul/data and Tool/Consul/config
- add consul.json file in config directory

```json
{
  "datacenter": "z4",
  "data_dir": "C:\\Tools\\Consul\\data", // create directories
  "log_level": "INFO",
  "node_name": "z4",
  "server": true,
  "bootstrap_expect": 1,
  "bind_addr": "0.0.0.0",
  "advertise_addr": "0.0.0.0",
  "client_addr": "0.0.0.0",
  "ui": true
}
```

ports

```json
{
  "ports": {
    "http": 8500,
    "dns": 8600,
    "serf_lan": 8301,
    "serf_wan": 8302,
    "server": 8300
  }
}
```