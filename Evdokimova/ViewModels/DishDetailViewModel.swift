//
//  DishDetailviewModel.swift
//  Evdokimova
//
//  Created by Валентина Евдокимова on 30.06.2023.
//

import Foundation

class DishDetailViewModel: ObservableObject, Identifiable {
    
    private unowned let coordinator: MainViewCoordinatorObject
    @Published var dish: Dish
    @Published var dishesInCart: [Dish : Int] = [:]
    
    init(dish: Dish, coordinator: MainViewCoordinatorObject) {
        self.dish = dish
        self.coordinator = coordinator
    }
    
    func close() {
        self.coordinator.closeDishDetail()
    }
    /*
    func addToCart() {
        guard let dish = dish else { return }
        dishesInCart[dish, default: 0] += 1
    }
     */
}

