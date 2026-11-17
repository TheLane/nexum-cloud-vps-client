# Nexum VPS Client — security / Безопасность

[RU](#русский) · [EN](#english)

## Русский

- Авторизация пользователя выполняется **через браузер и OAuth/PKCE**, а не передачей пароля в CLI. Не отправляйте пароль, OAuth-код или токен сторонним лицам.
- Клиент требует **HTTPS** для удалённого сервера, а устройство поддерживает исходящее защищённое соединение. Не открывайте входящие порты для Nexum.
- Сохранённые Windows OAuth-гранты находятся в **Windows Credential Manager**; регистрация и Agent принадлежат выбранному серверному origin. Не переносите файлы учётных данных между устройствами.
- **Модель полномочий:** владелец аккаунта, отдельно зарегистрированные устройства, проверка возможностей каждого инструмента, серверная квота и отзыв разрешений. Видимость инструмента ≠ автоматическое разрешение на его вызов.
- Инструменты с изменением файлов, процессами или внешними запросами потенциально опасны. Работайте только с собственными доверенными устройствами; контролируйте выдачу прав AI-приложениям.
- Скачивайте Windows-пакет из **официального GitHub Releases**, сверяйте SHA-256. Подпись Windows Authenticode для этого выпуска **не заявлена**.
- Не передавайте секреты в Issues, crash logs, скриншотах или публичном сайте. При обнаружении уязвимости не публикуйте эксплойт и данные аккаунта; сначала свяжитесь с владельцем репозитория приватным способом.
- Версия веб-интерфейса или мобильного агента может отличаться от Windows-клиента; не воспринимайте описания будущих функций как гарантию их наличия.

## English

- Account login takes place in the system browser using **OAuth/PKCE**, not by passing credentials on the command line.
- The client uses authenticated outbound connectivity and HTTPS/WSS. Do not expose inbound ports.
- Saved Windows OAuth grants reside in **Windows Credential Manager**. Device identities are server-origin scoped.
- The service checks account/device ownership and tool-specific permission. Catalog visibility is **not** a blanket authorization to execute commands.
- File changes, process execution and network operations may have consequences; only connect devices you own and review permissions granted to AI applications.
- Download from the official GitHub Releases page, verify SHA-256. **No Authenticode code-signing claim is made** for this build.
- Never post API keys, tokens, passwords, authentication URLs or private files in public issues.
