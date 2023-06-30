//
//  TabCoordinatorOnject.swift
//  Evdokimova
//
//  Created by Валентина Евдокимова on 28.06.2023.
//

import Foundation

class TabCoordinatorObject: ObservableObject {
    
    @Published var tab = Tabs.main
    @Published var mainViewCoordinator: MainViewCoordinatorObject!
    
    init() {
        self.mainViewCoordinator = .init(parentCoordinator: self)
    }
}
