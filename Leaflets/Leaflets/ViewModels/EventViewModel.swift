//
//  EventViewModel.swift
//  Leaflets
//
//  Created by Maddy Foley on 9/8/25.
//
import SwiftUI
import SwiftData

@Observable
class EventsModelView: Identifiable {
    var events: [Event] = []
    var selected: Date?
    
    init(){
    }
}
