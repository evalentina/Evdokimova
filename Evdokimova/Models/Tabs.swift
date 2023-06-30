//
//  Tabs.swift
//  Evdokimova
//
//  Created by Валентина Евдокимова on 28.06.2023.
//

import Foundation
import SwiftUI

enum Tabs: String {
    case main = "Главная"
    case search = "Поиск"
    case cart = "Корзина"
    case user = "Аккаунт"

    var image: Image {
        switch self {
        case .main:  return Image("home")
        case .search:   return Image("search")
        case .cart: return Image("cart")
        case .user: return Image("user")
        }
    }

    var text: Text {
        Text(self.rawValue)
    }
}

struct TabViewItem: View {

    var type: Tabs

    var body: some View {
        VStack {
            type.image.renderingMode(.template)
            type.text
        }
    }
}
