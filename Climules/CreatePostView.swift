//
//  CreatePostView.swift
//  Climules
//
//  Created by Aidan Kwok on 11/27/24.
//

import SwiftUI

struct CreatePostView: View {
    @State private var title: String = ""
    @State private var content: String = ""
    var body: some View {
        VStack{
            HStack(spacing: 100){
                Image("Climule")
                    .resizable()
                    .frame(width: 100, height: 100)
                HStack(spacing: 20){
                    Image(systemName: "pencil")
                        .symbolRenderingMode(.hierarchical)
                    Image(systemName: "magnifyingglass")
                        .symbolRenderingMode(.hierarchical)
                    Image(systemName: "person.crop.circle")
                        .symbolRenderingMode(.hierarchical)
                }
            }
            Divider()
                .frame(height:2)
                .overlay(.gray)
            Text("Create Post")
            TextField(
                "Title",
                text: $title,
                axis: .vertical
            )
            .padding(10)
            .background(Color.accentColor)
            .lineLimit(3, reservesSpace:true)

            TextField(
                "Content",
                text: $content,
                axis: .vertical
            )
            .background(Color.accentColor)
            .lineLimit(20, reservesSpace:true)
            //Takes up as much space as possible pushing content to top of page
            Spacer()
            
        }
        .background(Color("Secondary"))
    }
}

#Preview {
    CreatePostView()
}
