//
//  CreatePostView.swift
//  Climules
//
//  Created by Aidan Kwok on 11/27/24.
//

import SwiftUI
import OHMySQL

struct CreatePostView: View {
    @State private var titleInput: String = ""
    @State private var contentInput: String = ""

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
                    text: $titleInput,
                    prompt: Text("Title").foregroundColor(.white),
                    axis: .vertical
                )
                .padding(10)
                .background(Color.accentColor)
                .lineLimit(3, reservesSpace:true)
                .cornerRadius(8)

                TextField(
                    "",
                    text: $contentInput,
                    prompt: Text("Content").foregroundColor(.white),
                    axis: .vertical
                )
                .padding(10)
                .background(Color.accentColor)
                .lineLimit(20, reservesSpace:true)
                .cornerRadius(8)
                Button("Submit"){
                    submitPost(title:titleInput, content:contentInput)
                }
            }
            .padding(20)
            
            //Takes up as much space as possible pushing content to top of page
            Spacer()
            
        }
        .background(Color("Secondary"))
    }
    func submitPost(title:String, content:String){
        let coordinator = DatabaseManager.shared.coordinator
        let context = MySQLQueryContext()
        context.storeCoordinator = coordinator
        let queryString = "INSERT INTO posts (postID, userID, title, content, created_at) VALUES (2, 1, '\(title)', '\(content)', '1000-01-01 00:00:00')"
        let request = MySQLQueryRequest(query: queryString)
                
                do {
                    try context.execute(request)
                    let showSuccessAlert = true
                } catch {
                    print("Failed to execute query: \(error)")
                    let showErrorAlert = true
                }
    }
}

#Preview {
    CreatePostView()
}
