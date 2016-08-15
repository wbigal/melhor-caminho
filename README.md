# Melhor Caminho

<img alt="Status?branch=master" src="https://www.codeship.io/projects/fa821e30-44d3-0134-8e29-02154be91b77/status?branch=master" />

Este projeto utiliza o Google Directions API para traçar a melhor rota entre a 
localização do usuário até uma localização pré-definida.

O Melhor Caminho utiliza o Ruby 2.3.1 e Rails 5.0, MongoDB, Heroku e Codeship.

URL do site: https://melhor-caminho.herokuapp.com/

## Configurando variáveis de ambiente local

Para rodar o projeto é necessário criar o arquivo `.env` na raíz do projeto. Utilize o arquivo `.env.sample` como modelo, mas não altere as chaves `LATITUDE_DEFAULT_DESTINATION` e `LONGITUDE_DEFAULT_DESTINATION` para não confundir o webmock.

## Rodando local com Docker

Para executar com Docker é necessário ter o Docker já configurando.

- Para subir o ambiente pela primeira vez: `./docker-setup.sh`

- Para subir o ambiente as demais vezes: `./docker-up.sh`

## Rodando local sem Docker

Para rodar sem docker você precisa ser disponível um servidor do MongoDB.

Rodando sem o Docker é possível utilizar o *guard* para rodar os testes sempre que um arquivo for modificado, execute no terminal: `guard`
