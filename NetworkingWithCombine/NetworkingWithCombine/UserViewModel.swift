//
//  UserViewModel.swift
//  NetworkingWithCombine
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 02/09/2023.
//

import Foundation

class UserViewModel: ObservableObject  {
    
    let dataService: UserDataService
    @Published var users: [User]
    
    init(dataService: UserDataService) {
        self.dataService = dataService
        dataService.fetch()
        self.users = dataService.userData
    }
    
}

protocol UserDataService {
    var userData: [User] { get set }
    
    func fetch()
}

class RemoteUserDataService: UserDataService, ObservableObject {
    var userData: [User] = []
    
    let url = URL(string: "https://www.hackingwithswift.com/samples/user-24601.json")!
    
    func fetch() {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(" hit error block\(User.default.name)")
            } else if let data = data {
                let decoder = JSONDecoder()
                
                do {
                    let user = try decoder.decode(User.self, from: data)
                    print("fetched remote data for: \(user.name)")
                    self.userData = [user]
                } catch {
                    print(" hit catch block\(User.default.name)")
                }
            }
        }.resume()
    }
}



