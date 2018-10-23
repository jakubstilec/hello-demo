copy %~dp0helix\azure-pipelines.yml \demo\hello-demo\azure-pipelines.yml
copy %~dp0helix\global.json \demo\hello-demo\global.json
echo "link Helix anonymous to build definition"
start microsoft-edge:https://dev.azure.com/dnceng/public/_build/index?definitionId=197