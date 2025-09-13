//
//  EventModel.swift
//  Leaflets
//
//  Created by Maddy Foley on 9/8/25.
//
import Foundation
import SwiftData
import SwiftUI

@Model
class EventData: Identifiable, Hashable {
    @Attribute(.unique) var id: UUID
    var name: String
    var systemImageName: String
    var date: Date
    var notes: String?
    
    
    init(_ name: String, date: Date, systemImageName: String = "circle"){
        self.id = UUID()
        self.name = name
        self.date = date
        self.systemImageName = systemImageName

    }
    
    init(_ name: String, date: Date, systemImageName: String = "circle", notes: String?){
        self.id = UUID()
        self.name = name
        self.date = date
        self.systemImageName = systemImageName
        self.notes = notes
    }
}
