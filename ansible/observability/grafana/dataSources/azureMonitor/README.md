## Using Azure Monitor Integration

### 1. Create application register in Azure panel.

![alt text](assets/image-10.png)

search "App registrations" and click

Register app name with default options

![alt text](assets/image-11.png)

copy ids: 
![alt text](assets/image-12.png)

later you will need:
- Directory (tenant) ID
- Application (client) ID
- Client Secret

### 2. Generate Client Secret

Click "Add certificate or secret", then click "New client secret"


Type name and set expiration
![alt text](assets/image-14.png)

Effect should looks like this
![alt text](assets/image-13.png)

this client secret will be used later

### 3. Assigne role to application

Go to App Registrations

![alt text](assets/image-16.png)

and click your app registration

 and select IAM access controll

![alt text](assets/image-15.png)


then in left menu click to Access controll (IAM)

and click "Add", then "add role assgignment"

![alt text](assets/image.png)

Select role "Reader" 
![alt text](assets/image-1.png)

and click "next" at the bottom

![alt text](assets/image-2.png)

Then select click "+ Select members" and type registered name in popup windows on right

![alt text](assets/image-3.png)

then click "Select"

After that click "Review + assign".


### 4. Set data source in grafana

Go to grafana panel, then in left menu "Connections -> Data Source -> Add new Data source -> Type Azure Monitor and click.

You will have to provide credentials for registered app mentioned above


![alt text](assets/image-4.png)

Click Save & test. Don't forget to select default subscription. 

### 5. Import dashboard

Go to [Grafana dashboards website](https://grafana.com/grafana/dashboards/?dataSource=mssql) and pick dashboard id you are interested on. And copy dashboardId. there are many different dashboards depend on resources you use. 

![alt text](../SqlServer/assets/image-4.png)

In your grafana panel click "import dashboard"

![alt text](../SqlServer/assets/image-5.png)

and paste copied dashboardId and click load

![alt text](../SqlServer/assets/image-6.png)

pick azure monitor data source and click "import"

Dashboard should read some data

Example dashboard for virtual machine

![alt text](image-5.png)
