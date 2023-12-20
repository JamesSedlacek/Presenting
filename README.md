# Presenting

## Description

`Presenting` is a library for abstracting logic from views.
- Simplifies code by removing responsibilities from views.
- Leads to cleaner, more manageable code.
- Promotes better separation of concerns.
- Ridiculously **lightweight**.
- **Type-safe** routing using enums and associated values.
- Unit Tested protocol implementations.
- Zero 3rd party dependencies.

<br>

## Requirements

- **iOS**: Requires iOS 15.0 or later.
- **macOS**: Requires macOS 12.0 or later.

<br>

## Installation

You can install `Presenting` using the Swift Package Manager.

1. In Xcode, select "File" > "Add Package Dependencies".
2. Copy & paste the following into the "Search or Enter Package URL" search bar.
```
https://github.com/JamesSedlacek/Presenting.git
```
4. Xcode will fetch the repository & the "Presenting" library will be added to your project.

<br>

## Getting Started

1. Create a "Route" enum if you need views presented in a sheet or full screen cover. 

``` swift
import SwiftUI
import Presenting

enum Route: ViewDisplayable {
    case detail
    case settings
    
    @ViewBuilder
    var viewToDisplay: some View {
        switch self {
        case .detail:
            DetailView()
        case .settings:
            SettingsView()
        }
    }
}
```

2. The PresentingView will be used to inject the presenter object into the view model. 
Pass in the Route enumeration, so that the PresenterView can use them. 

``` swift
import SwiftUI
import Presenting

struct ContentView: View {
    var body: some View {
        PresentingView(Route.self) { presenter in
            ExampleView(viewModel: .init(presenter: presenter))
        }
    }
}

struct ExampleView: View {
    @ObservedObject var viewModel: ExampleViewModel
    
    var body: some View {
        // The app's main content goes here
    }
}

final class ExampleViewModel: ObservableObject {
    private let presenter: Presenter<Route>
    
    init(router: Presenter<Route>) {
        self.presenter = presenter
    }
}

```

3. Handle presenting sheets, fullScreenCovers, alerts, toasts, etc.
by using the Presenter functions:

```swift
// Sheet
func presentSheet(_ destination: Destination)
func dismissSheet()

// FullScreenCover
func presentFullScreenCover(_ destination: Destination)
func dismissFullScreenCover()

// Alert
func presentAlert(_ alert: Alert)
func dismissAlert()

// Toast
func presentToast(on edge: VerticalEdge = .top,
                  _ toast: Toast,
                  isAutoDismissed: Bool = true)
func dismissToast()
```

4. If you don't need to present views in a sheet or full screen cover, use the BasicPresentingView instead.
This will allow you to present alerts & toasts over a view.

``` swift
import SwiftUI
import Presenting

struct ContentView: View {
    var body: some View {
        BasicPresentingView { presenter in
            ExampleView(viewModel: .init(presenter: presenter))
        }
    }
}
```


<br>

## Settings sheet example

``` swift
import SwiftUI
import Presenting

enum ExampleRoute: ViewDisplayable {
    case settings
    
    @ViewBuilder
    var viewToDisplay: some View {
        switch self {
        case .settings:
            SettingsView()
        }
    }
}

struct ContentView: View {
    var body: some View {
        PresentingView(Route.self) { presenter in
            ExampleView(viewModel: .init(presenter: presenter))
        }
    }
}

struct ExampleView: View {
    @ObservedObject var viewModel: ExampleViewModel
    
    var body: some View {
        VStack {
            Button("Settings", action: viewModel.didTapSettings)
        }
    }
}

final class ExampleViewModel: ObservableObject {
    private let presenter: Presenter<Route>
    
    init(presenter: Presenter<Route>) {
        self.presenter = presenter
    }
    
    func didTapSettings() {
        presenter.presentSheet(.settings)
    }
}
```

## Author

James Sedlacek, find me on [X/Twitter](https://twitter.com/jsedlacekjr) or [LinkedIn](https://www.linkedin.com/in/jamessedlacekjr/)

## License

<details>
  <summary><strong>Presenting is available under the MIT license.</strong></summary>
  <br>

Copyright (c) 2023 James Sedlacek

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

</details>
