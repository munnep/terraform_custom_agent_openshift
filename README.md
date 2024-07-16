[![Publish Docker image](https://github.com/munnep/terraform_custom_agent/actions/workflows/docker_build_image.yaml/badge.svg)](https://github.com/munnep/terraform_custom_agent-openshift/actions/workflows/docker_build_image.yaml)

[![Update docker hub repository overview](https://github.com/munnep/terraform_custom_agent/actions/workflows/docker_description.yaml/badge.svg)](https://github.com/munnep/terraform_custom_agent-openshift/actions/workflows/docker_description.yaml)

# terraform-custom-agent-openshift

This is an example of using the a custom agent with hooks in your environment to use on a FDO deployment with openshift


## Github Actions
The example of this image is automatically build and pushed to Docker Hub [here](https://hub.docker.com/repository/docker/patrickmunne/custom-agent/general) with every tag v*.* that is on the main branch. 


# How to

- clone the repository
```
git clone https://github.com/munnep/terraform_custom_agent.git
```
- Go into the directory
```
cd terraform_custom_agent/
```
- Make sure the hook files have the execution set
```
chmod +x hooks/
```
- Create the agent
```
docker build -t custom-agent .
```
- make sure the agent is being used

Replicated environment:
```
replicatedctl app-config set custom_agent_image_tag --value "custom-agent:latest"
```

FDO environment:
```
TFE_RUN_PIPELINE_IMAGE: "custom-agent:latest"
```
- Restart TFE application to make this changes permanent

Replicated environment:
```
replicatedctl app stop
replicatedctl app start
```

FDO environment:
```
docker compose down
docker compose up --detach
```
