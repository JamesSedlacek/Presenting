//
//  Presenter.swift
//
//  Created by James Sedlacek on 12/18/23.
//

import SwiftUI

public typealias PresentableObject = SheetManageable & FullScreenCoverManageable & AlertManageable & ToastManageable & ConfirmationDialogManageable & URLManageable

public final class Presenter<Routes: Presentable>: PresentableObject {
    
    public typealias Destination = Routes

    public var onDismiss: (() -> Void)?
    @Published public var sheet: Destination?
    @Published public var fullScreenCover: Destination?
    @Published public var alert: Alert?
    @Published public var toastConfig: ToastConfiguration?
    @Published public var confirmationDialog: ConfirmationDialog?
    @Published public var urlConfig: URLConfiguration?

    public init() {}
}
