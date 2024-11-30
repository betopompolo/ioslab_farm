//
//  PlayerHUDView.swift
//  MackFarm
//
//  Created by Adalberto Nassu Pompolo on 30/11/24.
//

import SwiftUI

struct PlayerHUDView: View {
    var playerName: String
    var milkCount: Int
    var woolCount: Int
    
    private var displayName: String {
        let maxLength = 12
        let overflowSuffix = "..."
        if playerName.count <= maxLength {
            return playerName
        }
        
        return playerName.prefix(maxLength).dropLast(overflowSuffix.count).appending(overflowSuffix)
    }
    
    private let labelPadding = 8.0
    
    var body: some View {
        HStack {
            Text(displayName)
                .font(.title)
            Spacer()
            Label {
                Text(milkCount.description)
            } icon: {
                Text("🥛")
            }
            .padding(labelPadding)
            .background(.regularMaterial)
            .cornerRadius(20)
            
            Label {
                Text(woolCount.description)
            } icon: {
                Text("🧶")
            }
            .padding(labelPadding)
            .background(.regularMaterial)
            .cornerRadius(20)
        }
        .font(.caption)
    }
}
