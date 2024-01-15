//
//  BasicPresentingView.swift
//
//  Created by James Sedlacek on 12/18/23.
//

import SwiftUI

public struct BasicPresentingView<RootView: View>: View {
    @StateObject private var presenter: BasicPresenter = .init()
    private let rootView: (BasicPresenter) -> RootView

    public init(@ViewBuilder rootView: @escaping (BasicPresenter) -> RootView) {
        self.rootView = rootView
    }

    public var body: some View {
        rootView(presenter)
            .iflet(presenter.alert) { rootView, alert  in
                rootView.alert(isPresented: presenter.isAlertPresented) {
                    alert
                }
            }
            .iflet(presenter.toastConfig) { rootView, toastConfig in
                rootView.toast(config: toastConfig,
                               onCompletion: presenter.dismissToast)
            }
            .iflet(presenter.confirmationDialog) { rootView, confirmationDialog in
                rootView.confirmationDialog(config: confirmationDialog,
                                            isPresented: presenter.isConfirmationDialogPresented)
            }
    }
}

#Preview {
    BasicPresentingView { presenter in
        VStack {
            Spacer()
            Button("Show Alert") {
                presenter.presentAlert(.init(title: Text("Alert")))
            }
            Spacer()
            Button("Show Toast") {
                presenter.presentToast(.success(message: "Toast Messages work!!"))
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}
