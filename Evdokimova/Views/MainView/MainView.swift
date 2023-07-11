//
//  MainView.swift
//  Evdokimova
//
//  Created by Валентина Евдокимова on 28.06.2023.
//

import SwiftUI

struct MainView: View {
    
    // MARK: Properties
    
    @ObservedObject var viewModel : MainViewModel
    
    // MARK: GridItem Properties
    
    var gridLayout = [GridItem()]
    
    var body: some View {
        
        ScrollView {
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 8) {
                ForEach(viewModel.categories.сategories) { category in
                    
                    categoryImage(category.imageURL)
                    .overlay(
                        categoryName(category.name)
                            .padding(.leading, 16), alignment: .topLeading
                    )
                    // MARK: Open the selected category using the coordinator
                    .onNavigation { viewModel.open(category) }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
        }
    }
}

private extension MainView {
    
    // MARK: ViewBuilder for the category name
    
    @ViewBuilder
    func categoryName(_ text: String) -> some View {
        Text(text)
            .textStyle(weight: .medium, size: 20)
            .lineLimit(3)
            .multilineTextAlignment(.leading)
            .foregroundColor(.black)
            .frame(width: 190, alignment: .leading)
            .padding(.top, 12)
    }
    
    // MARK: ViewBuilder for the category image
    
    @ViewBuilder
    func categoryImage(_ imageURLString: String) -> some View {
        AsyncImageReusableView(imageURLString: imageURLString)
        .frame(maxWidth: .infinity)
        .frame(height: 148)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel(coordinator: MainViewCoordinatorObject(parentCoordinator: .init())))
    }
}
 

