# Senior-Vital 🏠👵

**Elderly Health Monitoring in Smart Homes**  
For AUT COMP 826 Assignment 2

Senior Vital is an iOS application designed to aid in the health monitoring of the elderly within smart homes. It is developed using Swift and enhanced with the power of RxSwift for reactive programming.

## 🛠 Prerequisites

Ensure you have the latest version of `Xcode` installed. If not, you can download it from the official [Apple Developer Site](https://developer.apple.com/xcode/).

## 🚀 Getting Started

### How to run the application:

1. Install [Xcode](https://developer.apple.com/xcode/) if you haven't already.
2. Clone or download this repository to your local machine.
3. Navigate to the project directory and open `SeniorVital.xcodeproj`.
4. In Xcode, click the build button (▶️) or use the shortcut `Cmd + R`.
5. The application will launch in the default simulator.

## 📐 Application Architecture

The application follows an MVVM (Model-View-ViewModel) structure for clarity and separation of concerns:

- **ViewController**: Manages and controls the user interface components.
- **ViewModel**: Handles the application logic, ensuring that the view gets updated as needed based on data changes.
- **user.json**: A mock database file that supplies user authentication details and key health metrics. This simulates the data you'd typically retrieve from a backend database.
