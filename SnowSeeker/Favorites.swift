//
//  Favorites.swift
//  SnowSeeker
//
//  Created by surya sai on 27/06/24.
//

import SwiftUI

@Observable
class Favorites {
    // the actual resorts the user has favorited
    private var resorts: Set<String>

    // the key we're using to read/write in UserDefaults
    private let key = "Favorites"

    init() {
        // load our saved data

        // still here? Use an empty array
        if  let data = UserDefaults.standard.data(forKey: "Favorites")  {
            let array:[String] = try! JSONDecoder().decode([String].self, from: data)
            resorts = Set<String>(array)
        }
        else {
            resorts = []
        }
    }

    // returns true if our set contains this resort
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }

    // adds the resort to our set and saves the change
    func add(_ resort: Resort) {
        resorts.insert(resort.id)
        save()
    }

    // removes the resort from our set and saves the change
    func remove(_ resort: Resort) {
        resorts.remove(resort.id)
        save()
    }

    func save() {
        let data = try! JSONEncoder().encode(resorts)
        UserDefaults.standard.setValue(data, forKey: "Favorites")
    }
}
