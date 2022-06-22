//
//  ContentView.swift
//  MVVM
//
//  Created by TheGIZzz on 22/6/2565 BE.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var postListViewModel = PostListViewModel()
    
    var body: some View {
        List(postListViewModel.posts, id: \.id) { post in
            VStack(alignment: .leading, spacing: 10) {
                Text(post.title)
                    .font(.headline)
                Text(post.body)
            }
        }.onAppear(perform: {
            postListViewModel.populatePosts()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
