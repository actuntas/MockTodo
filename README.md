# MockToDo SwiftUI Application

## Overview

The MockToDo app is a SwiftUI-based iOS application designed to showcase the use of Clean Architecture and ViewModel pattern. This project adheres strictly to best practices in iOS development, ensuring that business logic is decoupled from UI components, facilitating maintainability and scalability.

## Architecture

The application leverages the ViewModel pattern within the Clean Architecture layers, enhancing the separation of concerns:

- **Views** are responsible for presenting data and forwarding user actions to the ViewModel.
- **ViewModels** handle the presentation logic and interact with the Use Cases or Interactors.
- **Use Cases** contain the business logic specific to the actions a user can take within the app.
- **Entities** are the fundamental business objects of the application.

No third-party libraries have been used in this project to ensure that the focus remains on the native frameworks and their capabilities.

## Features

- Task addition, modification, and deletion
- Persistent local storage

## Review

Thank you for taking the time to review this project. Any feedback is welcome and can be sent to the contact below.

## Contact

- Aydın Can TUNTAŞ - actuntas@gmail.com
