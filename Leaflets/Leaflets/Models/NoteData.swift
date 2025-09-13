//
//  NoteData.swift
//  Leaflets
//
//  Created by Maddy Foley on 9/13/25.
//

import SwiftData
import SwiftUI


@Model
class NoteBookData: Identifiable, Hashable {
    @Attribute(.unique) var id: UUID
    var name: String
    var systemImageName: String = "notebook"
    var details: String?
    @Relationship(deleteRule: .cascade)
    var notes: [Note] = []
    
    
    init(name: String, systemImageName: String = "circle"){
        self.id = UUID()
        self.name = name
        self.systemImageName = systemImageName
    }
    
    init(name: String, systemImageName: String = "circle", details: String){
        self.id = UUID()
        self.name = name
        self.systemImageName = systemImageName
        self.details = details
    }
}

//FIX may change as wordprocessing features are built
@Model
class Note: Identifiable, Hashable {
    @Attribute(.unique) var id: UUID
    var name: String
    var content: String
    var systemImageName: String = "notebook"
    var details: String?
    
    
    init(name: String, content: String, systemImageName: String){
        self.id = UUID()
        self.name = name
        self.content = content
        self.systemImageName = systemImageName
    }
    
    init(name: String, content: String, systemImageName: String, details: String){
        self.id = UUID()
        self.name = name
        self.content = content
        self.systemImageName = systemImageName
        self.details = details
    }
}


