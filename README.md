# 💰 Coin Info

Coin Info is a Flutter app that fetches and displays cryptocurrency data (price, description, exchange rates, etc.) using the **CoinGecko API**.  
This project was built to practice **HTTP requests, JSON parsing, state management, dependency injection, navigation, and UI building** in Flutter.

---

## ✨ Features & Concepts Practiced

This app demonstrates the use of the following Flutter concepts:

1. **HTTP Requests**
    - Used **Dio** to make REST API calls to fetch coin data.
    - Implemented error handling for failed requests.

2. **Dependency Injection**
    - Used **GetIt** to register and access services (`AppConfig`, `HTTPServices`).

3. **Config Management**
    - Stored API base URL in `assets/config/main.json`.
    - Loaded and parsed configuration using `rootBundle`.

4. **Widgets & State Management**
    - Built with `StatefulWidget` and managed updates using `setState`.
    - Used `FutureBuilder` to handle asynchronous API calls.

5. **Navigation**
    - Double-tapping a coin image navigates to a `DetailedPage` showing exchange rates.

6. **UI Elements**
    - `DropdownButton` → Select different coins (Bitcoin, Ethereum, Dogecoin).
    - `ListView.builder` → Display exchange rates dynamically.
    - `GestureDetector` → Handled double-tap for navigation.
    - Custom styled text, containers, and network images.

7. **JSON Parsing**
    - Parsed nested JSON responses to extract:
        - Current price (USD).
        - 24-hour price change percentage.
        - Exchange rates.
        - Coin description.

---

### 🎯 Learning Outcomes
- Through this project, I learned how to:
- Fetch data from a REST API using Dio.
- Use GetIt for dependency injection in Flutter.
- Load configuration files (assets/config/main.json).
- Parse and handle nested JSON data structures.
- Work with FutureBuilder for async UI updates.
- Navigate between pages with Navigator.push.
- Build interactive UI with DropdownButton, GestureDetector, and ListView.builder.
- Manage app state with StatefulWidget and setState.

lib/
│
├── main.dart                 # App entry point, config & service registration
├── models/
│   └── app_config.dart       # AppConfig model for base API URL
├── pages/
│   ├── home_page.dart        # Main home page with dropdown & coin info
│   └── detailed_page.dart    # Exchange rates list page
├── services/
│   └── http_services.dart    # HTTP client using Dio
assets/
└── config/
└── main.json             # API configuration
pubspec.yaml                  # Dependencies & asset configuration

## 🚀 Getting Started

### Prerequisites
- Install [Flutter SDK](https://docs.flutter.dev/get-started/install).
- Ensure you have an IDE (VS Code / Android Studio).
- Add a valid CoinGecko API URL to `assets/config/main.json`

### Running the App

```bash
# Clone this repository
git clone https://github.com/your-username/coin_info.git  

# Navigate to project folder
cd coin_info  

# Get dependencies
flutter pub get  

# Run the app
flutter run
