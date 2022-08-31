//
//  ContentView.swift
//  Testing
//
//  Created by Kiran Poudel on 7/4/22.
//

import SwiftUI

/// User Model
struct User {
    var name: String
    var role: String
    var image: String
    var isOnline: Bool
    var id: String
    
    init(name: String, role: String, image: String, isOnline: Bool) {
        self.name = name
        self.role = role
        self.image = image
        self.isOnline = isOnline
        self.id = UUID().uuidString
    }
}

struct ContentView: View {
    
    /// State property wrapper to store array of users
    @State var users = [User]()
    
    var body: some View {
        NavigationView {
            // List view
            List(users, id: \.id) { user in
                UserCell(user: user)
            }.onAppear{
                // Add test user
                addUsers()
            }.navigationTitle("Users")
        }
    }
    
    /// function that stores users in the array. Since users is State property, it automatically updates the list
    func addUsers() {
        self.users = [
            User(name: "Kiran Poudel", role: "Software Engineer Level III", image: "https://www.fakepersongenerator.com/Face/male/male1084875107758.jpg", isOnline: true),
            User(name: "Prasiddha Shrestha", role: "Software Engineer Level I", image: "https://www.fakepersongenerator.com/Face/male/male20161086546113160.jpg", isOnline: false),
            User(name: "Raman Adhikari", role: "Software Engineer II", image: "https://www.fakepersongenerator.com/Face/male/male1085862563904.jpg", isOnline: true),
            User(name: "Kamana Acharya", role: "Team Lead", image: "https://www.fakepersongenerator.com/Face/female/female1022703383515.jpg", isOnline: false)
        ]
    }
}

struct UserCell: View {
    let user: User
    var body: some View {
        HStack(spacing: 10) {
            
            AsyncImage(url: URL(string: user.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(30)
                    .overlay(
                        Circle()
                            .fill(user.isOnline ? Color("Online") : Color("Offline"))
                            .frame(width: 15, height: 15)
                        , alignment: .bottomTrailing
                    )
                
            } placeholder: {
                ProgressView()
            }
            .frame(width: 60, height: 60)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(user.name).font(.title2)
                Text(user.role).foregroundColor(.secondary).fontWeight(.semibold)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

