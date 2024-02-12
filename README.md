# Presenting

[![Swift Package Manager](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![GitHub stars](https://img.shields.io/github/stars/JamesSedlacek/Presenting.svg)](https://github.com/JamesSedlacek/Presenting/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/JamesSedlacek/Presenting.svg?color=blue)](https://github.com/JamesSedlacek/Presenting/network)
[![GitHub contributors](https://img.shields.io/github/contributors/JamesSedlacek/Presenting.svg?color=blue)](https://github.com/JamesSedlacek/Presenting/network)
<a href="https://github.com/JamesSedlacek/Presenting/pulls"><img src="https://img.shields.io/github/issues-pr/JamesSedlacek/Presenting" alt="Pull Requests Badge"/></a>
<a href="https://github.com/JamesSedlacek/Presenting/issues"><img src="https://img.shields.io/github/issues/JamesSedlacek/Presenting" alt="Issues Badge"/></a>

## Description

`Presenting` is a **lightweight** SwiftUI library for abstracting logic from views.
- Handle presenting `sheet`, `fullScreenCover`, `alert`, `toast`, `URLs`, and `confirmationDialog`.
- Unit Tested protocol implementations.
- Zero 3rd party dependencies.

Note - This library is for **Presenting** only. <br>
If you need to abstract `NavigationStack` then use my other library [`Routing`](https://github.com/JamesSedlacek/Routing)

<br>

## Requirements

| Platform | Minimum Version |
|----------|-----------------|
| iOS      | 15.0            |
| macOS    | 12.0            |
| tvOS     | 15.0            |
| watchOS  | 8.0             |

<br>

## Installation

You can install `Presenting` using the Swift Package Manager.

1. In Xcode, select `File` > `Add Package Dependencies`.
2. Copy & paste the following into the `Search or Enter Package URL` search bar.
```
https://github.com/JamesSedlacek/Presenting.git
```
3. Xcode will fetch the repository & the `Presenting` library will be added to your project.

<br>

## Getting Started

1. Create a `Route` enum that conforms to the `Presentable` protocol
if you need views presented in a `sheet` or `fullScreenCover`. 

``` swift
import Presenting
import SwiftUI

enum ExampleRoute: Presentable {
    case detail
    case settings
    
    var id: UUID { .init() }
    
    var body: some View {
        switch self {
        case .detail:
            DetailView()
        case .settings:
            SettingsView()
        }
    }
}
```

2. Create a `Presenter` object using the enum you created and add the `.presenting(using:)` modifier to the View.

``` swift
import Presenting
import SwiftUI

struct ContentView: View {
    @StateObject private var presenter: Presenter<ExampleRoute> = .init()

    var body: some View {
        VStack {
            Button("Go to Settings") {
                presenter.presentSheet(.settings)
            }
        }
        .presenting(using: presenter)
    }
}
```

3. Handle presenting sheets, fullScreenCovers, alerts, toasts,
and confirmation dialogs by using the `Presenter` functions:

```swift
// MARK: Sheet
/// Presents a new sheet view.
/// - Parameter destination: The view to be presented as a sheet.
/// - Parameter onDismiss: The action to be triggered after the view is dismissed.
func presentSheet(_ destination: Destination, onDismiss: @escaping () -> Void)

/// Dismisses the currently presented sheet view.
func dismissSheet()

// MARK: Full Screen Cover
/// Presents a full screen cover with the specified destination.
/// - Parameter destination: The destination to present as a full screen cover.
/// - Parameter onDismiss: The action to be triggered after the view is dismissed.
func presentFullScreenCover(_ destination: Destination, onDismiss: @escaping () -> Void)

/// Dismisses the currently presented full screen cover.
func dismissFullScreenCover()

// MARK: Alert
/// Presents the specified alert.
func presentAlert(_ alert: Alert)

/// Dismisses the currently presented alert.
func dismissAlert()

// MARK: Toast
/// Presents a toast notification.
///
/// - Parameters:
///   - edge: The vertical edge on which to present the toast.
///   - toast: The toast to present.
///   - isAutoDismissed: A Boolean value indicating whether the toast is automatically dismissed.
func presentToast(on edge: VerticalEdge, _ toast: Toast, isAutoDismissed: Bool)

/// Dismisses the currently presented toast notification.
func dismissToast()

// MARK: Confirmation Dialog
/// Presents the specified confirmation dialog.
func presentConfirmationDialog(_ confirmationDialog: ConfirmationDialog)

/// Dismisses the currently presented confirmation dialog.
func dismissConfirmationDialog()

// MARK: URL
/// Attempts to open a URL based on a specified `URLOpeningType` and a string.
/// Sets up the URL configuration (`urlConfig`) for later use.
///
/// - Parameters:
///   - type: The method for opening the URL.
///   - using: The URL string to open.
///
/// - Throws: An error if the URL is invalid or cannot be opened as specified.
func openUrl(_ urlOpeningType: URLOpeningType, using urlString: String) throws {
```

4. If you don't need to present views in a sheet or full screen cover, use the `BasicPresenter` instead.
This will allow you to present alerts, toasts, URLs, and confirmation dialogs over a view.

``` swift
import SwiftUI
import Presenting

struct ContentView: View {
    @StateObject private var presenter: BasicPresenter

    var body: some View {
        VStack {
            Button("Show Toast") {
                presenter.presentToast(.success(message: "It Works!"))
            }
        }
        .presenting(using: presenter)
    }
}
```

<br>

## Author

James Sedlacek, find me on [X/Twitter](https://twitter.com/jsedlacekjr) or [LinkedIn](https://www.linkedin.com/in/jamessedlacekjr/)
