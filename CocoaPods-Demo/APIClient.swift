//
//  APIClient.swift
//  CocoaPods-Demo
//
//  Created by Kelby Mittan on 2/27/20.
//  Copyright © 2020 Kelby Mittan. All rights reserved.
//

import Foundation
import Alamofire

struct APIClient {
    
    static func fetchCocktail(completion: @escaping (AFResult<Cocktail>) -> ()) {
        let endpointURLString = "https://www.thecocktaildb.com/api/json/v1/1/random.php"
        
        guard let url = URL(string: endpointURLString) else {
            return
        }
        
        
        
        AF.request(url).response { (response) in
            
            if response.error != nil {
                
            } else if let data = response.data {
                do {
                    let results = try JSONDecoder().decode(DrinksWrapper.self, from: data)
                    if let cocktail = results.drinks.first {
                        completion(.success(cocktail))
                    }
                } catch {
                    print("error")
                }
            }
            
        }
    }
    
}
