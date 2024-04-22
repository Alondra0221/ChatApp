//
//  UsernameView.swift
//  ChatApp
//
//  Created by Alondra García Morales on 22/04/24.
//

import SwiftUI

struct UsernameView: View {
    
    @EnvironmentObject var login : MessagesViewModel
    @State private var name = ""
    
    var body: some View {
        ZStack{
            Color.white.ignoresSafeArea(.all)
            VStack{
                Spacer()
                Image("logo")
                    .resizable()
                    .frame(width: 250, height: 250)
                Text("Hi!")
                    .foregroundStyle(.blue)
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 30)
                Text("Welcome Back!")
                    .foregroundStyle(.blue)
                    .font(.largeTitle)
                    .bold()
                
                TextField("Username", text: $name)
                    .textFieldStyle(.roundedBorder)
                Button{
                    UserDefaults.standard.setValue(name, forKey: "username")
                    UserDefaults.standard.setValue(UUID().uuidString, forKey: "idUser")
                    login.showChatApp = true 
                } label :{
                    Text("Enter")
                        .padding(.horizontal, 40)
                        .padding(.vertical, 10)
                        .foregroundStyle(.white)
                        .background(.blue)
                        .cornerRadius(80)
                        .font(.title2)
                        
                }
                .padding()
                
                Spacer()
            }.padding(.all)
        }
    }
}

