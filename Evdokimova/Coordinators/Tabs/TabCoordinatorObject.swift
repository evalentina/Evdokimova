//
//  TabCoordinatorOnject.swift
//  Evdokimova
//
//  Created by Валентина Евдокимова on 28.06.2023.
//

import Foundation

class TabCoordinatorObject: ObservableObject {
    
    // MARK: Properties
    
    @Published var tab = Tabs.main
    @Published var mainViewCoordinator: MainViewCoordinatorObject!
    
    // MARK: Initialization
    
    init() {
        self.mainViewCoordinator = .init(parentCoordinator: self)
    }
}
