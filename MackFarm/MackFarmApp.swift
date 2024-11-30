//
//  MackFarmApp.swift
//  MackFarm
//
//  Created by Adalberto Nassu Pompolo on 30/11/24.
//

import SwiftUI

@main
struct MackFarmApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                player: MyPlayer(
                    name: "Beto",
                    inventory: MyPlayerInventory(),
                    barn: (0..<100).map{ i in
                        if i.isMultiple(of: 2) {
                            return MyCow(name: "Cow \(i)")
                        }
                        
                        if i.isMultiple(of: 3) {
                            return MySheep(name: "Sheep \(i)")
                        }
                        
                        return MyHorse(name: "Horse \(i)")
                    }.shuffled()
                )
            )
        }
    }
}
