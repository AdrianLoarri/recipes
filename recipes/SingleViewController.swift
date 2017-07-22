//
//  SingleViewController.swift
//  recipes
//
//  Created by Adrian Loarri on 12/07/2017.
//  Copyright © 2017 Adrian Loarri. All rights reserved.
//

import UIKit

class SingleViewController: UIViewController {
    
    
    @IBOutlet var tableView: UITableView!
    

    var recipes : [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var recipe = Recipe(name: "Burgers",
                            image: #imageLiteral(resourceName: "burger"),
                            time: 10,
                            ingredients: ["meat", "bread", "salad", "cheese"],
                            steps: ["cook meat", "warm bread", "add salad"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Fries",
                        image: #imageLiteral(resourceName: "fries"),
                        time: 10,
                        ingredients: ["meat", "bread", "salad", "cheese"],
                        steps: ["cook meat", "warm bread", "add salad"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Hot dogs",
                        image: #imageLiteral(resourceName: "hot-dog"),
                        time: 10,
                        ingredients: ["meat", "bread", "salad", "cheese"],
                        steps: ["cook meat", "warm bread", "add salad"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Milkshake",
                        image: #imageLiteral(resourceName: "shakes"),
                        time: 10,
                        ingredients: ["meat", "bread", "salad", "cheese"],
                        steps: ["cook meat", "warm bread", "add salad"])
        recipes.append(recipe)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

}


extension SingleViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]
        let cellID = "RecipeCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! RecipeCell
        
        cell.thumbnailImageView.image = recipe.image
        cell.nameLabel.text = recipe.name

        
        
        return cell
    }
}
