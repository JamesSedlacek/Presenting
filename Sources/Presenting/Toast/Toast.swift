//
//  Toast.swift
//
//
//  Created by James Sedlacek on 12/17/23.
//

import SwiftUI

public struct Toast {
    let icon: Image
    let color: Color
    let message: String

    public init(icon: Image, color: Color, message: String) {
        self.icon = icon
        self.color = color
        self.message = message
    }
}

/// Extension to the Toast struct to provide convenience initializers for different types of toasts.
extension Toast {
    /// Creates a debug toast with a purple color and a debug icon.
    public static func debug(message: String) -> Toast {
        .init(icon: Image(.debug), color: .purple, message: message)
    }
    
    /// Creates an error toast with a red color and an error icon.
    public static func error(message: String) -> Toast {
        .init(icon: Image(.error), color: .red, message: message)
    }
    
    /// Creates an info toast with a blue color and an info icon.
    public static func info(message: String) -> Toast {
        .init(icon: Image(.info), color: .blue, message: message)
    }
    
    /// Creates a notice toast with an orange color and a notice icon.
    public static func notice(message: String) -> Toast {
        .init(icon: Image(.notice), color: .orange, message: message)
    }
    
    /// Creates a success toast with a green color and a success icon.
    public static func success(message: String) -> Toast {
        .init(icon: Image(.success), color: .green, message: message)
    }
    
    /// Creates a warning toast with a yellow color and a warning icon.
    public static func warning(message: String) -> Toast {
        .init(icon: Image(.warning), color: .yellow, message: message)
    }
}
