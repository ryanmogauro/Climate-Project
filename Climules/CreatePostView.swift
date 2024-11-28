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
            HStack{
                Image("Climule")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(.leading, 20)
                Spacer()
                HStack(spacing: 20){
                    Image(systemName: "pencil")
                        .symbolRenderingMode(.hierarchical)
                    Image(systemName: "magnifyingglass")
                        .symbolRenderingMode(.hierarchical)
                    Image(systemName: "person.crop.circle")
                        .symbolRenderingMode(.hierarchical)
                }
                .padding(.trailing, 20)
            }
            Divider()
                .frame(height:2)
                .overlay(.black)
            VStack{
                Text("Create Post")
                TextField(
                    "",
                    text: $title,
                    prompt: Text("Title").foregroundColor(.white),
                    axis: .vertical
                )
                .padding(10)
                .background(Color.accentColor)
                .lineLimit(3, reservesSpace:true)
                .cornerRadius(8)

                TextField(
                    "",
                    text: $content,
                    prompt: Text("Content").foregroundColor(.white),
                    axis: .vertical
                )
                .padding(10)
                .background(Color.accentColor)
                .lineLimit(20, reservesSpace:true)
                .cornerRadius(8)
            }
            .padding(20)
            
            //Takes up as much space as possible pushing content to top of page
            Spacer()
            
        }
        .background(Color("Secondary"))
    }
}

#Preview {
    CreatePostView()
}
