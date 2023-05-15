# Demo App - Language Support

This is a demo app that demonstrates language support using `easy_localisation` package along with a custom language loader to load languages from a URL.

## Installation

1. Clone the repository:

   ```shell
   git clone <repository_url>
   ```

2. Navigate to the project directory:

   ```shell
   cd demo-app
   ```

3. Install the dependencies using `pub` (Dart package manager):

   ```shell
   pub get
   ```

## Usage

1. Launch the app:

   ```shell
   flutter run
   ```

2. The app will start with the default language (usually English) loaded from the local translations file.

3. To load languages dynamically from a URL, follow these steps:

    - Open the `lib/main.dart` file.
    - Locate the section where `easy_localisation` is initialized.
    - Replace the `fallbackLocale` and `supportedLocales` values with the desired languages you want to support.
    - Uncomment the code block for the custom language loader and provide the URL from which you want to load the language JSON files.
    - Save the changes.

4. Run the app again, and it will load the language translations from the specified URL.

## Custom Language Loader

The demo app uses a custom language loader to fetch language JSON files from a URL at runtime. This allows you to dynamically load translations without rebuilding the app.

The custom language loader implementation can be found in the `lib/language_loader.dart` file. It fetches the language JSON files asynchronously and initializes the translations using the `easy_localisation` package.

## Folder Structure

The main files and folders relevant to the language support functionality in this demo app are:

- `lib/main.dart`: Contains the app's entry point and configuration for `easy_localisation`.
- `lib/language_loader.dart`: Implements the custom language loader for fetching language JSON files from a URL.
- `lib/translations`: Contains the local translation files for different languages.

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvement, please open an issue or submit a pull request on the [repository](<repository_url>).

## License

This demo app is licensed under the [MIT License](LICENSE).
