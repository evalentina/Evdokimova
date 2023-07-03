//
//  ChoosenCategoryView.swift
//  Evdokimova
//
//  Created by Валентина Евдокимова on 29.06.2023.
//

import SwiftUI

struct SelectedCategoryView<DetailModifier: ViewModifier>: View {
    
    // MARK: Properties
    
    @ObservedObject var viewModel: SelectedCategoryViewModel
    let detailModifier: DetailModifier
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    // MARK: GridItem Properties
    
    var gridLayoutColumns = [GridItem(), GridItem(), GridItem()]
    var gridLayoutRows = [GridItem()]
    
    var body: some View {
        
        ScrollView {
            
            dishes
            
        }
        .task {
            
            // MARK: Get dishes using network manager
            
            viewModel.getDishes()
        }
        
        // MARK: NavigationBar configuration
        
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    Text(viewModel.category.name)
                        .textStyle(weight: .medium, size: 18)
                }
            }
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    self.mode.wrappedValue.dismiss()
                } label: {
                    Image(ImageNames.arrow.rawValue)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                ReusableUserImage()
            }
        }
        
    }
}

extension SelectedCategoryView {
    
    // MARK: Tags of dishes. When you click on the tag, the list of dishes is filtered. The tags are at the top while scrolling.
    
    var tagsOfDishes: some View {
        HStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: gridLayoutRows, spacing: 8) {
                    ForEach(Teg.allCases, id: \.self) { item in
                        Button {
                            viewModel.selectedTag = item
                            viewModel.filterData()
                        } label: {
                            Text(item.rawValue)
                                .textStyle(weight: .regular, size: 14)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 10)
                                .foregroundColor(viewModel.selectedTag == item ? .white : .black)
                                .background(viewModel.selectedTag == item ? Color.blueColor : Color.buttonColor)
                                .cornerRadius(10)
                        }
                    }
                }
            }
        }
        .padding(.vertical, 8)
        .background(Color.white)
        
    }
    
    // MARK: Grid for all dishes in the category
    
    var dishes: some View {
        
        LazyVGrid(columns: gridLayoutColumns, alignment: .center, spacing: 8, pinnedViews: [.sectionHeaders]) {
            
            //MARK: Makes tags pinned to the top
            Section {
                
                ForEach(viewModel.filteredDishes) { dish in
                    
                    dishesView(dish)
                }
                
            } header: {

                tagsOfDishes
                    .padding(.trailing, -16)
            }
            
        }
        .padding(.horizontal , 16)
    }
    
    
    @ViewBuilder
    func dishesView(_ dish: Dish) -> some View {
        Button {
            viewModel.openDishDetail(dish: dish)
        } label : {
            VStack(alignment: .leading) {
                
                GeometryReader { geo in
                    // MARK: Geometry Reader modifies alignment, therefore, an additional stack is needed
                    
                    VStack(spacing: 0) {
                        AsyncImageReusableView(imageURLString: dish.imageURL)
                    }
                    .frame(width: geo.size.width,
                           height: geo.size.height,
                           alignment: .center)
                }
                .clipped()
                .aspectRatio(1, contentMode: .fit)
                .padding()
                .background(Color.buttonColor.cornerRadius(10))
                
                Text(dish.name)
                    .textStyle(weight: .regular, size: 14)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .frame(height: 35, alignment: .topLeading)
            }
            
        }
        .modifier(detailModifier)
        
    }
}

struct SelectedCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedCategoryView(viewModel: SelectedCategoryViewModel(category: .categoryhMock, coordinator: .init(parentCoordinator: .init())), detailModifier: EmptyModifier())
    }
}




