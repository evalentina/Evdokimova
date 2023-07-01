//
//  CartViewModel.swift
//  Evdokimova
//
//  Created by Валентина Евдокимова on 30.06.2023.
//

import Foundation

class CartViewModel: ObservableObject {
    
    @Published var dishesInCart: [Dish : Int] = [:]
    @Published var totalPrice: Int = 0
    
    func addToCart(dish: Dish) {
        dishesInCart[dish, default: 0] += 1
    }
    
    func plusButton(dish: Dish) {
        dishesInCart[dish, default: 0] += 1
        totalPrice += dish.price
    }
    
    func minusButton(dish: Dish) {
        dishesInCart[dish, default: 0] -= 1
        totalPrice -= dish.price
    }
    
    func countTotalPrice() {
        for (key, value) in dishesInCart {
            totalPrice += key.price * value
        }
    }
    
    
}
