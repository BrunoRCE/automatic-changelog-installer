# Automatic changelog installer
 ![](https://img.shields.io/badge/script-shell-green)
 
Is a simple script that installs the necessary dependencies and creates the configuration files to lint commits and generate the changelog of your software project

## How to use
As a first step we need to give execution permissions to the file
```
chmod +x automatic_changelog_installer.sh
```
Now we only insert the repository of our project to which we want to install the changelog

![](https://github.com/BrunoRCE/automatic-changelog-installer/blob/main/assets/insert_repository.png?raw=true)

Run the guided commit with commitizen: **npx cz**

![](https://github.com/BrunoRCE/automatic-changelog-installer/blob/main/assets/npx_cz.png?raw=true)

Generate the changelog: **major|minor|patch**

![](https://github.com/BrunoRCE/automatic-changelog-installer/blob/main/assets/npm_run_release.png?raw=true)

View your changelog and have fun

![](https://github.com/BrunoRCE/automatic-changelog-installer/blob/main/assets/changelog.png?raw=true)
