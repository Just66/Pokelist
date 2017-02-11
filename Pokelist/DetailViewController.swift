//
//  DetailViewController.swift
//  Pokelist
//
//  Created by Dmytro Aprelenko on 08.02.17.
//  Copyright © 2017 Dmytro Aprelenko. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var  pokemon: Pokemon!

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenceLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var iDLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBaseParametrs()
        
        pokemon.downloadPokemonDetail {
            //Whatever you write here will only be called after the network call is complete
            self.updateUI()
           
        }
     
    }
    
    func updateUI() {
        attackLbl.text = pokemon.attack
        defenceLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weignt
        typeLbl.text = pokemon.type
        descriptionLbl.text = pokemon.description
        
        if pokemon.nextEvoID == "" {
            evoLbl.text = "No Evolutions"
            nextEvoImg.isHidden = true
        } else {
        nextEvoImg.isHidden = false
        nextEvoImg.image = UIImage(named: "\(pokemon.nextEvoID)")
        evoLbl.text = "Next Evolution: \(pokemon.nextEvoLvl) \(pokemon.nextEvoName)"
            
        }
        
    }
    
    func setBaseParametrs() {
        nameLbl.text = pokemon.name
        let image = UIImage(named: "\(pokemon.pokemId)")
        mainImage.image = image
        currentEvoImg.image = image
        iDLbl.text = ("\(pokemon.pokemId)")

    }


    @IBAction func backBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
