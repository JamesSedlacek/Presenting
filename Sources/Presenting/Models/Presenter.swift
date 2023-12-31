//
//  Presenter.swift
//
//  Created by James Sedlacek on 12/18/23.
//

import SwiftUI

public typealias Presentable = SheetManageable & FullScreenCoverManageable & AlertManageable & ToastManageable

public final class Presenter<Routes: ViewDisplayable>: Presentable {
    public typealias Destination = Routes

    public var onDismiss: (() -> Void)?
    @Published public var sheet: Destination?
    @Published public var fullScreenCover: Destination?
    @Published public var alert: Alert?
    @Published public var toastConfig: ToastConfiguration?
}
