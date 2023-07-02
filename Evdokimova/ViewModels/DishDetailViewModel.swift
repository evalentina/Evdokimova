//
//  DishDetailviewModel.swift
//  Evdokimova
//
//  Created by Валентина Евдокимова on 30.06.2023.
//

import Foundation

class DishDetailViewModel: ObservableObject, Identifiable {
    
    // MARK: Properties
    
    @Published var dish: Dish
    @Published var dishesInCart: [Dish : Int] = [:]
    
    private unowned let coordinator: MainViewCoordinatorObject
    
    // MARK: Initialization
    
    init(dish: Dish, coordinator: MainViewCoordinatorObject) {
        self.dish = dish
        self.coordinator = coordinator
    }
    
    // MARK: Close dish detail view
    
    func close() {
        self.coordinator.closeDishDetail()
    }
}

