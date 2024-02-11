//
//  PresentingModifier.swift
//
//  Created by James Sedlacek on 12/18/23.
//

import SwiftUI

struct PresentingModifier<Routes: Presentable>: ViewModifier {
    @ObservedObject var presenter: Presenter<Routes>

    func body(content: Content) -> some View {
        content
            .sheet(
                item: $presenter.sheet,
                onDismiss: presenter.onDismiss
            ) { view in
                view.body
            }
            .iflet(presenter.alert) { root, alert in
                root.alert(isPresented: presenter.isAlertPresented) {
                    alert
                }
            }
            .iflet(presenter.toastConfig) { root, toastConfig in
                root.toast(
                    config: toastConfig,
                    onCompletion: presenter.dismissToast
                )
            }
            .iflet(presenter.urlConfig) { root, _ in
                root.openURL(config: $presenter.urlConfig)
            }
            .iflet(presenter.confirmationDialog) { root, confirmationDialog in
                root.confirmationDialog(
                    config: confirmationDialog,
                    isPresented: presenter.isConfirmationDialogPresented
                )
            }
#if !os(macOS)
            .iflet(presenter.fullScreenCover) { root, fullScreenCover in
                root.fullScreenCover(
                    item: $presenter.fullScreenCover,
                    onDismiss: presenter.onDismiss
                ) { view in
                    view.body
                }
            }
#endif
    }
}
