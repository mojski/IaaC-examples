
New-NetFirewallRule -DisplayName "AllowConsul" -Direction Inbound -Protocol TCP -LocalPort 8500,8501,8300,8301 -Action Allow -Profile Any