//
//  MyModels.swift
//  MackFarm
//
//  Created by Adalberto Nassu Pompolo on 30/11/24.
//

import Foundation

class MyCow: Animal {
    let id = UUID()
    let name: String
    let emoji = "🐮"
    
    init(name: String) {
        self.name = name
    }
    
    func gatherResource(addTo inventory: inout any PlayerInventory) {
        inventory.milk += 1
    }
    
    func sayHi() -> String {
        return "A cow named \(name) says hi!"
    }
}

class MySheep: Animal {
    let id = UUID()
    let name: String
    let emoji = "🐑"
    
    init(name: String) {
        self.name = name
    }
    
    func gatherResource(addTo inventory: inout any PlayerInventory) {
        inventory.wool += 1
    }
    
    func sayHi() -> String {
        return "Meeeeeeee. I mean, hi!"
    }
}

class MyHorse: Animal {
    let id = UUID()
    let name: String
    let emoji = "🐴"
    
    init(name: String) {
        self.name = name
    }
    
    func gatherResource(addTo inventory: inout any PlayerInventory) {
        
    }
    
    func sayHi() -> String {
        "... I'm \(name)"
    }
}

class MyPlayer: Player {
    let name: String
    var inventory: PlayerInventory
    var barn: [Animal]
    
    init(name: String, inventory: PlayerInventory, barn: [Animal]) {
        self.name = name
        self.inventory = inventory
        self.barn = barn
    }
}

struct MyPlayerInventory: PlayerInventory {
    var milk: Int = 0 {
        didSet {
            guard milk >= 0 else {
                milk = 0
                return
            }
        }
    }
    
    var wool: Int = 0 {
        didSet {
            guard wool >= 0 else {
                wool = 0
                return
            }
        }
    }
}
