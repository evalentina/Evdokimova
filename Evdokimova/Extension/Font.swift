//
//  Font.swift
//  Evdokimova
//
//  Created by Валентина Евдокимова on 01.07.2023.
//

import SwiftUI

enum SFProDisplay: String {
    case medium = "SFProDisplay-Medium"
    case regular = "SFProDisplay-Regular"
    case semibold = "SFProDisplay-Semibold"
}

struct FontModifier: ViewModifier {
    var name: SFProDisplay.RawValue
    var size: Double

    func body(content: Content) -> some View {
        return content.font(.custom(name, size: size))
    }
}

extension View {
    func textStyle(weight: SFProDisplay, size: Double) -> some View {
        return self.modifier(FontModifier(name: weight.rawValue, size: size))
    }
}
