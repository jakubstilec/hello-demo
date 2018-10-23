set demodir=\demo
mkdir %demodir% > nul 2>&1
pushd %demodir%

set arcadedir=%demodir%\arcade
if not exist "%arcadedir%" git clone https://github.com/dotnet/arcade %arcadedir%
cd %demodir%\arcade
git checkout demo

cd %demodir%
set sampledir=%demodir%\arcade-minimalci-sample
if not exist "%sampledir%" git clone https://github.com/dotnet/arcade-minimalci-sample %sampledir%
cd %demodir%\arcade-minimalci-sample
git checkout demo 

cd %demodir%
set hellodir=%demodir%\hello-demo
if not exist "%hellodir%" git clone https://github.com/chcosta/hello-demo %hellodir%

cd %hellodir%
git checkout master
mkdir %hellodir%\eng\common
xcopy /Y/e/s %sampledir%\eng\common %hellodir%\eng\common
copy %sampledir%\global.json %hellodir%\global.json
copy %sampledir%\Directory.Build.props %hellodir%\Directory.Build.props
copy %sampledir%\Directory.Build.targets %hellodir%\Directory.Build.targets
copy %sampledir%\NuGet.config %hellodir%\NuGet.config
copy %sampledir%\Build.cmd %hellodir%\Build.cmd
copy %sampledir%\eng\Versions.props %hellodir%\eng\Versions.props
copy %sampledir%\eng\Version.Details.xml %hellodir%\eng\Version.Details.xml

git status
echo *****************
type %hellodir%\Directory.Build.props
echo *****************
type %hellodir%\Directory.Build.targets
echo *****************
type %hellodir%\eng\Versions.props
echo *****************
type %hellodir%\NuGet.config
echo *****************
type %hellodir%\global.json
