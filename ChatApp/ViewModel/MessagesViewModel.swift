//
//  MessagesViewModel.swift
//  ChatApp
//
//  Created by Alondra García Morales on 22/04/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class MessagesViewModel : ObservableObject {
    // esta variable nos va a ayudar a entrar al chat 
    @Published var showChatApp = false
    
    @Published var messages : [Messages] = []
    
    @Published var lastId = ""
    
    let db = Firestore.firestore()
    init(){
        getMessages()
    }
    
    func getMessages(){
        db.collection("messages").addSnapshotListener{ QuerySnapshot, error in
            guard let documents = QuerySnapshot?.documents else { return }
            
            ///FirebaseFirestoreSwift
            self.messages = documents.compactMap({ document -> Messages? in
                do{
                    return try document.data(as: Messages.self)
                }catch{
                    print("No funciona el get", error.localizedDescription)
                    return nil
                }
            })
            
            self.messages.sort{ $0.timestamp < $1.timestamp}
            if let id = self.messages.last?.id{
                self.lastId = id
            }
        }
    }
    
    func sendMessage(text: String ){
        do{
            guard let idUser = UserDefaults.standard.string(forKey: "idUser") else { return }
            
            guard let username = UserDefaults.standard.string(forKey: "username") else { return }
            
            let newMessage = Messages(id: "\(UUID())", text: text , username: username, idUser: idUser, timestamp: Date())
            
            try db.collection("messages").document().setData(from: newMessage)
        } catch let error as NSError {
            print("Error al guardar", error.localizedDescription)
        }
    }
}
