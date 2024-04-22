//
//  MessageView.swift
//  ChatApp
//
//  Created by Alondra García Morales on 22/04/24.
//

import SwiftUI

struct MessageView: View {
    var messages : Messages
    @State private var bubble = false
    
    var body: some View {
        VStack(alignment: bubble  ? .trailing : .leading){
            HStack{
                Text(messages.text)
                    .foregroundStyle(bubble ? Color.white : Color.black )
                    .padding()
                    .background(bubble ? Color.blue : Color.gray)
                    .cornerRadius(30)
            }
            .frame(maxWidth: 300, alignment: bubble ? .trailing : .leading)
            
            Text(messages.username)
                .font(.caption)
                .foregroundStyle(.gray)
                .padding(bubble ? .trailing : .leading, 25)
        }
        .frame(maxWidth: .infinity, alignment: bubble ? .trailing : .leading)
        .padding(bubble ? .trailing : .leading)
        .padding(.horizontal, 10)
        .onAppear{
            let idUser = UserDefaults.standard.string(forKey: "idUser")
            //yo estoy neviando el mensaje
            if idUser == messages.idUser {
                bubble = true
            }
        }
    }
}


