# TODO: add playbook and provisioning

## Provide local or remote Sql Server instance

### 1. Provide local or remote Sql Server instance

You can use playbook from /ansible/basics/databases/mssql/mssql_install.yml or provide accessible database instance.

### 2. Create user for grafana

```sql
CREATE USER grafana WITH PASSWORD 'user_password'
USE <MY_DATABASE>
GRANT SELECT ON DATABASE :: <MY_DATABASE> TO grafana
```

### 3. Add new data source (example will use localhost)

![alt text](assets/image.png)

click Add new source button on the right

![alt text](assets/image-1.png)

Select authentication type and provide credentials
![alt text](assets/image-2.png)

click "save & test" and then "building dashboard" link.

![alt text](assets/image-3.png)

### 4. Import dashboard

Go to [Grafana dashboards website](https://grafana.com/grafana/dashboards/?dataSource=mssql) and pick dashboard id you are interested on. And copy dashboardId

![alt text](assets/image-4.png)

In your grafana panel click "import dashboard"

![alt text](assets/image-5.png)

and paste copied dashboardId and click load

![alt text](assets/image-6.png)

pick mssaql data source and click "import"

![alt text](assets/image-7.png)

Dashboard should read some data

![alt text](assets/image-8.png)

