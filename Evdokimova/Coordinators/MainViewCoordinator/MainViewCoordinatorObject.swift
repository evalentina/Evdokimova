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
    @Published var choosenCategoryViewModel: SelectedCategoryViewModel?
    @Published var detailDishViewModel: DishDetailViewModel?

    private unowned let parentCoordinator: TabCoordinatorObject

    // MARK: Initialization

    init(parentCoordinator: TabCoordinatorObject) {
        self.parentCoordinator = parentCoordinator
        self.viewModel = .init(coordinator: self)
        
    }

    // MARK: Methods
    
    // MARK: Open category
    func open(category: СategoryModel) {
        self.choosenCategoryViewModel = .init(category: category, coordinator: self)
    }
    
    // MARK: Open dish detail
    func openDishDetail(for dish: Dish) {
        self.detailDishViewModel = .init(dish: dish, coordinator: self)
    }
    
    // MARK: Close full screen cover with dish detail
    func closeDishDetail() {
        self.detailDishViewModel = nil
    }
}


