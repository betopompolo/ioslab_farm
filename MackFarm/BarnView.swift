//
//  BarnView.swift
//  MackFarm
//
//  Created by Adalberto Nassu Pompolo on 30/11/24.
//

import SwiftUI

@Observable
class BarnAlert {
    var message: String {
        didSet {
            isPresented = !message.isEmpty
        }
    }
    var isPresented = false
    
    init(message: String = "") {
        self.message = message
    }
}

struct BarnView: View {
    private let secondsToDisplayHiMessage = 4.0
    @Binding var player: Player
    @State var alert = BarnAlert()
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4), spacing: 15) {
                ForEach(player.barn, id: \.id) { animal in
                    VStack {
                        Text(animal.emoji)
                            .font(.title)
                        Text(animal.name)
                            .font(.caption)
                            .fontWeight(.semibold)
                    }
                    .padding()
                    .contextMenu {
                        Button("Say hi") {
                            alert.message = animal.sayHi()
                        }
                        
                        Button("Gather resources") {
                            animal.gatherResource(addTo: &player.inventory)
                        }
                    }
                }
            }
        }
        .alert(alert.message, isPresented: $alert.isPresented) {
            Button("Nice!", role: .cancel) {
                alert.message = ""
            }
        }
        .overlay {
            if player.barn.isEmpty {
                Text("No animals on your barn yet 👨‍🌾")
            }
        }
    }
}
