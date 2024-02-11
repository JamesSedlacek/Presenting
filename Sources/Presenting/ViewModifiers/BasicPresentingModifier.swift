//
//  BasicPresentingModifier.swift
//
//  Created by James Sedlacek on 12/18/23.
//

import SwiftUI

struct BasicPresentingModifier: ViewModifier {
    @ObservedObject var presenter: BasicPresenter

    func body(content: Content) -> some View {
        content
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
    }
}

public struct BasicPresentingView<Root: View>: View {
    @ObservedObject private var presenter: BasicPresenter
    private let root: () -> Root

    public init(
        _ presenter: ObservedObject<BasicPresenter>,
        @ViewBuilder root: @escaping () -> Root
    ) {
        self._presenter = presenter
        self.root = root
    }

    public var body: some View {
        root()
            .iflet(presenter.alert) { root, alert  in
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
    }
}
