# Chocolatey packages

For chocolatey packages maintained by me.

## Clone one package manifest

To clone just one package manifest instead of everything

1. `git clone --filter=blob:none --no-checkout --depth 1 https://github.com/lin-ycv/chocolatey-pkgs.git`
2. `cd chocolatey-pkgs`
3. `git sparse-checkout set --cone`
4. `git sparse-checkout set <PATH/TO/FOLDER/>`
5. `git checkout main`