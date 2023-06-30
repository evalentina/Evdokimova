//
//  MainViewCoordinatorObject.swift
//  Evdokimova
//
//  Created by Валентина Евдокимова on 29.06.2023.
//

import Foundation

class MainViewCoordinatorObject: ObservableObject {
    
    // MARK: Stored Properties
    @Published var viewModel: MainViewModel!
    @Published var choosenCategoryViewModel: ChoosenCategoryViewModel?
    @Published var detailDishViewModel: DishDetailViewModel?

    private unowned let parentCoordinator: TabCoordinatorObject

    // MARK: Initialization

    init(parentCoordinator: TabCoordinatorObject) {
        self.parentCoordinator = parentCoordinator
        self.viewModel = .init(coordinator: self)
        
    }

    // MARK: Methods

    func open(category: СategoryModel) {
        self.choosenCategoryViewModel = .init(category: category, coordinator: self)
    }
   

    func openDishDetail(for dish: Dish) {
        self.detailDishViewModel = .init(dish: dish, coordinator: self)
    }
    
    func closeDishDetail() {
        self.detailDishViewModel = nil
    }
}


