# Aubay iOS Assessment Project

## Overview

This project is an iOS application built using Swift and SwiftUI that interacts with the Data USA API to fetch and display population data at both the nation and state levels. The project adheres to SOLID principles and utilizes the MVVM (Model-View-ViewModel) architecture to ensure a clean, scalable, and maintainable codebase.

## SOLID Principles Applied

- **Single Responsibility Principle (SRP):** Each class and struct has one responsibility. For example, the `NetworkManager` is solely responsible for handling network requests, while the `PopulationViewModel` manages the business logic and data presentation.
  
- **Open/Closed Principle (OCP):** The code is open for extension but closed for modification. Protocols such as `PopulationAPIClient` are used to allow easy swapping or extension of functionality without modifying existing code.

- **Liskov Substitution Principle (LSP):** The app uses protocols and dependency injection, ensuring that subclasses or modules can be replaced without affecting the correctness of the program.

- **Interface Segregation Principle (ISP):** The codebase uses small, specific protocols like `PopulationAPIClient`, ensuring that no class is forced to implement methods it doesn’t use.

- **Dependency Inversion Principle (DIP):** High-level modules do not depend on low-level modules but on abstractions. This is achieved by injecting dependencies via protocols, making the code more flexible and easier to test.

## MVVM Architecture

The project follows the MVVM architecture, which separates concerns into three main components:

- **Model:** Represents the data structures (e.g., `NationPopulationData`, `StatePopulationData`) that interact with the API.
- **View:** SwiftUI views such as `NationPopulationView` and `StatePopulationView` display the data.
- **ViewModel:** The `PopulationViewModel` acts as a mediator between the Model and the View, handling the business logic and preparing data for display.

## Third-Party Libraries

No third-party libraries were used in this project. All functionality was implemented using native Swift and SwiftUI.

## Time Spent

- **Total Time Spent:** 2 hours and 15 minutes.

## Tests

I wrote all the necessary unit and UI tests to ensure the application functions correctly. However, due to an issue with Xcode 15 on iOS 17, I was unable to run the tests in parallel. As time was limited, I prioritized writing the tests to demonstrate my knowledge, but I could not verify them by running.

## Repository

The code for this project is available on GitHub: [Aubay GitHub Repository](https://github.com/marceloreis13/aubay.git)
