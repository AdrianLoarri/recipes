//
//  recipe.swift
//  recipes
//
//  Created by Adrian Loarri on 11/07/2017.
//  Copyright © 2017 Adrian Loarri. All rights reserved.
//

import Foundation
import UIKit

class Recipe: NSObject {
    var name : String!
    var image : UIImage!
    var time : Int!
    var ingredients : [String]!
    var steps : [String]!
    
    //var isfavourite : Bool = false
    
    
    //TRUCO DE PROGRAMACION, SI EL USUARIO NO HA SELECCIONADO NADA EL VALOR DE LA VARIABLE REFIERE A LA IMAGEN PREDETERMINADA
    
    
    var rating : String = "rating"
    
    init(name: String, image: UIImage, time: Int, ingredients: [String], steps: [String]) {
        self.name = name
        self.image = image
        self.time = time
        self.ingredients = ingredients
        self.steps = steps
    }
    
    
    
}
