# Dockerfile in action

## Getting started with Dockerfiles

```
cd step-2/nginx
bash build.sh
bash run.sh
```

## Multi-stage build

```
cd step-2/multi-stage
docker build -t multi-stage:1.0 .
bash run.sh
```