## Rough Architecture as below   


![image](https://user-images.githubusercontent.com/38589884/152114567-24246b93-45cd-4e3e-afc7-ff4f24b6fe85.png)  

# Assumptions  
1.Already have vpc with 3 subnet for private , public and DB  
2.Using public NLB for easy demo to front HA nodes  
3.ETCD installed on same node as patroni , for production use case this will be installed on different node  
4.Docker compose and HA config file is in AMI , auto-scale will spin up EC2 and user data will create container with defined config  
5.Secrets kept in jinja directly as this is POC , we do not pratice this otherwise  

# Requirnment  
terraform v 0.12.6  

# POC proofs  
![image](https://user-images.githubusercontent.com/38589884/152117602-99a04e0d-a1bf-452d-b4d0-c2529136cbdf.png)    
![image](https://user-images.githubusercontent.com/38589884/152115191-ccfda95a-ebbb-43d6-bbd1-73660cf52016.png)  

