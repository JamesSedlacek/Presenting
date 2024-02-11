//
//  ConfirmationDialog.swift
//
//
//  Created by Giorgio Latour on 1/13/24.
//

import SwiftUI

public struct ConfirmationDialog {
    let title: Text
    let titleVisibility: Visibility
    let actions: AnyView
    let message: AnyView

    ///  Creates a ConfirmationDialog object.
    ///  - Parameters:
    ///     - title: The title of the dialog.
    ///     - titleVisibility: The visibility of the dialog's title.
    ///     - actions: A view builder returning the dialog's actions.
    public init(
        _ title: Text,
        titleVisibility: Visibility = .automatic,
        @ViewBuilder actions: () -> some View
    ) {
        self.title = title
        self.titleVisibility = titleVisibility
        self.actions = AnyView(actions())
        self.message = AnyView(EmptyView())
    }

    ///  Creates a ConfirmationDialog object with a message.
    ///  - Parameters:
    ///     - title: The title of the dialog.
    ///     - titleVisibility: The visibility of the dialog's title.
    ///     - actions: A view builder returning the dialog's actions.
    ///     - message: A view builder returning the message for the dialog.
    public init(
        _ title: Text,
        titleVisibility: Visibility = .automatic,
        @ViewBuilder actions: () -> some View,
        @ViewBuilder message: () -> some View
    ) {
        self.title = title
        self.titleVisibility = titleVisibility
        self.actions = AnyView(actions())
        self.message = AnyView(message())
    }

    ///  Creates a ConfirmationDialog object with a message using data to
    ///  produce the dialog's content and a text view for the message.
    ///  - Parameters:
    ///     - title: The title of the dialog.
    ///     - titleVisibility: The visibility of the dialog's title.
    ///     - data: An optional source of truth for the confirmation dialog. The contents
    ///     of data are passed to the actions and message closures. A nil value results
    ///     in EmptyViews being passed to the two closures.
    ///     - actions: A view builder returning the dialog's actions given the
    ///     currently available data.
    ///     - message: A view builder returning the message for the dialog
    ///     given the currently available data.
    public init<T>(
        _ title: Text,
        titleVisibility: Visibility = .automatic,
        presenting data: T?,
        @ViewBuilder actions: (T) -> some View,
        @ViewBuilder message: (T) -> some View
    ) {
        self.title = title
        self.titleVisibility = titleVisibility

        if let data {
            self.actions = AnyView(actions(data))
            self.message = AnyView(message(data))
        } else {
            self.actions = AnyView(EmptyView())
            self.message = AnyView(EmptyView())
        }
    }
}
