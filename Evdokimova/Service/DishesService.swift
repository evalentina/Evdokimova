//
//  DishesService.swift
//  Evdokimova
//
//  Created by Валентина Евдокимова on 11.07.2023.
//

import Foundation
import Combine

class DishesService {
    
    // MARK: Properties
    @Published var dishes: Dishes = Dishes(dishes: [])
    @Published var filteredDishes = [Dish]()
    var dishesSubscription: AnyCancellable?
    
    // MARK: Initialization
    
    init() {
        getDishes()
    }

    // MARK: Get categories using NetworkManager
    
    func getDishes() {
        guard let url = URL(string: "https://run.mocky.io/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b") else { return }
        dishesSubscription = NetworkManager.downdlowad(url: url)
            .decode(type: Dishes.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] returnedDishes in
                self?.dishes = returnedDishes
                self?.filteredDishes = returnedDishes.dishes
                self?.dishesSubscription?.cancel()
            })
    }
}

