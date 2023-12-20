//
//  Color+Extensions.swift
//
//  Created by James Sedlacek on 12/17/23.
//

import SwiftUI

#if canImport(AppKit)
import AppKit
public typealias ColorRepresentable = NSColor
#endif

#if canImport(UIKit)
import UIKit
public typealias ColorRepresentable = UIColor
#endif

extension Color {
    init(_ color: ColorRepresentable) {
#if canImport(AppKit)
        self.init(nsColor: color)
#endif
#if canImport(UIKit)
        self.init(uiColor: color)
#endif
    }
}

extension Color {
#if canImport(AppKit)
    static let secondaryBackground: Color = Color(.windowBackgroundColor)
#endif
#if canImport(UIKit)
    static let secondaryBackground: Color = Color(.secondarySystemBackground)
#endif
}
