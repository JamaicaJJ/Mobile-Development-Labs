//
//  AllPostView.swift
//  TechSocialMediaAppAPI
//
//  Created by David Santiago Jamaica Galvis on 6/23/25.
//

import Foundation
import SwiftUICore
import SwiftUI

struct AllPostsView: View {
    var user: User
    @State var posts: [Post] = []
    var body: some View {
        List(posts) { post in
            VStack(alignment: .leading) {
                Text(post.title).font(.headline)
                Text(post.body).font(.body)
                Text("By: \(post.authorUserName)")
                Text("Likes: \(post.likes)")
                Text(post.createdDate, style: .date)
            }
        }
        .onAppear {
            Task {
                do {
                    posts = try await API(user: user).fetchAllPosts()
                } catch {
                    print("Failed to fetch posts:", error)
                }
            }
        }

    }
}

