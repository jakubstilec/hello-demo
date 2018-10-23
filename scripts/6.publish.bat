copy %~dp0depflow\azure-pipelines.yml \demo\hello-demo\azure-pipelines.yml
start microsoft-edge:https://dev.azure.com/dnceng/internal/_build/index?definitionId=201
git diff