//
//  ContentView.swift
//  ItemInList
//
//  Created by TheGIZzz on 16/6/2565 BE.
//

import SwiftUI

//struct Friend {
//    let name: String
//}

struct ContentView: View {
    
    var body: some View {
        List(1...20, id: \.self) { index in
            Text("\(index)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
