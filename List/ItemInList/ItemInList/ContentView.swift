//
//  ContentView.swift
//  ItemInList
//
//  Created by TheGIZzz on 16/6/2565 BE.
//

import SwiftUI

struct Friend: Identifiable {
    let id = UUID()
    let name: String
}

struct ContentView: View {
    
    let friend = [Friend(name: "Jone"), Friend(name: "Mary"), Friend(name: "Steven")]
    
    
    var body: some View {
        List(friend.indices) { index in
            let friend = friend[index]
            HStack {
                Text("\(index+1)")
                Text(friend.name)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
