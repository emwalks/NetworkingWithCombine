//
//  ContentView.swift
//  NetworkingWithCombine
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 02/09/2023.
//

import SwiftUI

struct ContentView: View {
    
    var viewModel = UserViewModel(dataService: RemoteUserDataService())
    
    var body: some View {
        Button("Refetch Data") {
            self.viewModel.dataService.fetch()
        }
        List(viewModel.users) { user in
            Text(user.name)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


