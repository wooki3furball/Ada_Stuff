# Ada_Stuff
Ada Programming Language Code Examples

Author: Michael Bopp
Last Edited: 07/04/24

#Prepare Environment Variables
If you are planning to use Docker you'll need to set an environment variable.

``` powersherll
# Windows
# Path to project: i.e. <driveletter:\...\CS330_Presentation>
$env:BUILD_CONTEXT="insert file path here"

# Clear env var if a mistake occurs
Remove-Item Env:BUILD_CONTEXT
```

``` bash
# Unix OSes
# Path to project
export BUILD_CONTEXT="/path/to/directory"

# Might need to source or restart shell after export
source ~/.bashrc

# Clear env var
unset BUILD_CONTEXT
```
