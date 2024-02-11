//
//  View+Presenting.swift
//
//  Created by James Sedlacek on 2/11/24.
//

import SwiftUI

extension View {
    public func presenting<Routes: Presentable>(using presenter: Presenter<Routes>) -> some View {
        self.modifier(PresentingModifier(presenter: presenter))
    }

    public func presenting(using presenter: BasicPresenter) -> some View {
        self.modifier(BasicPresentingModifier(presenter: presenter))
    }
}
