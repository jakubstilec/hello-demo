# Demo timeline

## Preparation

- Reset https://github.com/chcosta/hello-demo:master to base
- Delete existing build definitions in public and internal project
- Delete Helix token from https://maestro-prod.westus2.cloudapp.azure.com/
- Install MSBuild Binlog viewer
- Install VS Code

## Timeline

https://github.com/dotnet/arcade/blob/master/Documentation/StartHere.md#im-ready-to-get-started-what-do-i-do

### Arcade SDK

Requires: 3 minutes

1. `mkdir demo`

2. `git clone https://github.com/dotnet/arcade`

    a. `git fetch origin`

    b. `git checkout demo`

3. `git clone https://github.com/dotnet/arcade-minimalci-sample`

    a. `git fetch origin`

    b. `git checkout demo`

4. `git clone https://github.com/chcosta/hello-demo`

5. Onboard follow instructions from starthere.md

6. Build

    a. You'll get this error if the dotnet you have on the path is older (fix is to remove the dotnet from your machine)

    `Failed to restore toolset (exit code '1'). See log: D:\demo\hello4\artifacts\log\Debug\ToolsetRestore.binlog`

7. Highlight

    a. Consistent build story in repos, Roslyn, MSBuild, CLI

    b. Consistent folder layout artifacts, packages, etc...

    c. Binlogs

    d. As we'll see, there's a straight-forward path for signing, publishing, etc...

### Azure DevOps Public CI

Requires: 5 minutes

1. Copy arcade-minimalci-sample\azure-pipelines.yml

    a. Comment out unix

    b. Update `_HelixSource`

    c. Add `/p:DotNetSignType=test` to cibuild.cmd

2. push changes to https://github.com/chcosta/hello-demo (master)

3. Create a build definition in https://dev.azure.com/dnceng/public

4. Create a PR to show the Azure DevOps gate is enabled for Pull Requests

### Azure DevOps Internal Build

Requires: 5 minutes

1. Open arcade\.vsts-ci.yml

    a. Copy queue section

2. Highlight agent queues in [VSTS Onboarding](https://github.com/dotnet/arcade/blob/master/Documentation/VSTS/VSTSOnboarding.md#agent-queues) doc

3. Add `enableMicrobuild: true`

4. Add `_SignType: test` to variables

5. Add `/p:DotNetSignType=$(_SignType) /p:TeamName=DotNetCore` to cibuild.cmd step

6. `git remote add dnceng https://dnceng.visualstudio.com/internal/_git/hello-demo`

7. `git push dnceng +master`

8. Go to https://dnceng.visualstudio.com/internal/_build and create a build definition

9. Highlight the MicroBuild plugin is present in the build definition

### Helix

Requires: 4 minutes

1. Follow https://github.com/dotnet/arcade/blob/master/Documentation/VSTS/SendingJobsToHelix.md documentation

### Dependency flow

#### Publishing

Requires 8 minutes

1. Follow steps from https://github.com/dotnet/arcade/blob/master/Documentation/DependencyFlowOnboarding.md#publishing

2. Add `_DotNetPublishToBlobFeed: true` and `_DotNetPublishToBlobFeed: false` to the build matrix

3. Add `continueOnError` to Helix step

4. `git push dnceng master`

5. Build will fail

    a. [Authorize resources](https://github.com/dotnet/arcade/blob/master/Documentation/VSTS/VSTSOnboarding.md#queuing-builds)

6. Schedule another build

    a. Show the publish to bar phase and the asset manifests build steps

#### Validate the publishing

Requires: 2 minutes

1. Jump ahead to https://github.com/dotnet/arcade/blob/master/Documentation/DependencyFlowOnboarding.md#32-set-up-your-darc-client

2. Stop after step 3.2.6

3. https://maestro-prod.westus2.cloudapp.azure.com/swagger/ui/index.html

4. Show the Get Builds API

#### Consume