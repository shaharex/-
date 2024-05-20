# Attendance Checker

Attendance Checker - это приложение для отслеживания посещаемости сотрудников. Оно позволяет пользователям регистрировать время входа и выхода сотрудников, а также вести учет всех посещений. Приложение использует локальную базу данных Hive для хранения данных, что обеспечивает быстрый и надежный доступ к информации.

## Основные функции

- **Запись времени входа и выхода:** Пользователи могут регистрировать время входа и выхода сотрудников с помощью уникальных идентификаторов.
- **Поиск по базе данных:** Возможность поиска записей по ID сотрудников в базе данных.
- **Локальное хранение данных:** Использование Hive для локального хранения данных, что обеспечивает высокую производительность и доступность без необходимости в интернете.
- **Поддержка временных зон:** Приложение корректно обрабатывает временные зоны, обеспечивая точность времени регистрации.

## Скриншоты

| Скриншот 1                                                                                          | Скриншот 2                                                                                               |
|------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------|
| ![workers_main](https://github.com/shaharex/Attendance-Checker/assets/155885618/463bbd45-9289-4aa2-a831-598af8033ea9) | ![worker_add](https://github.com/shaharex/Attendance-Checker/assets/155885618/953f63a6-fc4a-45e4-aaa7-91995dd249bc) |
| Скриншот 3                                                                                          | Скриншот 4                                                                                               |
| ![worker_add_filled](https://github.com/shaharex/Attendance-Checker/assets/155885618/bedcdc82-c542-4fd0-88bf-22b80b7ad9aa) | ![workers_main_added](https://github.com/shaharex/Attendance-Checker/assets/155885618/1e2fe4df-6dde-4cbb-bc1a-08f0421399e9) |
| Скриншот 5                                                                                          | Скриншот 6                                                                                               |
| ![workers_search](https://github.com/shaharex/Attendance-Checker/assets/155885618/57bfb56e-3851-4c29-8504-2219ebf1fb3b) | ![exit_page](https://github.com/shaharex/Attendance-Checker/assets/155885618/a1ee34ba-8df5-4b4f-a075-21b1203affd6) |
| Скриншот 7                                                                                          | Скриншот 8                                                                                               |
| ![enter_page](https://github.com/shaharex/Attendance-Checker/assets/155885618/cc325935-a7d3-485a-936c-27b86feccb5f) | ![enter_search](https://github.com/shaharex/Attendance-Checker/assets/155885618/56012bc1-d221-40b8-9a8c-6a7dd9f581c8) |

## Установка

1. Установите Flutter, следуя инструкциям на официальном сайте: [Flutter installation guide](https://flutter.dev/docs/get-started/install).
2. Клонируйте репозиторий:
    ```bash
    git clone https://github.com/shaharex/Attendance-Check.git
    ```
3. Перейдите в директорию проекта:
    ```bash
    cd Attendance-Checker
    ```
4. Установите зависимости:
    ```bash
    flutter pub get
    ```
5. Запустите приложение на эмуляторе или реальном устройстве:
    ```bash
    flutter run
    ```


