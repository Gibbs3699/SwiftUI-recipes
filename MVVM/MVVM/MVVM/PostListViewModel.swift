//
//  PostListViewModel.swift
//  MVVM
//
//  Created by TheGIZzz on 22/6/2565 BE.
//

import Foundation

class PostListViewModel: ObservableObject {
    
    @Published var posts: [PostViewModel] = [PostViewModel]()
    
    func populatePosts() {
        
        Webservice().fetchPosts { (results) in
            switch results {
                case .success(let posts):
                    DispatchQueue.main.async {
                        self.posts = posts.map(PostViewModel.init)
                    }
                    print(posts)
                case .failure(let error):
                    print(error)
            }
        }
    }
}

struct PostViewModel {
    let post: Post
    
    var id: Int {
        post.id
    }
    
    var title: String {
        post.title
    }
    
    var body: String {
        post.body
    }
}
