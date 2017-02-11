//
//  Pokemon.swift
//  Pokelist
//
//  Created by Dmytro Aprelenko on 04.02.17.
//  Copyright © 2017 Dmytro Aprelenko. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    private var _name: String!
    private var _pokemId: Int!
    private var _type: String!
    private var _defense: String!
    private var _description: String!
    private var _height: String!
    private var _weignt: String!
    private var _baseAttack: String!
    private var _nextEvo: String!
    private var _nextEvoName: String!
    private var _nextEvoID: String!
    private var _nextEvoLvl: String!
    private var _pokemonURL: String
    
    var nextEvoName: String {
        if _nextEvoName == nil {
            _nextEvoName = ""
        }
        return _nextEvoName
    }
    
    var nextEvoID: String {
       if _nextEvoID == nil {
            _nextEvoID = ""
        }
        return _nextEvoID
    }
    
    var nextEvoLvl: String {
        if _nextEvoLvl == nil {
            _nextEvoLvl = ""
        }
        return _nextEvoLvl
    }
    
    var nextEvo: String {
        if _nextEvo == nil {
            _nextEvo = ""
    }
        return _nextEvo
    }
    
    var attack: String {
        if _baseAttack == nil {
            _baseAttack = ""
        }
        return _baseAttack
    }
    
    var weignt: String {
        if _weignt == nil {
            _weignt = ""
        }
        return _weignt
    }
    
    var height: String {
        if _height == nil {
            _height = ""
        }
        return _height
    }
    
    var description: String {
        if _description == nil {
            _description = ""
        }
        return _description
    }
    
    var defense: String {
        if _defense == nil {
            _defense = ""
        }
        return _defense
        
    }
    
    var type: String {
        if _type == nil {
            _type = ""
        }
        return _type
    }
    
    var name: String {
        if _name == nil {
            _name = ""
        }
        return _name.capitalized
    }
    var pokemId: Int {
        return _pokemId
    }
    
    init(name: String, pokemId: Int) {
        self._name = name
        self._pokemId = pokemId
        
        self._pokemonURL = "\(URL_BASE)\(POKEMON_URL)\(pokemId)/"
    }
    
    func downloadPokemonDetail(completed: @escaping DownloadComplete) {
        Alamofire.request(_pokemonURL).responseJSON { response in
            if let JSON = response.result.value {
                //print("JSON: \(JSON)")
                if let dict = JSON as? Dictionary<String, Any> {
                    if let attack = dict["attack"] as? Int {
                            self._baseAttack = "\(attack)"
                        //print ("Attack is:\(attack)")
                        }
                    if let defense = dict["defense"] as? Int {
                            self._defense = "\(defense)"
                            //print ("Defence is:\(defense)")
                        }
                    if let weight = dict["weight"] as? String {
                            self._weignt = weight
                       // print ("Weight is:\(weight)")
                        }
                    if let height = dict["height"] as? String {
                        self._height = height
                       // print ("Height is:\(height)")
                    }
                    
                    if let type = dict["types"] as? [Dictionary<String, String>] , type.count > 0 {
                        if let nameType = type[0]["name"]  {
                            self._type = nameType.capitalized
                           // print(nameType)
                        }
                        if type.count > 1 {
                            for x in 1..<type.count {
                                if let name = type[x]["name"] {
                                    self._type! += "/\(name.capitalized)"
                                }
                            }
                        }
                       // print(self._type)
                    } else {
                        self._type = ""
                    }
                    
                    if let descriptionArray = dict["descriptions"] as? [Dictionary<String, String>] , descriptionArray.count > 0 {
                        if let url = descriptionArray[0]["resource_uri"]
                        {
                             let descriptURL = "\(URL_BASE)\(url)"
                            Alamofire.request(descriptURL).responseJSON { response in
                                if let JSON = response.result.value {
                                    if let dict = JSON as? Dictionary<String, Any> {
                                        if let description = dict["description"] as? String {
                                            let newDescription = description.replacingOccurrences(of: "POKMON", with: "pokemon")
                                            self._description = newDescription
                                            //print("Oh my, here you are: \(newDescription)")
                                        }
                                    }
                                    completed()
                                }
                            }
                        }
                    } else {
                        self._description = "Check again"
                    }
                    
                    if let evolutions = dict["evolutions"] as? [Dictionary<String, Any>] , evolutions.count > 0 {
                        if let nextEvo = evolutions[0]["to"] as? String {
                            
                            if nextEvo.range(of: "mega") == nil {
                                
                                self._nextEvoName = nextEvo
                                
                                if let uri  = evolutions[0]["resource_uri"] as? String {
                                    let newStr = uri.replacingOccurrences(of: "/api/v1/pokemon/", with: "")
                                    let nextEvoId = newStr.replacingOccurrences(of: "/", with: "")
                                    
                                    self._nextEvoID = nextEvoId
                                    
                                    if let lvlExist = evolutions[0]["level"] {
                                        
                                        if let lvl  = lvlExist as? Int {
                                            self._nextEvoLvl = "\(lvl)"
                                        }
                                        
                                    } else {
                                        self._nextEvoLvl = ""
                                    }
                                }
                            }
                        }
                        
//                        print(self._nextEvoLvl)
//                        print(self.nextEvoID)
//                        print(self._nextEvoName)
                    }
                    
                    }
                completed()
                }
            }
        }
        
}
