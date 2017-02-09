//
//  Pokemon.swift
//  Pokelist
//
//  Created by Dmytro Aprelenko on 04.02.17.
//  Copyright © 2017 Dmytro Aprelenko. All rights reserved.
//

import Foundation


class Pokemon {
    private var _name: String!
    private var _pokemId: Int!
    private var _type: String!
    private var _defense: String!
    private var _description: String!
    private var _height: String!
    private var _weignt: Int!
    private var _baseAttack: Int!
    private var nextEvo: String!
    
    var name: String {
        return _name
    }
    var pokemId: Int {
        return _pokemId
    }
    
    init(name: String, pokemId: Int) {
        self._name = name
        self._pokemId = pokemId
    }
    
    
}
