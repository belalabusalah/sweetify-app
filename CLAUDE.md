# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
flutter pub get          # Install dependencies
flutter run              # Run the app_routes on connected device/emulator
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

> **Important:** The services folder has a leading space in its name on disk (` services/`). Dart import paths must encode this as `%20`: `import 'package:sweetify_app/%20services/settings_services.dart'`. When adding new service files, place them in the same ` services/` folder and use the same `%20` encoding in imports. The one exception is relative imports from within `lib/utils/`, which use `'../ services/...'`.

### State management pattern

- All state lives in `GetxController` / `GetxService` subclasses.
- Reactive fields use `.obs` (e.g., `RxBool showPass = true.obs`).
- Register dependencies in `lib/utils/mu_bindings.dart` (`MuBindings` implements `Bindings`). Services must be registered before controllers that depend on them.
- Use `Get.lazyPut(..., fenix: true)` for screen-scoped controllers (auth screens) so they recreate on re-entry.
- Use `Get.put(...)` for controllers that must always be active (e.g., `AddressController`, `SupportController`).
- Permanent singletons (services, locale controller) are registered with `permanent: true`.

### Service / Controller split

Each feature uses a two-layer pattern:
- **Service** (`GetxService`) — owns HTTP calls, returns parsed models or error strings. Stateless beyond the token/HTTP client.
- **Controller** (`GetxController`) — holds reactive state (`RxList`, `RxBool`), calls the service, and updates state. Screens bind to the controller only.

`AddressController` / `GetAddressListService` is the canonical example: the service does all HTTP, the controller owns `addresses`, `isLoading`, and `isSaving`.

### Navigation

Named routes are defined in `lib/main.dart`. Use `Get.toNamed('/routeName')` / `Get.offAllNamed(...)`. Route names follow the pattern `/<ScreenName>` in camelCase.

Full route list: `/splashScreen`, `/determineEntryScreen`, `/signInScreen`, `/signUpScreen`, `/homeScreen`, `/profileScreen`, `/aboutUsScreen`, `/privacyPolicyScreen`, `/termsConditionsScreen`, `/supportScreen`, `/addressScreen`, `/addressFormScreen`, `/wishListScreen`, `/paymentScreen`, `/detailsScreen`, `/cardScreen`.

To pass data between screens use `Get.toNamed('/route', arguments: value)` and read it back with `Get.arguments` in `initState`. `AddressFormScreen` uses this: a `null` argument means add-mode, an `AddressData` argument means edit-mode.

### Bottom navigation + drawer

`HomeScreen` hosts the main shell. Bottom tab index lives in `MainNavigationController` (`currentIndex.obs`). `CustomBottomNavigationBar` (in `view/widgets/bottom_navigation_bar_section.dart`) wraps `salomon_bottom_bar` and takes `currentIndex` + `onTap` from the controller via `Obx`. The side drawer (`CustomDrawer` in `view/widgets/menu_section.dart`) renders the full profile UI using the same profile sub-components as `ProfileScreen`.

### Responsive UI

All sizes must go through `flutter_screenutil`. The design base is **375 × 667**. Use `.w`, `.h`, `.sp`, `.r` extension methods on numbers.

### Reusable widgets

| Widget | File | Use |
|---|---|---|
| `AppText` | `view/widgets/text_app_custom.dart` | Text with named factories: `.title()`, `.subtitle()`, `.body()`, `.caption()` |
| `CustomElevatedButton` | `view/widgets/elevated_button_app_custom.dart` | Styled primary button |
| `CustomTextFormField` | `view/widgets/text_form_faild_app_custom.dart` | Styled input field with optional validator |
| `CustomBottomNavigationBar` | `view/widgets/bottom_navigation_bar_section.dart` | `salomon_bottom_bar`-based tab bar; requires `currentIndex` + `onTap` |
| `ProfileTile` | `view/widgets/card_tile_profile_custom.dart` | Icon + title + optional subtitle list tile used in profile/drawer |
| `CustomDrawer` | `view/widgets/menu_section.dart` | Slide-out drawer reusing all `profile_screen/` sub-components |

### Profile screen decomposition

`ProfileScreen` and `CustomDrawer` share the same sub-widgets from `view/screens/profile_screen/`: `ProfileHeader`, `UserInfoSection` (in `profile_info_tile.dart`), `AddressSection` (in `profile_address_section.dart`), `ProfileSettingsSection`, `ProfileMoreSection`, `ProfileAccountSection`. Add new profile sections there and import them in both places.

### Localization

Language is persisted via `SettingsServices` (SharedPreferences). `MyLocalController` reads the saved locale on startup and falls back to the device locale. Translation strings live in `lib/localization/local.dart` with both `"ar"` and `"en"` maps — always add keys to **both** maps when adding new strings. Use `"namespace.key"` dot-notation consistent with existing keys.

### Services / persistence

`SettingsServices` (in ` services/settings_services.dart`) wraps SharedPreferences and is the single place for reading/writing token and language preference. It is initialized with `await Get.putAsync(...)` in `main()` before `runApp`.

### API

Base URL: `https://tullana.toldpath.com/api`  
HTTP calls are made with the `http` package directly inside service classes. Auth token is stored and retrieved via `SettingsServices`. Authenticated requests pass `Authorization: Bearer <token>` plus `Accept: application/json` headers. The `ApiConfig.headers(token)` helper in `address_services.dart` is the canonical pattern for building these headers.

### HTML content screens

About Us, Privacy Policy, and Terms & Conditions screens render HTML from the API using `flutter_html`. Their data models live in `lib/model/`.
