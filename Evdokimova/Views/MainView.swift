//
//  MainView.swift
//  Evdokimova
//
//  Created by Валентина Евдокимова on 28.06.2023.
//

import SwiftUI

struct MainView: View {
    
    var gridLayout = [GridItem()]
    @ObservedObject var viewModel : MainViewModel
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 8) {

                ForEach(viewModel.categories.сategories) { category in
                    AsyncImage(url: URL(string: category.imageURL)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 150)
                    
                    .overlay(
                        Text(category.name)
                            .font(.callout)
                            .foregroundColor(.black)
                            .padding(.top, 12)
                            .padding(.leading, 16), alignment: .topLeading)
                    .onNavigation { viewModel.open(category) }
                }
                
            }
            .task {
                await viewModel.getCategories()
            }
            .padding(.horizontal, 16)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel(coordinator: MainViewCoordinatorObject(parentCoordinator: .init())))
    }
}
 

