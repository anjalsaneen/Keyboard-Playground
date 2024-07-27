//
//  ContentView.swift
//  Playground
//
//  Created by Anjal Saneen on 11/07/24.
//

import SwiftUI

struct MainView: View {    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
