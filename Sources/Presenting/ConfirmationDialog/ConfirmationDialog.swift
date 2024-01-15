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

    // confirmationDialog(_:isPresented:titleVisibility:actions:)
    public init(_ title: Text, titleVisibility: Visibility = .automatic,
                @ViewBuilder actions: @escaping () -> some View) {
        self.title = title
        self.titleVisibility = titleVisibility
        self.actions = AnyView(actions())
        self.message = AnyView(EmptyView())
    }

    // confirmationDialog(_:isPresented:titleVisibility:actions:message:)
    public init(_ title: Text, titleVisibility: Visibility = .automatic,
                @ViewBuilder actions: @escaping () -> some View,
                @ViewBuilder message: @escaping () -> some View) {
        self.title = title
        self.titleVisibility = titleVisibility
        self.actions = AnyView(actions())
        self.message = AnyView(message())
    }
    
    // confirmationDialog(_:isPresented:titleVisibility:presenting:actions:message:)
    public init<T>(_ title: Text, titleVisibility: Visibility = .automatic,
                   presenting data: T?,
                   @ViewBuilder actions: @escaping (T) -> some View,
                   @ViewBuilder message: @escaping (T) -> some View) {
        self.title = title
        self.titleVisibility = titleVisibility
        self.actions = AnyView(actions(T.self as! T))
        self.message = AnyView(message(T.self as! T))
    }
}
