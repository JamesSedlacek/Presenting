//
//  BasicPresenter.swift
//
//  Created by James Sedlacek on 12/18/23.
//

import SwiftUI

public typealias BasicPresentableObject = AlertManageable & ToastManageable & ConfirmationDialogManageable

public final class BasicPresenter: BasicPresentableObject {
    @Published public var alert: Alert?
    @Published public var toastConfig: ToastConfiguration?
    @Published public var confirmationDialog: ConfirmationDialog?
}
