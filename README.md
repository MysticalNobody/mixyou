# mexyou

Dating app

## Instruction:

`flutter packages get`

`flutter pub run build_runner build --delete-conflicting-outputs`

`flutter run`

## I18n

- install `vscode-flutter-i18n-json` plugin for VSCode (https://marketplace.visualstudio.com/items?itemName=esskar.vscode-flutter-i18n-json)
- use `Ctrl+Shift+P` for palette
- add new locale if needed
- fill `/i18n/*.json` files with your localization strings
- **regenerate** Flutter files via Palette (`>Flutter I18n JSON: Update`)
- use strings

### Examples:

**Simple string**

`/i18n/en-US.json`

```json
{
    "title": "Itis template"
}
```

`/lib/screen.dart`

```dart
I18n.of(context).title // => Itis template
```

**String with parameter**

`/i18n/en-US.json`

```json
{
    "greetTo": "Hello, {name}"
}
```

`/lib/screen.dart`

```dart
I18n.of(context).greetTo("User name") // => Hello, User name
```

