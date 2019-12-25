docker build -t v1c70r/multi-client:latest -t v1c70r/multi-client:$SHA -f ./client/Dockerfile ./client && \
docker build -t v1c70r/multi-server:latest -t v1c70r/multi-server:$SHA -f ./server/Dockerfile ./server && \
docker build -t v1c70r/multi-worker:latest -t v1c70r/multi-worker:$SHA -f ./worker/Dockerfile ./worker && \
docker push v1c70r/multi-client:latest && \
docker push v1c70r/multi-server:latest && \
docker push v1c70r/multi-worker:latest && \
docker push v1c70r/multi-client:$SHA && \
docker push v1c70r/multi-server:$SHA && \
docker push v1c70r/multi-worker:$SHA && \
kubectl apply -f k8s && \
kubectl set image deployments/client-deployment client=v1c70r/multi-client:$SHA && \
kubectl set image deployments/server-deployment server=v1c70r/multi-server:$SHA && \
kubectl set image deployments/worker-deployment worker=v1c70r/multi-worker:$SHA && \
echo done
