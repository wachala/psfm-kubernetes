gcloud config set project nimble-gate-192018
gcloud config set compute/zone europe-west3-a
gcloud container clusters create iosr-2017-cluster
gcloud container clusters get-credentials iosr-2017-cluster --zone europe-west3-a --project nimble-gate-192018
#Config server
kubectl create -f config-server/deployment-config-server.yaml
kubectl create -f config-server/deployment-config-server-service.yaml

#Eureka
kubectl create -f eureka-server/eureka-deployment.yaml
kubectl create -f eureka-server/eureka-service.yaml

#Parking Lot Service
kubectl create -f parking-lot-service/parking-lot-service-deployment.yaml
kubectl create -f parking-lot-service/parking-lot-service.yaml

#Excel Export Service
kubectl create -f excel-export-service/excel-export-service-deployment.yaml
kubectl create -f excel-export-service/excel-export-service.yaml



##Excel Export Service
kubectl create -f excel-export-service/excel-export-service-deployment.yaml
kubectl expose deployment iosr-excel-export-service --type="LoadBalancer"

#Active MQ
kubectl create -f active-mq-service/active-mq-deployment.yaml
kubectl create -f active-mq-service/active-mq-service.yaml

#Batch Service
kubectl create -f batch-service/batch-service-deployment.yaml
kubectl create -f batch-service/batch-service.yaml

#Event Generator Service
kubectl create -f event-generator/event-generator-service-deployment.yaml
kubectl create -f event-generator/event-generator-service.yaml