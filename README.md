![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)
![Build Status](https://img.shields.io/github/actions/workflow/status/stanleygomes/galilee-walker/deploy.yml)
![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)
![Open Issues](https://img.shields.io/github/issues/stanleygomes/galilee-walker)
![Contributors](https://img.shields.io/github/contributors/stanleygomes/galilee-walker)

# 🐳 Galilee Walker

O objetivo desta imagem é fornecer uma base Ubuntu com customizações úteis para o dia a dia de desenvolvimento. Ela inclui configurações de terminal personalizadas, suporte a exibição de branch do Git, e pode ser facilmente expandida para atender diferentes necessidades de ambientes de desenvolvimento. Ideal para quem busca praticidade, produtividade e um ambiente inicial já otimizado para tarefas comuns.

Este repositório contém uma imagem Docker base utilizando Ubuntu.

## 📋 Requisitos

- Podman (recomendado) ou Docker instalado

## 🛠️ Uso

> 💡 Recomendação: Utilize o Podman como alternativa ao Docker. Os comandos abaixo usam `podman`, mas você pode substituir por `docker` se preferir.

Construa a imagem:
```sh
podman build -t stanleygomes/galilee-walker:latest .
```

Envie para o Docker Hub:
```sh
podman push stanleygomes/galilee-walker:latest
```

Envie para o GitHub Registry:
```sh
podman tag stanleygomes/galilee-walker:latest ghcr.io/stanleygomes/galilee-walker:latest
podman push ghcr.io/stanleygomes/galilee-walker:latest
```

## 💻 Como rodar localmente

1. Construa a imagem:
   ```sh
   podman build -t galilee-walker:local .
   ```

2. Execute o container de forma interativa:
   ```sh
   podman run -it galilee-walker:local
   ```

3. Visualize o container em execução:
   ```sh
   podman ps
   ```

## 🚀 Versionamento, Release e Deploy (CI/CD)

O projeto utiliza um fluxo automatizado de CI/CD para garantir qualidade, versionamento semântico e deploy seguro. Veja como funciona cada etapa:

### a) Pull Request Validation (CI)
- **Quando roda:** Em todo push pull requests.
- **O que faz:**
  - Executa o container para validar se está quebrando.
- **Objetivo:** Garantir que nada é mergeado sem passar por todos os checks de qualidade e testes.

### b) Release Automation (semantic-release)
- **Quando roda:** Em todo push de tags no padrão (vX.X.X).
- **O que faz:**
  - Analisa os commits seguindo Conventional Commits.
  - Gera/atualiza o `CHANGELOG.md` com base nos commits relevantes (feat, fix).
  - Cria uma nova tag de versão semântica.
  - Atualiza arquivos de versão (`build.gradle.kts`, `application.yml`, etc).
  - Abre um Pull Request automático com as alterações de changelog e versionamento.
  - Só gera release se houver commit relevante (`feat`, `fix`).
- **Objetivo:** Garantir versionamento semântico, changelog e versionamento de arquivos sempre corretos e auditáveis.

### c) Deploy
- **Quando roda:** Após o merge do PR de release (ou após a criação de uma nova tag/release na branch principal).
- **O que faz:**
  - Faz o envio da imagem atualizada e versionada para o registry
- **Objetivo:** Garantir que só código validado, testado e versionado chegue ao ambiente de produção.


## 🤝 Como contribuir

Suas contribuições são muito bem-vindas! Para colaborar com o projeto de forma eficiente e seguindo nossas diretrizes, consulte o guia completo no [CONTRIBUTING.md](CONTRIBUTING.md). Lá você encontrará um passo a passo detalhado, padrões de commit, regras de validação e dicas importantes para garantir que sua contribuição seja aceita rapidamente.

## 📜 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.
