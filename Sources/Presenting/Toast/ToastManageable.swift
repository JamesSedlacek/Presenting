//
//  ToastManageable.swift
//
//  Created by James Sedlacek on 12/16/23.
//

import SwiftUI

/// Protocol defining the requirements for an object to manage toast notifications.
public protocol ToastManageable: ObservableObject {
    /// Configuration for the toast notification.
    var toastConfig: ToastConfiguration? { get set }

    /// Presents a toast notification.
    ///
    /// - Parameters:
    ///   - edge: The vertical edge on which to present the toast.
    ///   - toast: The toast to present.
    ///   - isAutoDismissed: A Boolean value indicating whether the toast is automatically dismissed.
    func presentToast(on edge: VerticalEdge,
                      _ toast: Toast,
                      isAutoDismissed: Bool)
    
    /// Dismisses the currently presented toast notification.
    func dismissToast()
}

extension ToastManageable {
    /// Presents a toast notification with default parameters.
    ///
    /// - Parameters:
    ///   - edge: The vertical edge on which to present the toast. Default is .top.
    ///   - toast: The toast to present.
    ///   - isAutoDismissed: A Boolean value indicating whether the toast is automatically dismissed. Default is true.
    public func presentToast(on edge: VerticalEdge = .top,
                             _ toast: Toast,
                             isAutoDismissed: Bool = true) {
        guard toastConfig == nil else { return }
        self.toastConfig = .init(edge: edge, toast: toast, isAutoDismissed: isAutoDismissed)
    }

    /// Dismisses the currently presented toast notification.
    public func dismissToast() {
        toastConfig = nil
    }
}
