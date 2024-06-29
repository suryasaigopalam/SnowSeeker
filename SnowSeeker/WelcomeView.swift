//
//  WelcomeView.swift
//  SnowSeeker
//
//  Created by surya sai on 26/06/24.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to SnowSeeker")
                .font(.largeTitle)
            
            Text("Please select a resort from the left-hand menu. Swipe from the edge to show it.")
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    WelcomeView()
}
