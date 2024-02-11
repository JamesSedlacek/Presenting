//
//  ConfirmationDialogModifier.swift
//
//
//  Created by Giorgio Latour on 1/14/24.
//

import SwiftUI

extension View {
    func confirmationDialog(config: ConfirmationDialog, isPresented: Binding<Bool>) -> some View {
        self.modifier(ConfirmationDialogModifier(config: config, isPresented: isPresented))
    }
}

public struct ConfirmationDialogModifier: ViewModifier {
    private var isPresented: Binding<Bool>
    private let confirmationDialog: ConfirmationDialog

    init(
        config confirmationDialog: ConfirmationDialog,
        isPresented: Binding<Bool>
    ) {
            self.confirmationDialog = confirmationDialog
            self.isPresented = isPresented
        }

    public func body(content: Content) -> some View {
        content
            .confirmationDialog(
                confirmationDialog.title, isPresented: isPresented,
                titleVisibility: confirmationDialog.titleVisibility
            ) {
                confirmationDialog.actions
            } message: {
                confirmationDialog.message
            }
    }
}
