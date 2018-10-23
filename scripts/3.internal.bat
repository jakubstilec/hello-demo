Echo Updating azure-pipelines.yml with changes from Arcade repo
copy %~dp0internal\azure-pipelines.yml \demo\hello-demo\azure-pipelines.yml

cd \demo\hello-demo
git remote add dnceng https://dnceng.visualstudio.com/internal/_git/hello-demo

start microsoft-edge:https://dev.azure.com/dnceng/public/internal%%20Team/_build
git diff