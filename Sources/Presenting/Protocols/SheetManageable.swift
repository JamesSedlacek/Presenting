//
//  SheetManageable.swift
//
//  Created by James Sedlacek on 12/14/23.
//

import SwiftUI

/// A protocol that defines the requirements for an object to manage sheet presentations.
public protocol SheetManageable: ObservableObject {
    associatedtype Destination: Presentable

    /// The view to be presented as a sheet.
    var sheet: Destination? { get set }

    var isSheetPresented: Binding<Bool> { get set }

    /// The action to be triggered after the view is dismissed.
    var onDismiss: (() -> Void)? { get set }
    
    /// Presents a new sheet view.
    /// - Parameter destination: The view to be presented as a sheet.
    /// - Parameter onDismiss: The action to be triggered after the view is dismissed.
    func presentSheet(_ destination: Destination, onDismiss: @escaping () -> Void)
    
    /// Dismisses the currently presented sheet view.
    func dismissSheet()
}

extension SheetManageable {
    public var isSheetPresented: Binding<Bool> {
        get {
            return Binding<Bool>(
                get: { self.sheet != nil },
                set: { newValue in
                    if !newValue {
                        self.sheet = nil
                    }
                }
            )
        }
        set {
            if !newValue.wrappedValue {
                self.sheet = nil
            }
        }
    }

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
