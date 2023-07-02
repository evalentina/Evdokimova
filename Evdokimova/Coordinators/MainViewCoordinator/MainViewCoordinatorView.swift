//
//  MainViewCoordinatorView.swift
//  Evdokimova
//
//  Created by Валентина Евдокимова on 29.06.2023.
//

import SwiftUI

struct MainViewCoordinatorView: View {
    
    // MARK: Properties
    
    @ObservedObject var coordinator: MainViewCoordinatorObject
    
    var body: some View {
        
        NavigationView {
            CustomNavigationBarContainer {
                MainView(viewModel: coordinator.viewModel)
                    .navigation(item: $coordinator.choosenCategoryViewModel) { viewModel in
                        choosenCategoryView(viewModel)
                            .navigationTitle(viewModel.category.name)
                        
                    }
            }
        }
    }
    
    // MARK: Open the selected category, after which you can open the full screen cover with the full description of the dish
    
    @ViewBuilder
    private func choosenCategoryView(_ viewModel: SelectedCategoryViewModel) -> some View {
        SelectedCategoryView(viewModel: viewModel,
                            detailModifier: FullScreenCoverModifier(item: $coordinator.detailDishViewModel) { viewModel in
                
                    DishDetailView(viewModel: viewModel)
                        .background(ClearBackgroundView())       
            }
        )
    }
}

struct MainViewCoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        MainViewCoordinatorView(coordinator: .init(parentCoordinator: .init()))
    }
}
