//
//  ContentView.swift
//  ChatApp
//
//  Created by Alondra García Morales on 22/04/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var login : MessagesViewModel
    var body: some View {
        return Group {
            if login.showChatApp {
                ChatView()
            }else {
                UsernameView()
            }
        }.onAppear{
            if (UserDefaults.standard.object(forKey: "username") != nil){
                login.showChatApp = true 
            }
        }
    }
}

