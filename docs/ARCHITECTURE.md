# Nexum Cloud VPS — архитектура / Architecture

[README RU](../README.md) · [README EN](../README.en.md)

## RU — Что делает публичный Windows VPS-клиент

Клиент `nexum-cloud-client.exe` — отдельное Rust-приложение, запускаемое локально. Оно не подменяет старую установку Nexum и не является сервером сайта `nexum-mcp.ru`.

1. `status` проверяет адрес публичного сервера без авторизации.
2. `connect` выполняет вход в системном браузере через OAuth/PKCE, сохраняет пользовательский грант в Windows Credential Manager, регистрирует клиентское устройство и создаёт исходящее соединение по WSS.
3. Сервер выдаёт отдельные идентификаторы устройств/агентов и проверяет аккаунт, необходимые разрешения, состояние и возможность отзыва.
4. Совместимое AI-приложение независимо авторизуется на `https://stage.nexum-mcp.ru/mcp`; авторизованные вызовы типизированных инструментов маршрутизируются на зарегистрированные устройства.
5. Runtime Host исполняет поддерживаемые операции на компьютере; то, что инструмент виден в каталоге, не гарантирует разрешение на любой вызов.

| Контур / Surface | Назначение / Purpose |
| --- | --- |
| `https://nexum-mcp.ru/` | Публичный информационный сайт, не MCP endpoint |
| `https://stage.nexum-mcp.ru/` | Регистрация, вход и управление аккаунтом |
| `https://stage.nexum-mcp.ru/mcp` | Удалённый MCP endpoint с OAuth |
| Windows VPS Client | Исходящее WSS, регистрация и обслуживание локальных устройств |
| Cloud VM | Независимый контур разработчика; не публичный VPS для пользователей |

Важно: публично распространяются только готовый Windows EXE и документация. Исходники клиента, приватные серверные конфигурации и ключи не публикуются. Перед запуском проверьте SHA-256.

## EN — Public Windows VPS client

The `nexum-cloud-client.exe` is a separate local Rust application; it does not replace legacy Nexum or run the public product website. The `status` command probes the configured server before authentication. The `connect` command opens browser OAuth/PKCE, stores the Windows grant in Credential Manager, enrolls the device and creates an outgoing authenticated WSS connection. Each AI client separately authenticates to the remote OAuth-protected MCP resource. The server validates ownership, grants and operation policy before routing typed tools to a running Agent.

The main website (`nexum-mcp.ru`) is distinct from the public service (`stage.nexum-mcp.ru`) and from the developer Cloud VM. Do not mix device identities or saved OAuth grants across these origins. The repository distributes a compiled Windows executable and documentation only. No client source code or private server credentials are published.
