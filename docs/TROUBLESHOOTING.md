# Nexum Cloud VPS Client — диагностика / Troubleshooting

[README RU](../README.md) · [README EN](../README.en.md)

## RU

**Не открывается браузер или вход не завершается.** Запустите `nexum-cloud-client.exe --server https://stage.nexum-mcp.ru status` и убедитесь, что сервер доступен. Затем `connect`. Браузер должен открыться и завершить согласие в пределах срока ожидания. Не вставляйте код подтверждения в чат и не сохраняйте его в логах.

**Окно клиента закрывается.** Запускайте `Connect-Nexum-Cloud-VPS.cmd` из распакованной папки. Для диагностики откройте PowerShell и выполните команду вручную — текст ошибки останется в терминале.

**MCP не подключается в AI-приложении.** Windows-клиент и MCP-подключение AI-приложения — разные авторизации. Убедитесь, что VPS-клиент работает, затем проверьте `https://stage.nexum-mcp.ru/mcp` в настройках AI-приложения и завершите отдельный OAuth flow.

**Устройство не показывается.** Проверьте выбранный сервер, аккаунт и соответствующий Agent. Не смешивайте Cloud VM `nexum.home.arpa` с публичным VPS `stage.nexum-mcp.ru`.

**Обновление.** Скачайте [последний релиз](https://github.com/TheLane/nexum-cloud-vps-client/releases/latest), сверьте SHA и протестируйте новую распакованную копию, не удаляя заранее рабочую.

## EN

**Login does not finish:** Run `nexum-cloud-client.exe --server https://stage.nexum-mcp.ru status`, then `connect`, complete browser approval before timeout. Never share OAuth codes.

**Window closes:** Extract the ZIP fully; launch `Connect-Nexum-Cloud-VPS.cmd` or run the executable in an existing PowerShell window to see the exit reason.

**AI MCP offline:** Local Windows client enrollment and remote AI-client MCP authorization are separate. Make sure the Windows client is running, use `https://stage.nexum-mcp.ru/mcp` and authorize the AI application separately.

**Missing device:** Verify you selected the VPS origin and correct account, not the unrelated developer VM origin.

**Updating:** Download and checksum the [latest release](https://github.com/TheLane/nexum-cloud-vps-client/releases/latest), test it independently, keep the known-good binary until accepted.
