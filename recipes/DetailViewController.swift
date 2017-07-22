//
//  DetailViewController.swift
//  recipes
//
//  Created by Adrian Loarri on 16/07/2017.
//  Copyright © 2017 Adrian Loarri. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet var recipeImageView: UIImageView!
    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var ratingBtn: UIButton!
    
    @IBOutlet var nameLabel: UILabel!
    
    var recipe : Recipe!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MUESTRA LA IMAGEN Y EL TITULO
        self.title = self.recipe.name

        //self.nameLabel.text = self.recipe.name!
        
        
        self.recipeImageView.image = self.recipe.image
        
        // EDITA EL COLOR DEL TABLEVIEW
        
        self.tableView.backgroundColor = UIColor (red: 0.9, green: 0.9, blue: 0.9, alpha: 0.25)
        
        // INSTRUCCION PARA QUE TODO LO QUE VENGA DESPUES DE LA ULTIMA CELDA DESAPAREZCA
        
        self.tableView.tableFooterView = UIView (frame: CGRect.zero)
        
        // COLOR DEL SEPARADOR
        
        self.tableView.separatorColor = UIColor (red: 0.9, green: 0.9, blue: 0.9, alpha: 0.75)
        
        
        //DIMENSIONA DE FORMA AUTOMATICA EL TAMAÑO DE LAS CELDAS
        self.tableView.estimatedRowHeight = 44.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        //SE AGREGAN LAS IMAGENES DE FAVORITOS AL INICIALIZAR
        let image = UIImage(named: self.recipe.rating)
        self.ratingBtn.setImage(image, for: .normal)
        
      
        
        
        // OCULTA Y MUESTRA BARRA DE NAVEGACION TOP
        func viewWillAppear(animated: Bool) {
            super.viewWillAppear(animated)
            navigationController?.hidesBarsOnSwipe = false
            navigationController?.setToolbarHidden(false, animated: true)
        }
        
       
        
        // OCULTAR BARRA DE ESTADO
        
        func prefersStatusBarHidden() -> Bool {
            return true
        }
 
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func close(segue: UIStoryboardSegue){
        if let reviewVC = segue.source as? ReviewViewController {
            
            if let rating = reviewVC.ratingSelected {
                self.recipe.rating = rating
                let image = UIImage(named: self.recipe.rating)
                self.ratingBtn.setImage(image, for: .normal)
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
    //RECIBE LA INFORMACION Y LA MUESTRA EN LA TABLA VIEW POR CADA ROW
extension DetailViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 2
        case 1:
            return self.recipe.ingredients.count
        case 2:
            return self.recipe.steps.count
        default:
            return 0
        }
        
    }
    
    // MUESTRA LA INFORMACION DE CADA CELL EN REFERENCIA AL ARCHIVO RECIPE DETAIL TABLE VIEW CELL
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailRecipeCell", for: indexPath) as! RecipeDetailTableViewCell
        
        // INSTRUCCION PARA ELIMINAR EL COLOR DEL CELL
        
        cell.backgroundColor = UIColor.clear
        
        // PERMINTE ANIDAR DOS O MAS SWITCHES 
        
        switch indexPath.section {
            
        // MUESTRA LA SIGUIENTE INFORMACION EN CADA CELL
        case 0:
            switch indexPath.row {
            case 0:
                cell.keyLabel.text = "Name:"
                cell.valueLabel.text = self.recipe.name
            case 1:
                cell.keyLabel.text = "Time:"
                cell.valueLabel.text = "\(self.recipe.time!) min"
            /*case 2:
                cell.keyLabel.text = "Favourite:"
                if self.recipe.isfavourite {
                    cell.valueLabel.text = "Yes"
                } else {
                    cell.valueLabel.text = "No"
                }*/
            default: break
            }
        case 1:
            if indexPath.row == 0 {
                cell.keyLabel.text = "Ingredientes:"
            }else {
                cell.keyLabel.text = ""
            }
            cell.valueLabel.text = self.recipe.ingredients[indexPath.row]
        case 2:
            if indexPath.row == 0 {
                cell.keyLabel.text = "Steps"
            }else {
                cell.keyLabel.text = ""
            }
            cell.valueLabel.text = self.recipe.steps[indexPath.row]
        default:
            break
        }
        
        
        return cell
    }
    
    // FUNCION PARA TITULOS EN HEADER DE CADA SECCION
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title = ""
        switch section {
        case 1:
            title = "Ingredients"
        case 2:
            title = "Steps"
        default:
            break
        }
        return title 
    }
}

extension DetailViewController : UITableViewDelegate {

}
