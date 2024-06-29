//
//  ContentView.swift
//  SnowSeeker
//
//  Created by surya sai on 24/06/24.
//

import SwiftUI

struct ContentView: View {
    let resorts:[Resort] = Bundle.main.decode("resorts.json")
    @State var searchText = ""
    @State private var favorites = Favorites()
    let sort = ["Name","Country"]
    @State var name = ""
    
    var filteredResorts:[Resort] {
        if searchText.isEmpty {
            resorts
        }
        else {
            resorts.filter{$0.name.localizedStandardContains(searchText)}
            
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List(filteredResorts) { resort in
                NavigationLink(value: resort) {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(
                                .rect(cornerRadius: 5)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            )

                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundStyle(.secondary)
                        }
                        if favorites.contains(resort) {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .foregroundStyle(.red)
                        }
                    }
                }
                
            }
            .toolbar {
               
            }
            .navigationTitle("Resorts")
            .navigationDestination(for: Resort.self){ resort in
                ResortView(resort: resort)
                
            }
           
            .searchable(text: $searchText,prompt: "Search for a resort")
           
        } detail: {
            WelcomeView() 
        }
        .environment(favorites)
        
    }
}

#Preview {
    ContentView()
}
