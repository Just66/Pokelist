//
//  PokeCell.swift
//  Pokelist
//
//  Created by Dmytro Aprelenko on 05.02.17.
//  Copyright © 2017 Dmytro Aprelenko. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var thumgImage: UIImageView!
    
    var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }
    
    func configureCell(pokemon: Pokemon) {
         self.pokemon = pokemon
        
        nameLbl.text = pokemon.name.capitalized
        thumgImage.image = UIImage(named: "\(self.pokemon.pokemId)")
    }
    
    
}
