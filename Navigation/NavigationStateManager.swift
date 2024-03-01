//
//  NavigationStateManager.swift
//  Navigation
//
//  Created by Karan Singh on 01/03/24.
//

import Foundation
import SwiftUI

class NavigationStateManager : ObservableObject{
    
    @Published var selectionPath = NavigationPath()
    
    func popToRoot(){
        selectionPath = NavigationPath()
    }
    
    func goToSettings(){
        //... Manipulation
    }
    
}
