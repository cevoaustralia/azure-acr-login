# Azure Container Registry (ACR) Login plugin

A [Buildkite plugin](https://buildkite.com/docs/agent/v3/plugins) for logging into Azure Container Registry to get access to private docker repos. Note: you will need to be logged into the Azure Command Line Interface to use this plugin:

## Examples

The following pipeline will log into Azure CLI with the [azure-login plugin](https://github.com/cevoaustralia/azure-login-buildkitke-plugin), then login to ACR before building and pushing a docker container using the docker-compose plugin
```yml
steps:
  - label: ":docker: Build App Container"
    plugins:
      - cevoaustralia/azure-login#v0.0.1:
      - cevoaustralia/azure-acr-login#v0.0.1:
          name: MyACR
      - docker-compose#3.0.1:
          build: app
          image-repository: <MyACRRAddress>/my_awesome_app

```


## Configuration

### Required

#### `name` (string)

Name of the Azure Container Registry to connect to. 

Note: this is the `Name` of the ACR (e.g. `MyACR`), _not_ the login server address (e.g. `myacr.azurecr.io`)