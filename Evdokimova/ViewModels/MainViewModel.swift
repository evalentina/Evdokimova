//
//  MainViewModel.swift
//  Evdokimova
//
//  Created by Валентина Евдокимова on 29.06.2023.
//

import Foundation
import Combine

class MainViewModel: ObservableObject {
    
    // MARK: Properties
    
    @Published var categories = Categories(сategories: [])
    
    private unowned let coordinator: MainViewCoordinatorObject
    var categoriesSubscription: AnyCancellable?
    
    // MARK: Initialization
    
    init(coordinator: MainViewCoordinatorObject) {
        self.coordinator = coordinator
    }
    
    // MARK: Open selected category
    
    func open(_ category: СategoryModel) {
        self.coordinator.open(category: category)
    }
    
    // MARK: Get categories using NetworkManager
    
    func getCategories() async {
        guard let url = URL(string: "https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54") else { return }
        categoriesSubscription = NetworkManager.downdlowad(url: url)
            .decode(type: Categories.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] (returnedCategories) in
                self?.categories = returnedCategories
                self?.categoriesSubscription?.cancel()                
            })
    }    
}
