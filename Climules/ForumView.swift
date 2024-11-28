//
//  ForumView.swift
//  Climules
//
//  Created by Aidan Kwok on 11/5/24.
//

import SwiftUI

struct ForumView: View {
    @State private var post: String = ""
    var containerWidth: CGFloat = UIScreen.main.bounds.width - 32.0
    var containerHeight: CGFloat = UIScreen.main.bounds.height
    var body: some View {
        VStack{
            HStack(spacing: 100){
                Image("Climule")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding(.leading, 10)
                HStack(spacing: 20){
                    Image(systemName: "newspaper")
                        .symbolRenderingMode(.hierarchical)
                    Image(systemName: "plus")
                        .symbolRenderingMode(.hierarchical)
                    Image(systemName: "magnifyingglass")
                        .symbolRenderingMode(.hierarchical)
                }
                .padding(.trailing, 10)
                .foregroundColor(Color.blue.opacity(0.8))
                
            }
            VStack(alignment: .leading){
                Text("Post Title")
                Text("Post Description")
                    
            }
            .frame(maxWidth: containerWidth * 0.8, maxHeight: .infinity,  alignment: .top)
            .background(RoundedRectangle(cornerRadius:4).fill( Color.green.opacity(0.2)))
            .padding(20)
            
            
//            .border(Color.gray, width: 2, cornerRadius:2)
//
            
                    
                
//            TextField("Add Post", text: $post)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity,  alignment: .top)
        .background {
            Color.gray.opacity(0.2)
                .ignoresSafeArea()
        }
        
    }
}

#Preview {
    ForumView()
}
