//
//  CartViewModel.swift
//  Evdokimova
//
//  Created by Валентина Евдокимова on 30.06.2023.
//

import Foundation

class CartViewModel: ObservableObject {
    
    @Published var dishesInCart: [Dish : Int] = [:]
    
    func addToCart(dish: Dish) {
        dishesInCart[dish, default: 0] += 1
    }
    
    func plusButton(dish: Dish) {
        dishesInCart[dish, default: 0] += 1
    }
    
    func minusButton(dish: Dish) {
        dishesInCart[dish, default: 0] -= 1
    }
    
    
}
