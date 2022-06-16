//
//  ContentView.swift
//  DisplayAlternateRowStyles
//
//  Created by TheGIZzz on 16/6/2565 BE.
//

import SwiftUI

struct ContentView: View {
    
    let emoji = ["😀", "😍", "😘", "🥰", "😙", "😖", "😤", "😭"]
    
    var body: some View {
        List(emoji.indices, id: \.self) { index in
            let emoji = emoji[index]
            HStack {
                Text(emoji)
                    .font(.largeTitle)
                Spacer()
            }.background(index % 2 == 0 ? Color.white : Color.gray)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
