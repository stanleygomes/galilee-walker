![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)
![Build Status](https://img.shields.io/github/actions/workflow/status/stanleygomes/galilee-walker/docker-hub-publish.yaml)
![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)
![Open Issues](https://img.shields.io/github/issues/stanleygomes/galilee-walker)
![Contributors](https://img.shields.io/github/contributors/stanleygomes/galilee-walker)

# 🐳 Galilee Walker

## 🚀 A better Ubuntu container starter

O objetivo desta imagem é fornecer uma base Ubuntu com customizações úteis para o dia a dia de desenvolvimento. Ela inclui configurações de terminal personalizadas, suporte a exibição de branch do Git, e pode ser facilmente expandida para atender diferentes necessidades de ambientes de desenvolvimento. Ideal para quem busca praticidade, produtividade e um ambiente inicial já otimizado para tarefas comuns.

Este repositório contém uma imagem Docker base utilizando Ubuntu.

<p>
  <img src="assets/images/readme.png" alt="Galilee Walker" width="600"/>
</p>

## 📋 Requisitos

- Podman (recomendado) ou Docker instalado.

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
   podman build -t galilee-walker:latest .
   ```

2. Execute o container de forma interativa:
   ```sh
   podman run -it galilee-walker:latest
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

Suas contribuições são muito bem-vindas! Se você tem uma ideia de melhoria, correção de bug ou nova funcionalidade, sinta-se à vontade para abrir uma issue ou pull request. Colaboração e novas perspectivas são altamente valorizadas aqui—vamos construir algo incrível juntos!

Por favor, siga nosso código de conduta em todas as interações com o projeto.

### Passo a passo para contribuir

1. **Crie uma branch**: Sempre crie uma nova branch a partir da `master` usando o padrão `feature/xxx`, `fix/xxx` ou outro prefixo apropriado.

2. **Faça commits pequenos e focados**: Cada commit deve representar uma alteração lógica única. Evite commits grandes com muitas mudanças não relacionadas. Isso facilita a revisão e validação do código.

3. **Padrão de mensagens de commit**: Todos os commits devem seguir a especificação [Conventional Commits](https://www.conventionalcommits.org/pt-br/v1.0.0/) (Versionamento Semântico). Exemplos:
  - `feat: adicionar funcionalidade de login do usuário`
  - `fix: corrigir bug no login`
  - `chore: atualizar dependências`
  - `docs: atualizar README`
  - `test: adicionar testes para login`

> **Recomendações:**
>
> Prefira escrever as mensagens de commit em português e sem acentuação. Isso facilita a padronização e evita problemas de encoding em diferentes sistemas.
>
> Apenas commits do tipo `feat` e `fix` geram tag de deploy e disparam uma release. Outros tipos como `chore`, `docs`, `test`, etc., não geram tag de deploy.
>
> Commits que não seguirem esse padrão **não** serão mergeados, pois quebram o processo de geração de release.
>
> Nem todos os commits precisam ser `feat` ou `fix`, mas sempre use o tipo correto para sua alteração.

4. **Pull Request (PR)**: Abra um PR para a `master` com um título claro e descritivo. Na descrição do PR, explique o que está sendo feito e por quê. Referencie issues relacionadas, se aplicável.

5. **Validação**: O workflow do PR irá validar seu código. Só é possível fazer merge se **todos os checks passarem**.

6. **Release e Deploy**: Para detalhes sobre deploy e versionamento, consulte a [seção de Versionamento no README.md](./README.md).

   > **Importante:** O Pull Request só será aceito se passar por todos os checks automáticos definidos no workflow `pr-checks.yml`.

Esse fluxo garante qualidade, rastreabilidade e entrega contínua de valor. Seguindo essas orientações você evita erros e agiliza o processo de revisão e release.

## 📜 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.
