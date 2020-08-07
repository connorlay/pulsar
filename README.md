# Pulsar

Pulsar is an example application that implements periodic, distributed jobs in Elixir.

## Requirements

Docker and Docker Compose

## Usage

1. Clone the repo
```
git clone git@github.com:connorlay/pulsar.git
```

2. Build images
```
docker-compose build
```

3. Start the application with multiple replicas
```
docker-compose up --scale app=3
```
