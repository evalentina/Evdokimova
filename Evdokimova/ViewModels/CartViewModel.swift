//
//  CartViewModel.swift
//  Evdokimova
//
//  Created by Валентина Евдокимова on 30.06.2023.
//

import Foundation

class CartViewModel: ObservableObject {
    
    // MARK: Properties
    
    @Published var dishesInCart: [Dish : Int] = [:]
    @Published var totalPrice: Int = 0
    
    // MARK: The user clicked on the add to cart button on the DishDetailView
    
    func addToCart(dish: Dish) {
        dishesInCart[dish, default: 0] += 1
    }

    // MARK: The user clicked on the plus button
    
    func plusButton(dish: Dish) {
        dishesInCart[dish, default: 0] += 1
        totalPrice += dish.price
    }
    
    // MARK: The user clicked on the minus button
    
    func minusButton(dish: Dish) {
        dishesInCart[dish, default: 0] -= 1
        totalPrice -= dish.price
    }
    
    // MARK: Update property totalPrice
    
    func countTotalPrice() {
        for (key, value) in dishesInCart {
            totalPrice += key.price * value
        }
    }
    
    
}
