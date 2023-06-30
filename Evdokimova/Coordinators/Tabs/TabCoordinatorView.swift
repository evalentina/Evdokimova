//
//  TabCoordinatorView.swift
//  Evdokimova
//
//  Created by Валентина Евдокимова on 28.06.2023.
//

import SwiftUI

struct TabCoordinatorView: View {
    
    @ObservedObject var coordinator: TabCoordinatorObject
    @StateObject var viewModel = CartViewModel()
    
    var body: some View {
        NavigationView {
            TabView(selection: $coordinator.tab) {
                MainViewCoordinatorView(coordinator: coordinator.mainViewCoordinator)
                    .tabItem { TabViewItem(type: .main) }
                    .tag(Tabs.main)
                SearchView()
                    .tabItem { TabViewItem(type: .search) }
                    .tag(Tabs.search)
                CartView()
                    .tabItem { TabViewItem(type: .cart) }
                    .tag(Tabs.cart)
                UserView()
                    .tabItem { TabViewItem(type: .user) }
                    .tag(Tabs.user)
                    
            }
            .environmentObject(viewModel)
            .navigationTitle("Title")
        }
       
    }
}

struct TabCoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        TabCoordinatorView(coordinator: .init())
    }
}

