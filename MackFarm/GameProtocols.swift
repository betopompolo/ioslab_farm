//
//  Models.swift
//  MackFarm
//
//  Created by Adalberto Nassu Pompolo on 30/11/24.
//

import Foundation

protocol Animal {
    var id: UUID { get }
    var name: String { get }
    var emoji: String { get }
    func gatherResource(addTo inventory: inout PlayerInventory) -> Void
    func sayHi() -> String
}

protocol Player {
    var name: String { get }
    var inventory: PlayerInventory { get set }
    var barn: [any Animal] { get set }
}

protocol PlayerInventory {
    var milk: Int { get set }
    var wool: Int { get set }
}
