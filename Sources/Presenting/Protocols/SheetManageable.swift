//
//  SheetManageable.swift
//
//  Created by James Sedlacek on 12/14/23.
//

import SwiftUI

/// A type that can be used to manage a sheet view
public protocol SheetManageable: ObservableObject {
    associatedtype Destination: ViewDisplayable

    var sheet: Destination? { get set }
    var onDismiss: (() -> Void)? { get set }
    func presentSheet(_ destination: Destination, onDismiss: @escaping () -> Void)
    func dismissSheet()
}

extension SheetManageable {
    /// Presents a new sheet view
    /// - Parameter destination: The view to be presented as a sheet
    /// - Parameter onDismiss: The action to be triggered after the view is dismissed
    public func presentSheet(_ destination: Destination, onDismiss: @escaping () -> Void = { }) {
        sheet = destination
        self.onDismiss = onDismiss
    }

    /// Dismisses the currently presented sheet view
    public func dismissSheet() {
        sheet = nil
    }
}
