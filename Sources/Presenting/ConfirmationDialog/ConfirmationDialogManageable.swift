//
//  ConfirmationDialogManageable.swift
//
//
//  Created by Giorgio Latour on 1/14/24.
//

import SwiftUI

/// Protocol defining the requirements for an object to manage confirmation dialogs.
public protocol ConfirmationDialogManageable: ObservableObject {
    /// Configuration for the confirmation dialog.
    var confirmationDialog: ConfirmationDialog? { get set }

    /// A binding indicating whether a confirmation dialog is currently presented.
    var isConfirmationDialogPresented: Binding<Bool> { get set }

    /// Presents the specified confirmation dialog.
    func presentConfirmationDialog(_ confirmationDialog: ConfirmationDialog)

    /// Dismisses the currently presented confirmation dialog.
    func dismissConfirmationDialog()
}

extension ConfirmationDialogManageable {
    /// A computed property that returns a Binding<Bool> based on the presence of a confirmation dialog.
    /// The getter returns true if a confirmation dialog is present, and false otherwise.
    /// The setter sets the confirmation dialog to nil if the new value is false.
    public var isConfirmationDialogPresented: Binding<Bool> {
        get {
            return Binding<Bool>(
                get: { self.confirmationDialog != nil },
                set: { newValue in
                    if !newValue {
                        self.confirmationDialog = nil
                    }
                }
            )
        }
        set {
            if !newValue.wrappedValue {
                self.confirmationDialog = nil
            }
        }
    }

    /// Presents the specified confirmation dialog.
    public func presentConfirmationDialog(_ confirmationDialog: ConfirmationDialog) {
        self.confirmationDialog = confirmationDialog
    }

    /// Dismisses the currently presented confirmation dialog.
    public func dismissConfirmationDialog() {
        confirmationDialog = nil
    }
}
