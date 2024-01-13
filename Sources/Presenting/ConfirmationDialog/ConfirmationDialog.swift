//
//  ConfirmationDialog.swift
//
//
//  Created by Giorgio Latour on 1/13/24.
//

import SwiftUI

public struct ConfirmationDialog<A: View> {
    let title: Text
    let titleVisilibity: Visibility
    let actions: A

    // confirmationDialog(_:isPresented:titleVisibility:actions:)
    init(_ title: Text, titleVisibility: Visibility = .automatic, @ViewBuilder actions: () -> A) {
        self.title = title
        self.titleVisilibity = titleVisibility
        self.actions = actions()
    }
}
