//
//  ChoosenCategoryViewModel.swift
//  Evdokimova
//
//  Created by Валентина Евдокимова on 29.06.2023.
//

import Foundation
import Combine

class SelectedCategoryViewModel: ObservableObject {
    
    // MARK: Properties
    
    @Published var category : СategoryModel
    @Published var dishes: Dishes = Dishes(dishes: [])
    @Published var selectedTag: Teg = .всеМеню
    @Published var filteredDishes = [Dish]()
    
    private unowned let coordinator: MainViewCoordinatorObject
    private var cancellables = Set<AnyCancellable>()
    private var dishesService = DishesService()
    
    // MARK: Initialization
    
    init(category: СategoryModel, coordinator: MainViewCoordinatorObject) {
        self.category = category
        self.coordinator = coordinator
        addSubscribers()
    }
    
    private func addSubscribers() {
        dishesService.$dishes
            .sink { [weak self] returnedDishes in
                self?.dishes = returnedDishes
                self?.filteredDishes = returnedDishes.dishes
            }.store(in: &cancellables)
    }
    
    // MARK: Get dishes using NetworkManager
    /*
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
     */
    
    // MARK: Show data depending on the selected tag
    
    func filterData() {
        switch selectedTag {
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
    
    // MARK: Open information about the selected dish
    
    func openDishDetail(dish: Dish) {
        self.coordinator.openDishDetail(for: dish)
    }
    
}
