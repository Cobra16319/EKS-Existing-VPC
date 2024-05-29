# Deploy EKS to an Existing VPC 
How to deploy EKS into existing VPC

``
git clone # {your cloned repo url}
``  

``
terraform init
``  

``
terraform plan
``  

``
terraform apply
``  

#You can install this to make it faster For macOS

``
brew install aws-iam-authenticator
``  

``
aws eks --region us-gov-east-1 update-kubeconfig --name my-eks-cluster
``  


## How to give your EKS Cluster User access to Create Kube resources, Cluster Role, Service Account, Cluster Role Binding, Read secrets and have outbound connectivity

``
kubectl apply -f # The following files in this repo
``  

# For the connection test run 

``
kubectl apply -f connectivity-test.yaml
`` 


``
kubectl logs -f connectivity-test
`` 
