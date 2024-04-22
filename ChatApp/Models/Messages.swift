//
//  Messages.swift
//  ChatApp
//
//  Created by Alondra García Morales on 22/04/24.
//

import Foundation

struct Messages: Identifiable, Codable {
    var id : String
    var text : String
    var username : String
    var idUser : String
    var timestamp : Date 
}
