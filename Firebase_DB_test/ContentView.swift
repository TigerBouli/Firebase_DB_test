//
//  ContentView.swift
//  Firebase_DB_test
//
//  Created by Wojciech Zakroczymski on 13/11/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model = ViewModel()
    
    var body: some View {
        if model.dni.isEmpty {
            ProgressView()
        } else {
            List(model.dni) { dzien in
                HStack {
                    Text(dzien.dzien)
                    Text(dzien.lekcja1)
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
