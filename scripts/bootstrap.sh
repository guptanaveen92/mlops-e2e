#!/bin/bash

set -e

# Bootstrap the MLOps infrastructure

pushd ./infrastructure
echo 'Installing dependencies'
yarn

echo 'Deploying Insfrastructure in your AWS account'
yarn cdk --profile mlops bootstrap --cloudformation-execution-policies arn:aws:iam::525419040953:policy/MlOps aws://525419040953/ap-south-1
yarn cdk --profile mlops deploy --require-approval never

popd