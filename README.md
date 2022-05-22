# Assignment 01:

# Deploy a web hosting service using kubernetes
************************************************************************************************************

Install Kubernetes with master and worker Node

Create a Nginx Pod  (web hosting service)

deploy the pod 

Create a deployement file of Nginx

Deploy it. 

Create an service of Nginx Pod and host into the web browser  
 
# System Requirement:
************************************************************************************************************

Os: ubuntu 20.04LTS

instance: aws-ec2


ram: 2 GB(master node)

cpu  2 (master node)

ram: 1 GB(worker node)

cpu  1 (worker node)

remote tool: vscode  

****************************************************************************************************************************

# Nginix deploy using kubernetes UBUNTU 20.04 LTS

firstly,
   
   1.git pull using the command 
         
      #sudo git clone -b Project01 https://github.com/striketm98/kubernetes-Tutorial.git
   
  2. Edit the yaml as per convenience:
      
      #vim /Project01_kubernetes/nginix-pod-deployment-service.yaml

  3. apply the command: 
      
      #sudo kubectl apply -f nginix-pod-deployment-service.yaml
      
 4. serach in Browser usnig any serach engine: 
      
      #http://<server_ip>/<dns>:30080 
        





   
