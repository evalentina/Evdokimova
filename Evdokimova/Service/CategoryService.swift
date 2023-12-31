//
//  DishesServ.swift
//  Evdokimova
//
//  Created by Валентина Евдокимова on 11.07.2023.
//

import Foundation
import Combine

class CategoriesService {
    
    // MARK: Properties
    @Published var categories = Categories(сategories: [])
    var categoriesSubscription: AnyCancellable?
    
    // MARK: Initialization
    
    init() {
        getCategories()
    }

    // MARK: Get categories using NetworkManager
    
    func getCategories() {
        guard let url = URL(string: "https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54") else { return }
        categoriesSubscription = NetworkManager.downdlowad(url: url)
            .decode(type: Categories.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] returnedCategories in
                self?.categories = returnedCategories
                self?.categoriesSubscription?.cancel()
            })
    }
}

