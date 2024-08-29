
New-NetFirewallRule -DisplayName "Consul_Tcp_In" -Direction Inbound -Protocol TCP -LocalPort 8600,8500,8501,8503,8300,8301,8302 -Action Allow -Profile Any

New-NetFirewallRule -DisplayName "Consul_Tcp_Out" -Direction Inbound -Protocol TCP -LocalPort 8300,8301,8302 -Action Allow -Profile Any

New-NetFirewallRule -DisplayName "Consul_Udp_In" -Direction Inbound -Protocol UDP -LocalPort 8600,8301,8302 -Action Allow -Profile Any

New-NetFirewallRule -DisplayName "Consul_Udp_Out" -Direction Outbound -Protocol UDP -LocalPort 8301,8302 -Action Allow -Profile Any

# remove
# Remove-NetFirewallRule -DisplayName "Consul_Tcp_In"
# Remove-NetFirewallRule -DisplayName "Consul_Tcp_Out"
# Remove-NetFirewallRule -DisplayName "Consul_Udp_In"
# Remove-NetFirewallRule -DisplayName "Consul_Udp_Out"