//
//  ContentView.swift
//  MackFarm
//
//  Created by Adalberto Nassu Pompolo on 30/11/24.
//

import SwiftUI

@Observable
class GameState {
    var player: Player
    
    init(player: Player) {
        self.player = player
    }
}

struct ContentView: View {
    @State private var gameState: GameState
    
    init(player: Player) {
        self.gameState = GameState(player: player)
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.green.ignoresSafeArea()
                
                VStack {
                    PlayerHUDView(
                        playerName: gameState.player.name,
                        milkCount: gameState.player.inventory.milk,
                        woolCount: gameState.player.inventory.wool
                    )
                        .padding(.horizontal, 5)

                    BarnView(player: $gameState.player)
                }
            }
        }
    }
}

#Preview {
    ContentView(
        player: MyPlayer(
            name: "Player name",
            inventory: MyPlayerInventory(milk: 10, wool: 20),
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
