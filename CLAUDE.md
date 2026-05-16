# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
flutter pub get          # Install dependencies
flutter run              # Run the app on connected device/emulator
flutter analyze          # Static analysis (flutter_lints)
flutter test             # Run all tests
flutter test test/widget_test.dart  # Run a single test file
```

## Architecture

This is a Flutter app using **GetX** for state management, routing, and localization.

### Package name

`sweetify_app` — used in all import paths (e.g., `import 'package:sweetify_app/controller/...'`).

### Folder structure under `lib/`

`controller/` → GetxController subclasses, `view/` → screens & reusable widgets, `model/` → plain Dart models, `localization/` → translation keys + MyLocalController, `utils/` → MuBindings (DI), ` services/` → GetxService subclasses.

> **Important:** The services folder has a leading space in its name on disk (` services/`). Dart import paths must encode this as `%20`: `import 'package:sweetify_app/%20services/settings_services.dart'`. When adding new service files, place them in the same ` services/` folder and use the same `%20` encoding in imports.

### State management pattern

- All state lives in `GetxController` / `GetxService` subclasses.
- Reactive fields use `.obs` (e.g., `RxBool showPass = true.obs`).
- Register dependencies in `lib/utils/mu_bindings.dart` (`MuBindings` implements `Bindings`). Use `Get.lazyPut(..., fenix: true)` for screen-scoped controllers so they recreate on re-entry.
- Permanent singletons (services, locale controller) are registered with `permanent: true`.

### Navigation

Named routes are defined in `lib/main.dart`. Use `Get.toNamed('/routeName')` / `Get.offAllNamed(...)`. Route names follow the pattern `/<ScreenName>` in camelCase (e.g., `/signInScreen`).

### Responsive UI

All sizes must go through `flutter_screenutil`. The design base is **375 × 667**. Use `.w`, `.h`, `.sp`, `.r` extension methods on numbers.

### Localization

Language is persisted via `SettingsServices` (SharedPreferences). `MyLocalController` reads the saved locale on startup and falls back to the device locale. Translation strings live in `lib/localization/local.dart`.

### Services / persistence

`SettingsServices` (in ` services/settings_services.dart`) wraps SharedPreferences and is the single place for reading/writing token and language preference. It is initialized with `await Get.putAsync(...)` in `main()` before `runApp`.

### API

Base URL: `https://tullana.toldpath.com/api`  
HTTP calls are made with the `http` package directly inside controllers. Auth token is stored and retrieved via `SettingsServices`.

### HTML content screens

About Us, Privacy Policy, and Terms & Conditions screens render HTML from the API using `flutter_html`. Their data models live in `lib/model/`.
