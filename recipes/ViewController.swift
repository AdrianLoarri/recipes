//
//  ViewController.swift
//  recipes
//
//  Created by Adrian Loarri on 11/07/2017.
//  Copyright © 2017 Adrian Loarri. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var recipes : [Recipe] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MOFICA EL BOTON DE REGRESAR EN LA BARRA DEL MENU
        
        navigationItem.backBarButtonItem = UIBarButtonItem (title: "", style: .plain, target: nil, action: nil)
        
        /*OCULTA LA BARRA DE NAVEGACION CUANDO DESLIZAMOS Y APARECE SI REGRESAMOS A TOP
        
        navigationController?.hidesBarsOnSwipe = true */
        
                // MUESTRA LOS SIGUIENTES DETALLES DECLARADOS EN EL ARCHIVO RECIPE

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

    // OCULTA Y MUESTRA BARRA DE NAVEGACION TOP

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //MARK : - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]
        let cellID = "RecipeCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! RecipeCell
        
        cell.thumbnailImageView.image = recipe.image
        cell.nameLabel.text = recipe.name
        cell.timeLabel.text = "\(recipe.time!) min"
        cell.ingredientsLabel.text = "ingredientes: \(recipe.ingredients.count)"
        
        
        /*if recipe.isfavourite {
            cell.accessoryType = .checkmark
        } else{
            cell.accessoryType = .none
        }*/
        
        /*cell.thumbnailImageView.layer.cornerRadius = 45.0
        cell.thumbnailImageView.clipsToBounds = true*/
        
        
        return cell
    }
    
    
    // EDITAR CELDAS
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            self.recipes.remove(at: indexPath.row)
        }
        
        /*ESTA FORMA DE BORRAR LINEAS ES MAS EFECTIVA QUE DELETE ROW, PORQUE EL INDEXPATH SE ENCARGA DE ACTUALIZAR LA LISTA */
        
        self.tableView.deleteRows(at: [indexPath], with: .fade)
     
    
    // VERIFICAR POR IMPRESION LA RECETA
        
        for recipe in self.recipes{
            print(recipe.name)
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        // COMPARTIR UIACTIVITYVIEWCONTROLLER MUESTRA DIFERENTES ACCIONES DE APPLE, COMO COPIAR EN PORTAPALES
        
        let shareAction = UITableViewRowAction (style: .default, title: "Share") { (action, indexPath) in
            let shareDefaultText = "I'm checking the recipe \(self.recipes[indexPath.row].name!) in Loarri's app"
            
            let activityController = UIActivityViewController(activityItems: [shareDefaultText, self.recipes[indexPath.row].image!], applicationActivities: nil)
            self.present(activityController, animated: true, completion: nil)
        }
        
        shareAction.backgroundColor = UIColor(red: 59.0/255.0, green: 89.0/255.0, blue: 152.0/255.0, alpha: 1.0)
        
        // HACE QUE BORRAR NO DESAPAREZCA 
        
        let deleteAction = UITableViewRowAction(style: .default, title: "delete") { (action, indexPath) in
            self.recipes.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 202.0/255, alpha: 1.0)
        
        
        return [shareAction, deleteAction]
    
    }
    
    
    //MARK : - UITableViewDelegate  CREA MENSAJE DE ALERTA PARA SELECCIONAR FAVORITOS
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        /*let recipe = self.recipes[indexPath.row]
        
        let alertController = UIAlertController(title: recipe.name, message: "value this food", preferredStyle: .alert)
        
        //BOTONES CON ACCIONES  CANCELAR - AÑADIR
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        
        
        var favouriteActionTitle = "Favourite"
        var favouriteActionStyle = UIAlertActionStyle.default
        if recipe.isfavourite {
            favouriteActionTitle = "Not favourite"
            favouriteActionStyle = UIAlertActionStyle.destructive
        }
        
        //ALERTA QUE SE MUESTRA AL DAR CLICK EN LA CELDA
        
        let favouriteAction = UIAlertAction(title: favouriteActionTitle, style: favouriteActionStyle) { (action) in
            let recipe = self.recipes[indexPath.row]
            recipe.isfavourite = !recipe.isfavourite
            self.tableView.reloadData()
        }
        
        alertController.addAction(favouriteAction)
        
        
        self.present(alertController, animated: true, completion: nil)*/
     
    }
    
    
    // COMO LLAMAR UN SEGUE PARA QUE TRANSFIERA INFORMACIÓN DE OTRO VIEW CONTROLLER
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecipeDetail" {
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedRecipe = self.recipes[indexPath.row]
                let destinationViewController = segue.destination as! DetailViewController
                destinationViewController.recipe = selectedRecipe
                
            }
        }
    }
    
  
    
}

