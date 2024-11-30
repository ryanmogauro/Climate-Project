//
//  ForumView.swift
//  Climules
//
//  Created by Aidan Kwok on 11/5/24.
//

import SwiftUI
import OHMySQL

struct ForumView: View {
    @State private var posts: [ [String: Any] ] = []
    
    var containerWidth: CGFloat = UIScreen.main.bounds.width - 32.0
    var containerHeight: CGFloat = UIScreen.main.bounds.height
    @Binding var forumPage: Bool
    var body: some View {
        VStack{
            HStack{
                Image("Climule")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(.leading, 20)
                Spacer()
                HStack(spacing: 20){
//                    Button(action: {
//                        forumPage = false
//                        print(forumPage)
//                    }) {
//                        Text("Upload")}
                    Button(action: {
                        forumPage = false
                    }) {
                        Image(systemName: "pencil")
                            .symbolRenderingMode(.hierarchical)
                            .foregroundColor(.black)
                    }
//                    Image(systemName: "pencil")
//                        .symbolRenderingMode(.hierarchical)
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
            ScrollView { // Wrap in ScrollView to allow scrolling
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(posts.indices, id: \.self) { index in
                        let post = posts[index]
                        VStack(alignment: .leading) {
                            Text(post["created_at"] as? String ?? "No Date")
                                .font(.system(size:12))
                            Text("\(post["firstName"] as? String ?? "No First Name") \(post["lastName"] as? String ?? "No Last Name")")
                                .font(.system(size:12))
                            Text(post["title"] as? String ?? "No Title")
                                .multilineTextAlignment(.leading)
                                .font(.system(size:20))
                            Text(post["content"] as? String ?? "No Content")
                        }
                        .frame(maxWidth: containerWidth * 0.8, maxHeight: .infinity,  alignment: .leading)
                        .padding(20)
                        .background(Color.white)
                        .cornerRadius(8)
                    }
                }
                
                Spacer()
                
            }
        }
        .background(Color("Secondary"))
        .onAppear {
            posts = callPosts()
            
        }
        
        
    }
    func callPosts() -> [ [String: Any] ]{
        let coordinator = DatabaseManager.shared.coordinator
        let context = MySQLQueryContext()
        context.storeCoordinator = coordinator
//        let query = MySQLQueryRequestFactory.select("posts", condition:nil)
        let query = MySQLQueryRequestFactory.joinType(Join.inner.rawValue, fromTable:"posts", columnNames:["created_at", "title", "content", "users.firstName", "users.lastName"], joinOn: ["users": "users.id = posts.userID"])
        let response = try? context.executeQueryRequestAndFetchResult(query)
        print(response)
        //        print(type(of: response))
        if response != nil{
            return response!
        }
        else{
            return []
        }
        
    }
}
#Preview {
    ForumView(forumPage: .constant(true))
}
