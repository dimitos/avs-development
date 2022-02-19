# Компания AVS Development Екатеринбург строительный портал
*[https://avs.intopweb.ru/](https://avs.intopweb.ru/ "AVS Development")*

## Установка зависимостей

```bash
composer install
```

```bash
npm install
```

## Папки артефактов сборки фронтенда

Создать следующие каталоги:

- `/dist/css/dev`
- `/dist/css/prod`
- `/dist/js`

## Таски Gulp

- `styles` - билдит стили
- `scripts` - билдит скрипты
- `build` - билдит стили и скрипты
- `default` - билдит стили, скрипты и поднимает dev-сервер для локальной разработки

## Запуск dev-сервера для локальной разработки

```bash
npm run serve
```

или

```bash
npx gulp
```
