# Fetch Recipes App 

## Overview
The Fetch Recipes App is a SwiftUI application designed to showcase recipes, specifically focusing on desserts. The app integrates with TheMealDB API to fetch and display dessert recipes. It employs the Model-View-ViewModel (MVVM) architectural pattern to organize code, enhance maintainability, and improve testability.

## Architecture
### MVVM (Model-View-ViewModel)
- **Model**: Represents the data and business logic layer of the application. `Meal` and `Meals` structs are used to model the API data.
- **View**: Defines the UI of the application. `MealListView` and `MealDetailView` are the primary views, displaying the user interface and responding to user interactions.
- **ViewModel**: `MealListModel` acts as the intermediary between the Model and the View, handling the presentation logic and state management.

## API Client Integration with Dependency Injection
The `ApiClient` struct in the application is crucial for interacting with TheMealDB API, abstracting network requests into two main methods: `getList` and `getMealById`. This struct integrates seamlessly with the `swift-dependencies` framework, allowing for flexible dependency injection. The application defines multiple versions of the `ApiClient`: a `live` implementation for actual network requests, a `mock` for simulated successful responses, and a `mockFailing` for testing error handling. This setup facilitates a robust testing environment and aligns with the MVVM architecture, enhancing the app's design and testability.

## Dependencies
The project incorporates two external libraries to facilitate navigation and dependency injection, enhancing testability and modularity:
- [SwiftUI Navigation](https://github.com/pointfreeco/swiftui-navigation): A library that provides a declarative Swift API for navigation in a SwiftUI application.
- [Swift Dependencies](https://github.com/pointfreeco/swift-dependencies): A lightweight library for managing dependencies in Swift, allowing for easier testing and modularity.

## Testing
The application is structured to support robust testing practices. By utilizing the Dependency Injection pattern, facilitated by the Swift Dependencies library, the app's components can be easily mocked or replaced for testing. Various mock implementations of models and the API client (`ApiClient.mock`) are provided to simulate different states and responses.

## Previews
The app extensively uses SwiftUI's preview feature to present different configurations and states of the application. These previews allow developers and designers to quickly visualize and iterate on the app's UI without needing to run it on a simulator or device.

## Thank You
Thank you for considering my application for the role at Fetch Rewards. I am excited about the opportunity to discuss how my skills and experiences align with the needs of your team. The Fetch Recipes App is a testament to my commitment to writing clean, maintainable, and testable code, and I look forward to potentially contributing to your projects.
