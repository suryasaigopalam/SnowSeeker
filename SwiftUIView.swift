//
//  SwiftUIView.swift
//  SnowSeeker
//
//  Created by surya sai on 28/06/24.
//

import SwiftUI

struct SwiftUIView: View {
   @State var name = "Name"
    let names = ["Name","Country"]
    var body: some View {
        Picker("Sort Order",selection: $name){
          Text("Name")
            }
        }
    }


#Preview {
    SwiftUIView()
}
