//
//  ChoosenCategoryViewModel.swift
//  Evdokimova
//
//  Created by Валентина Евдокимова on 29.06.2023.
//

import Foundation
import Combine

class ChoosenCategoryViewModel: ObservableObject {
    
    @Published var category : СategoryModel
    @Published var dishes: Dishes = Dishes(dishes: [])
    @Published var choosenTeg: Teg = .всеМеню
    @Published var filteredDishes = [Dish]()
    
    private unowned let coordinator: MainViewCoordinatorObject
    var dishesSubscription: AnyCancellable?
    
    init(category: СategoryModel, coordinator: MainViewCoordinatorObject) {
        self.category = category
        self.coordinator = coordinator
    }
    
    func getDishes() {
        guard let url = URL(string: "https://run.mocky.io/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b") else { return }
        dishesSubscription = NetworkManager.downdlowad(url: url)
            .decode(type: Dishes.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] (returnedDishes) in
                self?.dishes = returnedDishes
                self?.filteredDishes = returnedDishes.dishes
                self?.dishesSubscription?.cancel()
            })
    }
    
    func filterData() {
        switch choosenTeg {
        case .всеМеню:
            self.filteredDishes = dishes.dishes.filter { $0.tegs.contains(Teg.всеМеню)}
        case .сРисом:
            self.filteredDishes = dishes.dishes.filter { $0.tegs.contains(Teg.сРисом)}
        case .сРыбой:
            self.filteredDishes = dishes.dishes.filter { $0.tegs.contains(Teg.сРыбой)}
        case .салаты:
            self.filteredDishes = dishes.dishes.filter { $0.tegs.contains(Teg.салаты)}
        }
    }
    
    func openDishDetail(dish: Dish) {
        self.coordinator.openDishDetail(for: dish)
    }
    
}
