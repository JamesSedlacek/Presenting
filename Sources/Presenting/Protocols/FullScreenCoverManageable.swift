//
//  FullScreenCoverManageable.swift
//
//  Created by James Sedlacek on 12/14/23.
//

import SwiftUI

/// A type that can be used to manage a sheet view
public protocol FullScreenCoverManageable: ObservableObject {
    associatedtype Destination: ViewDisplayable

    var fullScreenCover: Destination? { get set }
    var onDismiss: (() -> Void)? { get set }
    func presentFullScreenCover(_ destination: Destination, onDismiss: @escaping () -> Void)
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
