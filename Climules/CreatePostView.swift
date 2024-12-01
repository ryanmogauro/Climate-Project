//
//  CreatePostView.swift
//  Climules
//
//  Created by Aidan Kwok on 11/27/24.
//

import SwiftUI
import OHMySQL
import UIKit

struct CreatePostView: View {
    enum FocusedField {
            case titleInput, contentInput
        }
    @Binding var forumPage: Bool
    @State private var titleInput: String = ""
    @State private var contentInput: String = ""
    @FocusState private var focusedField: FocusedField?
    let date = Date()
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
                .font(.system(size: 25))
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
                .foregroundColor(.white)
                .padding(10)
                .background(Color("Primary"))
                .lineLimit(3, reservesSpace:true)
                .cornerRadius(8)
                .focused($focusedField, equals: .titleInput)
                

                TextField(
                    "",
                    text: $contentInput,
                    prompt: Text("Content").foregroundColor(.white),
                    axis: .vertical
                )
                .foregroundColor(.white)
                .padding(10)
                .background(Color("Primary"))
                .lineLimit(20, reservesSpace:true)
                .cornerRadius(8)
                .focused($focusedField, equals: .contentInput)
                Button(action: {
                    submitPost(title: titleInput, content: contentInput)
                    forumPage = true
                }) {
                    Text("Upload")
              // Adds padding inside the button around the text
                        .padding(.horizontal, 40)
                        .padding(.vertical, 20)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(8)// Adds padding around the entire button
                }

            }
            .onAppear {
                            focusedField = .titleInput
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
        //No need for postID since it will autoincrement
        let today = Date.now
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//        print(formatter.string(from: today))
        let queryString = "INSERT INTO posts (userID, title, content, created_at) VALUES (1, '\(title)', '\(content)', '\(formatter.string(from: today))')"
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
    CreatePostView(forumPage: .constant(false))
}
