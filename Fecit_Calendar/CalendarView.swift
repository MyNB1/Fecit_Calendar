//
//  MiddleView.swift
//  fecitCalendar
//
//  Created by 둘리 on 4/18/24.
//

import SwiftUI

struct CalendarView: View {
    
    let data = Array(1...42)
    
    @State private var isHovered = false
    @State private var selectedCell: Int? = nil
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem](repeating: .init(.flexible(), spacing: 0), count: 7), spacing: 0) {
                ForEach(data, id: \.self) { item in
                        Button(action: {
                            selectedCell = item
                        }) {
                            VStack {
                                Spacer()
                                Text("\(item)")
                                Spacer()
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(selectedCell == item ? Color.gray.opacity(0.1) : Color.clear)
                            .border(Color.white, width: 0.2)
                        }
                        .aspectRatio(0.5, contentMode: .fit)
                    .buttonStyle(PlainButtonStyle())
                    .onHover { hovering in
                        isHovered = hovering
                    }
                }
                .padding(.vertical, 0)
            }
        }
    }
}

#Preview {
    CalendarView()
}
