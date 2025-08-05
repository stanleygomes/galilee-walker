# 🐳 Imagem Docker Galilee Walker 🚀

## 🎯 Objetivo

O objetivo desta imagem é fornecer uma base Ubuntu com customizações úteis para o dia a dia de desenvolvimento. Ela inclui configurações de terminal personalizadas, suporte a exibição de branch do Git, e pode ser facilmente expandida para atender diferentes necessidades de ambientes de desenvolvimento. Ideal para quem busca praticidade, produtividade e um ambiente inicial já otimizado para tarefas comuns.

Este repositório contém uma imagem Docker base utilizando Ubuntu.

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
