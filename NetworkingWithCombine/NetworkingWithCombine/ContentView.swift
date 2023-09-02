//
//  ContentView.swift
//  NetworkingWithCombine
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 02/09/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("Fetch Data") {
            let url = URL(string: "https://www.hackingwithswift.com/samples/user-24601.json")!
            self.fetch(url)
        }

    }
    
    func fetch(_ url: URL) {
        URLSession.shared.dataTask(with: url ) { data, response, error in
            if let error = error {
                print(" hit error block\(User.default.name)")
            } else if let data = data {
                let decoder = JSONDecoder()
                
                do {
                    let user = try decoder.decode(User.self, from: data)
                    print("fetched remote data for: \(user.name)")
                } catch {
                    print(" hit catch block\(User.default.name)")
                }
            }
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/*
 Raw JSON data
 
 {
     "id": "6DC8EF4D-D627-4D83-9A0D-F8157099CB43",
     "name": "Paul Hudson",
     "age": 40
 }
 
 */

struct User: Decodable {
    var id: UUID
    var name: String
    
    static let `default` = User(id: UUID(), name: "Anon")
}
