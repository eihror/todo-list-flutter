#!/bin/bash

# Solicita o nome da feature ao usuário
read -p "Digite o nome da feature: " FEATURE_NAME

# Cria as pastas conforme a estrutura desejada
mkdir -p "lib/feature/$FEATURE_NAME/di"

mkdir -p "lib/feature/$FEATURE_NAME/data/data_source/local"
mkdir -p "lib/feature/$FEATURE_NAME/data/data_source/remote"
mkdir -p "lib/feature/$FEATURE_NAME/data/data_source/model"
mkdir -p "lib/feature/$FEATURE_NAME/data/repository"

mkdir -p "lib/feature/$FEATURE_NAME/domain"
mkdir -p "lib/feature/$FEATURE_NAME/domain/use_case"
mkdir -p "lib/feature/$FEATURE_NAME/domain/model"
mkdir -p "lib/feature/$FEATURE_NAME/domain/repository"

mkdir -p "lib/feature/$FEATURE_NAME/presentation"
mkdir -p "lib/feature/$FEATURE_NAME/presentation/navigation"

echo "Estrutura de pastas para a feature '$FEATURE_NAME' criadas com sucesso."