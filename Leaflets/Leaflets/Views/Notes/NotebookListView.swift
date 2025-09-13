//
//  NotebookListView.swift
//  Leaflets
//
//  Created by Maddy Foley on 9/13/25.
//
import SwiftUI
import SwiftData

struct NotebookListView: View {
    @State private var selectedDate: DateComponents?
    @State private var isLoading = true
    
    
    var body: some View{
        
    }
}

#Preview {
    NotebookListView()
        .modelContainer(for: NoteData.self)
}
