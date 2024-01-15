# Presenting

[![Swift Package Manager](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![GitHub stars](https://img.shields.io/github/stars/JamesSedlacek/Presenting.svg)](https://github.com/JamesSedlacek/Presenting/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/JamesSedlacek/Presenting.svg?color=blue)](https://github.com/JamesSedlacek/Presenting/network)
[![GitHub contributors](https://img.shields.io/github/contributors/JamesSedlacek/Presenting.svg?color=blue)](https://github.com/JamesSedlacek/Presenting/network)
<a href="https://github.com/JamesSedlacek/Presenting/pulls"><img src="https://img.shields.io/github/issues-pr/JamesSedlacek/Presenting" alt="Pull Requests Badge"/></a>
<a href="https://github.com/JamesSedlacek/Presenting/issues"><img src="https://img.shields.io/github/issues/JamesSedlacek/Presenting" alt="Issues Badge"/></a>

## Description

`Presenting` is a **lightweight** SwiftUI library for abstracting logic from views.
- Handle presenting sheets, fullScreenCover, alert, toast, and confirmation dialogs.
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

2. Wrap your `RootView` with a `PresentingView`. 

``` swift
import Presenting
import SwiftUI

struct ContentView: View {
    var body: some View {
        PresentingView(ExampleRoute.self) { presenter in
            Button("Go to Settings") {
                presenter.presentSheet(.settings)
            }
        }
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
public func presentConfirmationDialog(_ confirmationDialog: ConfirmationDialog)

/// Dismisses the currently presented confirmation dialog.
public func dismissConfirmationDialog()
```

4. If you don't need to present views in a sheet or full screen cover, use the `BasicPresentingView` instead.
This will allow you to present alerts, toasts, and confirmation dialogs over a view.

``` swift
import SwiftUI
import Presenting

struct ContentView: View {
    var body: some View {
        BasicPresentingView { presenter in
            // code goes here
        }
    }
}
```

<br>

## Author

James Sedlacek, find me on [X/Twitter](https://twitter.com/jsedlacekjr) or [LinkedIn](https://www.linkedin.com/in/jamessedlacekjr/)
