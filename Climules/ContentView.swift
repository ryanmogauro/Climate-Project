//
//  ContentView.swift
//  Climules
//
//  Created by Aidan Kwok on 11/29/24.
//

import SwiftUI

struct ContentView: View {
    @State var forumPage = true
    var body: some View {
        if forumPage{
            ForumView(forumPage: $forumPage)
        }
        else{
            CreatePostView(forumPage: $forumPage)
        }
    }
}

#Preview {
    ContentView()
}
