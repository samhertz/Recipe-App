//
//  DataService.swift
//  Recipe List App
//
//  Created by Samuel Hertz on 1/23/22.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        
        // Parse local json file
        
        // Get a URL path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        //check if path string is not nil, otherwise...
        guard pathString != nil else {
            return [Recipe]()
        }
        
        // Create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            
            // Create a data object
            let data = try Data(contentsOf: url)
            
        // Decode the data with a json decoder
            let decoder = JSONDecoder()
        
            do {
            
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // Add the unique IDs
                for r in recipeData {
                    r.id = UUID()
                    
                    //Add unique IDs to recipe ingredients
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                }
                // Return the recipes
                return recipeData
                
                }
            
            catch {
                print(error)
                }
        
        }
        catch {
            print(error)
            
        }

        return [Recipe]()
    }
    
}
