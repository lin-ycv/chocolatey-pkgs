# Chocolatey packages

For chocolatey packages maintained by me.

## Clone one package manifest

To clone just one package manifest instead of everything

```
git clone --filter=blob:none --no-checkout --depth 1 https://github.com/lin-ycv/chocolatey-pkgs.git
cd chocolatey-pkgs
git sparse-checkout set --cone
git checkout main
git sparse-checkout set <PATH/TO/FOLDER/> <OPTIONAL/PATH/TO/FOLDER2/>
```