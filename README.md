# Demo App - Language and Theme Support

This is a demo app that demonstrates language and theme support using the `easy_localisation` package along with a custom language loader to load languages from a URL. It also includes a feature to load `ThemeData` from a server and switch between different themes.

## Installation

1. Clone the repository:

   ```shell
   git clone <repository_url>
   ```

2. Navigate to the project directory:

   ```shell
   cd demo-localization
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

2. The app will start with the default language (usually English) and theme loaded from the local configuration files.

## Custom Language Loader

The demo app uses a custom language loader to fetch language JSON files from a URL at runtime. This allows you to dynamically load translations without rebuilding the app.

The custom language loader implementation can be found in the `lib/im_loader.dart` file. It fetches the language JSON files asynchronously and initializes the translations using the `easy_localisation` package.
If response status is not 200, it will load the default language from the assets folder.

## Custom Theme Loader

The demo app includes a custom theme loader that fetches data from a server and use `json_theme` lib to convert it in `ThemeData` object. It fetches the theme data asynchronously and applies it to the app's UI dynamically.

The custom theme loader implementation can be found in the `lib/theme/theme_service.dart` file. It fetches the theme data from the specified URL and applies it using the `provider` package.
In general, you can use any state management solution to apply the theme data to the app's UI.

## Folder Structure

The main files and folders relevant to the language and theme support functionality in this demo app are:

- `lib/main.dart`: Contains the app's entry point and configuration for `easy_localisation` and `ThemeServicer`.
- `lib/lit_loader.dart`: Implements the custom language loader for fetching language JSON files from a URL.
- `lib/theme/theme_service.dart`: Implements the custom theme loader for fetching data from a server and convert it to `ThemeData` using `json_theme` lib.

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvement, please open an issue or submit a pull request on the [repository](<repository_url>).

## License

This demo app is licensed under the [MIT License](LICENSE).
```

Please remember to replace `<repository_url>` in the above text with the actual URL of your repository.