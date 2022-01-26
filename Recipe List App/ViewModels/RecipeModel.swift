//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Samuel Hertz on 1/23/22.
//

import Foundation
import SwiftUI

class RecipeModel:ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        // Create an instance of data service and get the data
        self.recipes = DataService.getLocalData()
        
    }
}
