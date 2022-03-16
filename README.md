# Flutter Dummy API

A flutter app consuming [dummyapi.io](https://dummyapi.io/)

## Getting Started

Minimum requirements to run this project:

- Flutter 2.10.3
- Dart 2.16.1

To run this project, you need to provide your own `app-id` in `packages/config/lib/src/config_module.dart` like below:

```dart
Config get provideConfig {
  return const Config(
    baseUrl: 'https://dummyapi.io/data/v1',
    apiSecretKey: 'YOUR APP ID HERE',
  );
}

```
