//
//  BasicPresenter.swift
//
//  Created by James Sedlacek on 12/18/23.
//

import SwiftUI

public typealias BasicPresentable = AlertManageable & ToastManageable

public final class BasicPresenter: BasicPresentable {
    @Published public var alert: Alert?
    @Published public var toastConfig: ToastConfiguration?
}
