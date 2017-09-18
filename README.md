# Registro de logs

API para registro de logs feita em Ruby On Rails.

Para rodar basta ter Docker e Compose instalados e rodar o comando

```
docker-compose up
```

Também contém uma interface simples para teste feita com AngularJS e Bootstrap, rodando em um container nginx.

Além das gems padrão, utilizei rack para resolver o CORS.

A aplicação está hospedada em um droplet da DigitalOcean.

O frontend pode ser acessado através do link
```
http://165.227.223.233/
```

Já a API pode ser acessada pelo mesmo IP, na porta 3000.
