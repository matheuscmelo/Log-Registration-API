# Registro de logs

API para registro de logs feita em Ruby On Rails.

Para rodar basta ter Docker e Compose instalados e rodar o comando

```
docker-compose up
```

Também contém uma interface simples para teste feita com AngularJS e Bootstrap, rodando em um container nginx.

Além das gems padrão, utilizei rack para resolver o CORS.

A API possui os seguintes endpoints:

| Metodo | Endpoint(/api/v1/...) | Resultado |
|---|---|---|
| POST | logs/ | Cadastra um novo log |
| GET | logs/ | Retorna a lista de todos os logs cadastrados |
| GET | logs/{id} | Retorna o log com o id determinado |
| GET | context/{contexto} | Retorna uma lista de logs com o contexto determinado |
| GET | context/{contexto}/metrics/averagePerHour/ | Retorna a media de logs/hora no contexto determinado |
| GET | context/{contexto}/metrics/hourWithMostLogs/ | Retorna a hora com mais logs no contexto determinado |
| GET | context/{contexto}/metrics/hourWithLeastLogs/ | Retorna a hora com menos logs no contexto determinado |
| GET | context/{contexto}/metrics/logsToday/ | Retorna uma lista com os logs feitos no dia em que a requisição é feita |
| GET | hour/{hora} | Retorna uma lista com os logs feitos em uma determinada hora |

