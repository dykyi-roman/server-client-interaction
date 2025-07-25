# Server-Client Interaction

[![PHP Version](https://img.shields.io/badge/PHP-8.4-blue.svg)](https://www.php.net/releases/8.4/en.php)
[![Symfony Version](https://img.shields.io/badge/Symfony-7.2-brightgreen.svg)](https://symfony.com/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

A comprehensive demonstration of various server-client interaction methods and protocols implemented with PHP 8.4 and Symfony 7.2.

## Table of Contents

- [Overview](#overview)
- [Available Routes](#available-routes)
- [Console Commands](#console-commands)
- [Protocols and Technologies](#protocols-and-technologies)
  - [SOAP](#soap)
  - [Mercure (SSE)](#mercure-sse)
  - [Centrifugo (WebSocket)](#centrifugo-websocket)
  - [Pusher](#pusher)
  - [WebSocket](#websocket)
  - [SSE](#sse)
  - [GraphQL](#graphql)
  - [Long Polling](#long-polling--data-storage)
  - [Redis Pub/Sub](#redis-pubsub)
  - [RabbitMQ (STOMP)](#rabbitmq-stomp)
  - [Kafka](#kafka)
  - [JWT](#jwt)
- [Installation](#installation)
- [Author](#author)

## Overview

This project demonstrates different approaches to server-client communication, including real-time messaging, event streaming, and API protocols. Each implementation showcases a specific technology with practical examples.

## Available Routes

| Route                    | Description     |
|--------------------------|-----------------|
| `/soap`                  | SOAP server     |
| `/graphql`               | GraphQL server  |
| `/soap/push/{count}`     | Push N messages |
| `/mercure/push/{count}`  | Push N messages |
| `/centrifugo/push/{count}` | Push N messages |
| `/pusher/push/{count}`   | Push N messages |
| `/graphql/push/{count}`  | Push N messages |
| `/sse/push/{count}`      | Push N messages |
| `/long-pull/push/{count}`| Push N messages |
| `/websocket/push/{count}`| Push N messages |
| `/rabbitmq/push/{count}` | Push N messages |
| `/kafka/push/{count}`    | Push N messages |
| `/redis/push/{count}`    | Push N messages |

## Console Commands

| Command                | Description         |
|------------------------|---------------------|
| `app:websocket:start`  | WebSocket server    |
| `app:rabbitmq:subscribe` | RabbitMQ subscriber |
| `app:kafka:subscribe`  | Kafka subscriber    |
| `app:redis:subscribe`  | Redis subscriber    |

## Protocols and Technologies

### SOAP

<img src="docs/soap.png" width="500" alt="SOAP Architecture" />

**Simple Object Access Protocol** is a protocol used for exchanging structured information in web services. It uses XML for its message format and typically relies on HTTP or SMTP for message negotiation and transmission.

### Mercure (SSE)

**Mercure** is a protocol allowing to push data updates to web browsers and other HTTP clients in a convenient, fast, reliable and battery-efficient way. It is especially useful to publish real-time updates of resources served through web APIs, to reactive web and mobile apps.

**Resources:**
- [Component](https://github.com/dunglas/mercure)
- [Protocol Specification](https://github.com/dunglas/mercure/blob/master/spec/mercure.md)
- [Website](https://mercure.rocks)
- [Demo](https://demo.mercure.rocks/)

### Centrifugo (WebSocket)

<img src="docs/centrifugo.png" width="500" alt="Centrifugo Architecture" />

**Centrifugo** is a real-time messaging server and its friends. Centrifugal organization provides a set of tools to add real-time features to your web/mobile/desktop application. It brings together several repositories linked by a common purpose – give you a complete and ready to use solution when you want to add real-time events into your application.

**Resources:**
- [Component](https://github.com/centrifugal/centrifugo)
- [Documentation v1](https://centrifugal.github.io/centrifugo/)
- [Documentation v2](https://github.com/oleh-ozimok/php-centrifugo)
- [Demo](https://centrifugo.herokuapp.com/#/)

### Pusher

**Pusher** allows you to easily build scalable realtime graphs, geotracking, multiplayer games, and more in your web and mobile apps with a hosted pub/sub messaging API.

**Resources:**
- [Website](https://www.pusher.com)
- [Component](https://github.com/pusher/pusher-http-php)
- [Documentation](https://pusher.com/docs)

### WebSocket

<img src="docs/websocket.png" width="500" alt="WebSocket Architecture" />

**WebSocket** is a communication protocol that provides full-duplex communication channels over a single, long-lived TCP connection. Unlike traditional HTTP, which follows a request-response model, WebSocket allows for persistent connections, enabling real-time data exchange between the client and server.

### SSE

<img src="docs/sse.png" width="500" alt="SSE Architecture" />

**Server-Sent Events (SSE)** is a technology that allows a server to send real-time updates to the client over HTTP. Unlike WebSockets, SSE is a one-way communication channel from the server to the browser, and it is simpler to implement for use cases like live feeds, notifications, or streaming updates.

### GraphQL

<img src="docs/graphQL.png" width="500" alt="GraphQL Architecture" />

**GraphQL** is a query language for APIs and a runtime for executing those queries by using a type system you define for your data. Developed by Facebook in 2012 and open-sourced in 2015, it offers a more flexible and efficient alternative to REST.

### Long Polling + Data Storage

<img src="docs/long_polling.png" width="500" alt="Long Polling Architecture" />

**Long Polling** is a technique where the client sends a request to the server and waits for a response. The server holds the request open until it has new data to send back or until a timeout occurs. Long Polling is a low-overhead approach suitable for projects with a low volume of clients and a low frequency of updates.

### Redis Pub/Sub

<img src="docs/redis.png" width="500" alt="Redis Pub/Sub Architecture" />

**Redis Pub/Sub** is a messaging pattern provided by Redis, allowing message exchange between producers and consumers in a decoupled way. It is used for real-time messaging systems, notifications, and broadcasting updates to multiple subscribers.

### RabbitMQ (STOMP)

<img src="docs/rabbitMQ.png" width="500" alt="RabbitMQ Architecture" />

**RabbitMQ** is an open-source message-broker software (sometimes called message-oriented middleware) that originally implemented the Advanced Message Queuing Protocol (AMQP) and has since been extended with a plug-in architecture to support Streaming Text Oriented Messaging Protocol (STOMP), Message Queuing Telemetry Transport (MQTT), and other protocols.

**Resources:**
- [Website](https://www.rabbitmq.com/)
- [Component](https://github.com/php-amqplib/php-amqplib)
- [Documentation](https://www.rabbitmq.com/documentation.html)

### Kafka

<img src="docs/kafka.png" width="500" alt="Kafka Architecture" />

**Apache Kafka** is an open-source distributed event streaming platform. Originally developed by LinkedIn and later donated to the Apache Software Foundation, Kafka is designed to handle real-time data feeds. It is used for building real-time data pipelines and streaming applications.

### JWT

**JSON Web Token (JWT)** is an open standard (RFC 7519) that defines a compact and self-contained way for securely transmitting information between parties as a JSON object. Although JWTs can be encrypted to also provide secrecy between parties, we will focus on signed tokens.

**Resources:**
- [Website](https://jwt.io/)
- [Documentation](https://jwt.io/introduction/)

## Installation

```bash
# Clone the repository
git clone https://github.com/dykyi-roman/server-client-interaction.git
cd server-client-interaction

# Install dependencies using Make
make install

# Start the application
make up
```

For more commands, run `make help`.

## Author

[Dykyi Roman](https://www.linkedin.com/in/roman-dykyi-43428543/), e-mail: [mr.dukuy@gmail.com](mailto:mr.dukuy@gmail.com)
