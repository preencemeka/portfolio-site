az ad sp create-for-rbac \
  --name github-actions-cicd \
  --role contributor \
  --scopes /subscriptions/043f08d1-d824-4b48-b764-b57bc344bdb8/resourceGroups/cicd-rg \
  --sdk-auth
