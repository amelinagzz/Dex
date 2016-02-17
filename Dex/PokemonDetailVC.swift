//
//  PokemonDetailVC.swift
//  Dex
//
//  Created by Adriana Gonzalez on 2/16/16.
//  Copyright © 2016 Adriana Gonzalez. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    var pokemon: Pokemon!
    
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = pokemon.name.capitalizedString
        let img = UIImage(named: "\(pokemon.pokedexID)")
        mainImg.image = img
        currentEvoImg.image = img
        pokemon.downloadPokemonDetails { () -> () in
            self.updateUI()
        }
        
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSFontAttributeName: UIFont(name: "Helvetica", size: 20)!, NSForegroundColorAttributeName: UIColor.whiteColor()
        ]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUI() {
        descriptionLbl.text = pokemon.description
        typeLbl.text = pokemon.type
        defenseLbl.text = pokemon.defense
        attackLbl.text = pokemon.attack
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        pokedexLbl.text = "\(pokemon.pokedexID)"
        
        if pokemon.nextEvoID == "" {
            evoLbl.text = "No Evolutions"
            nextEvoImg.hidden = true
        }else {
            nextEvoImg.hidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvoID)
            var str = "Next Evolution: \(pokemon.nextEvoTxt)"
            if pokemon.nextEvoLvl != "" {
                str += " - LVL \(pokemon.nextEvoLvl)"
            }
             evoLbl.text = str
        }
    }
}
