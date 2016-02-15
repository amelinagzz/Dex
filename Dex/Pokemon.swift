//
//  Pokemon.swift
//  Dex
//
//  Created by Adriana Gonzalez on 2/15/16.
//  Copyright © 2016 Adriana Gonzalez. All rights reserved.
//

import Foundation

class Pokemon {
    
    private var _name: String!
    private var _pokedexID: Int!
    
    
    var name: String {
        return _name
    }
    
    var pokedexID: Int {
        return _pokedexID
    }
    
    init(name: String, pokedexID: Int) {
        self._name = name
        self._pokedexID = pokedexID
    }
    
}