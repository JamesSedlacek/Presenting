//
//  FullScreenCoverManageable.swift
//
//  Created by James Sedlacek on 12/14/23.
//

import SwiftUI

/// Protocol defining the requirements for an object to manage full screen covers in SwiftUI.
/// The object must be an ObservableObject and define a Destination type that conforms to Presentable.
/// It must also provide a way to present and dismiss a full screen cover.
public protocol FullScreenCoverManageable: ObservableObject {
    associatedtype Destination: Presentable

    /// The full screen cover to be presented.
    var fullScreenCover: Destination? { get set }

    /// The action to be triggered after the view is dismissed.
    var onDismiss: (() -> Void)? { get set }
    
    /// Presents a full screen cover with the specified destination.
    /// - Parameter destination: The destination to present as a full screen cover.
    /// - Parameter onDismiss: The action to be triggered after the view is dismissed.
    func presentFullScreenCover(_ destination: Destination, onDismiss: @escaping () -> Void)
    
    /// Dismisses the currently presented full screen cover.
    func dismissFullScreenCover()
}

extension FullScreenCoverManageable {
    /// Presents a full screen cover with the specified destination
    /// - Parameter destination: The destination to present as a full screen cover
    /// - Parameter onDismiss: The action to be triggered after the view is dismissed
    public func presentFullScreenCover(_ destination: Destination, onDismiss: @escaping () -> Void = { }) {
        fullScreenCover = destination
        self.onDismiss = onDismiss
    }

    /// Dismisses the currently presented full screen cover
    public func dismissFullScreenCover() {
        fullScreenCover = nil
    }
}
