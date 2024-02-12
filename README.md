# Flutter Assessment (Trip Tracker)

A new Flutter project.

## Getting Started

Welcome to the Flutter Trip Tracker App! This application allows users to track their trips from one location to another using Google Maps integration. Users can set their start and end locations, visualize the route on the map, and view trip summaries.

Features

~ Clean, Maintainable Code: The project follows Flutter conventions and best practices to ensure clean, readable, and maintainable code. Proper code organization, naming conventions, and documentation are prioritized.
~ State Management with GetX: GetX is used for state management throughout the application. Reactive state management is implemented using GetX's observable, reactive, and dependency injection features.
~ MVC Architecture: The application follows the MVC architecture pattern to separate concerns and improve maintainability. Models, views, and controllers are structured according to MVC principles. 
~ Google Maps Integration: Google Maps API is integrated into the application to enable tracking from one location to another. Maps, markers, and routes between two points are displayed using Google Maps. 
~ Login Screen with Validation: A login screen with proper validation and authentication is implemented using GetX's state management capabilities. Upon successful login, users are navigated to the map screen.
~ Set Start and End Locations: Users can set their start and end locations for tracking. They can input the locations manually or select them from the map. Markers are displayed on the map for the selected locations. 
~ Dynamic Marker Movement: Functionality is implemented to move the start marker from its initial location to the end location dynamically. Real-time updates are utilized to visualize the movement of the marker. 
~ Trip Summary Display: A screen is created to present a trip summary, including start location, end location, destination, distance, start time, end time, duration, and cost calculated at a rate of 2 AED per kilometer traveled.
~ Error Handling: Error handling mechanisms are in place to gracefully handle exceptions, network errors, and edge cases throughout the application.

# Setup Instructions

1. Clone the repository: git clone https://github.com/yourusername/flutter-trip-tracker.git
2. Navigate to the project directory: cd flutter-trip-tracker
3. Install dependencies: flutter pub get
4. Run the app: flutter run

# Architecture Overview

The project follows the MVC (Model-View-Controller) architecture pattern:

> Model: Represents data and business logic.
> View: Represents the UI components.
> Controller: Mediates between the model and view, handling user input and updating the UI.
> resources: Contains some reusable basic custom widgets, services and constants.

# Usage Guidelines

1. Login to the app using your credentials. Username must be an email. Password length must be greater than 6.
2. Set your start and end locations for tracking.
3. View the map to visualize the route.
4. Once the trip is completed, view the trip summary to see details such as distance, duration, and cost.
