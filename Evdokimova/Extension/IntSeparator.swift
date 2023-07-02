//
//  IntSeparator.swift
//  Evdokimova
//
//  Created by Валентина Евдокимова on 02.07.2023.
//

import SwiftUI

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        return formatter
    }()
}

extension Numeric {
    var formattedWithSeparator: String { Formatter.withSeparator.string(for: self) ?? "" }
}
