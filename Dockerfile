# Установка базового образа со всем необходимым для сборки Flutter приложения
FROM cirrusci/flutter:stable as build

# Копируем код приложения
WORKDIR /app
COPY . .

# Делаем билд приложения
RUN flutter pub get
RUN flutter build apk --release -v

# Создаем свежий образ, где будут только наши артефакты
FROM alpine:latest

WORKDIR /app

COPY --from=build /app/build/app/outputs/apk/release .
ENTRYPOINT ["top", "-b"]