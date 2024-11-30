//
//  BarnView.swift
//  MackFarm
//
//  Created by Adalberto Nassu Pompolo on 30/11/24.
//

import SwiftUI

struct BarnView: View {
    let barn: [Animal]
    let onSayHi: (Animal) -> Void
    let onGatherResources: (Animal) -> Void
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4), spacing: 15) {
                ForEach(barn, id: \.id) { animal in
                    VStack {
                        Text(animal.emoji)
                            .font(.title)
                        Text(animal.name)
                            .font(.caption)
                            .fontWeight(.semibold)
                    }
                    .contextMenu {
                        Button("Say hi") {
                            onSayHi(animal)
                        }
                        
                        Button("Gather resources") {
                            onGatherResources(animal)
                        }
                    }
                }
            }
        }
        .overlay {
            if barn.isEmpty {
                Text("No animals on your barn yet 👨‍🌾")
            }
        }
    }
}

#Preview {
    BarnView(
        barn: [
            MyCow(name: "Sally"),
            MyHorse(name: "Bullseye"),
            MyCow(name: "Mia"),
            MyHorse(name: "Jairo")
        ]) { _ in
            print("say hi")
        } onGatherResources: { _ in
            print("gather resources")
        }
}
