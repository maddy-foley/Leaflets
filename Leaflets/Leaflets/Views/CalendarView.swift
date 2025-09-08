//
//  CalendarView.swift
//  Leaflets
//
//  Created by Maddy Foley on 9/8/25.
//

import SwiftUI
import SwiftData


struct CalendarView: View {
    var calendar = Calendar(identifier: .gregorian)
    @State var myDate = Date()
    @State private var dates: Set<DateComponents> = []

    var body: some View {
        VStack{
            MultiDatePicker("Dates Available", selection: $dates)
                
                
        }
    }
}


#Preview {
    CalendarView()
}
