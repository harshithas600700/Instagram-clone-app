# Insta App (Instagram UI Clone) — Flutter

A Flutter app that recreates core **Instagram-style UI screens** (login, feed, profile) with a **responsive layout** that adapts to mobile and desktop widths.

## Features

- **Login screen** (`LoginPage`) as the entry point
- **Responsive layout switch** via `ResponsiveLayout`
  - Mobile: `MobileLayout` bottom navigation
  - Desktop: `DesktopLayout` with sidebar + suggestions panel
- **Home feed UI** (`HomePage`)
  - Stories row
  - Post cards (static demo content)
- **Profile UI** (`ProfilePage`)
  - Profile header + stats + bio
  - Tabbed sections (grid / reels / tagged)
- **Assets**
  - SVG icons under `assets/icons/`
  - Images under `assets/images/`

## Tech Stack

- **Flutter / Dart**
- **Material 3** (`useMaterial3: true`)
- **Dependencies**
  - `flutter_svg` for SVG icons
  - `google_fonts` for typography

## Prerequisites

- Flutter SDK installed (stable channel recommended)
- Dart SDK compatible with `environment: sdk: ^3.8.1` (see `pubspec.yaml`)
- Android Studio / Xcode as needed for your target platform

## Getting Started

Install dependencies:

```bash
flutter pub get
```

Run the app:

```bash
flutter run
```

Common run targets:

```bash
# List devices (emulators, physical devices, desktop)
flutter devices

# Run on Chrome (if Flutter web is enabled)
flutter run -d chrome

# Run on macOS desktop (if enabled)
flutter run -d macos
```

## Build

```bash
# Android APK
flutter build apk

# Android App Bundle (Play Store)
flutter build appbundle

# iOS (requires macOS + Xcode)
flutter build ios
```

## Project Structure

```text
lib/
  main.dart                 # App entry; starts at LoginPage
  layouts/
    mobile_layout.dart       # Bottom navigation layout for small screens
    desktop_layout.dart      # Desktop layout with sidebar & suggestions
  pages/
    login_page.dart          # Login UI; navigates into ResponsiveLayout
    home_page.dart           # Feed UI (stories + posts)
    profile_page.dart        # Profile UI (tabs + grid)
  utils/
    responsive_layout.dart   # Switches mobile/desktop by width
  widgets/
    bottom_nav.dart          # Bottom nav widget (alternative implementation)
assets/
  icons/                     # SVG icons (home/search/add/reel/dm etc.)
  images/                    # Demo images (dp/story/post)
```

## Navigation Notes

- The app starts on **Login** (`home: LoginPage()` in `lib/main.dart`).
- On login button press, it navigates to `ResponsiveLayout` which selects:
  - `MobileLayout` when width ≤ 600
  - `DesktopLayout` when width > 600
- Named routes currently include:
  - `/login`
  - `/profile`

## Tests

This repo includes the default Flutter sample test in `test/widget_test.dart`.
If tests fail, it’s likely because the app no longer contains the default counter UI that the template test expects.

Run tests:

```bash
flutter test
```

## Troubleshooting

- **Assets not loading**: ensure `pubspec.yaml` includes:
  - `assets/icons/`
  - `assets/images/`
  then run `flutter pub get` again.
- **SVG not rendering**: verify the SVG path exists and `flutter_svg` is in `pubspec.yaml`.

## Roadmap Ideas

- Wire login to real auth (Firebase / custom backend)
- Replace `Placeholder()` pages (Search, Create, Reels)
- Add models + state management (Provider / Riverpod / Bloc)
- Add real feed data + image upload

## License

For learning and UI practice. If you plan to publish, avoid using Instagram trademarks/assets and replace branding with your own.
