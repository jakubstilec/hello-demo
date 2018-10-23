Echo copying azure-pipelines.yml from arcade-minimalci-sample repo with minor changes
copy %~dp0ci\azure-pipelines.yml \demo\hello-demo\azure-pipelines.yml
start microsoft-edge:https://dev.azure.com/dnceng/public/public%%20Team/_build
code \demo\hello-demo\azure-pipelines.yml