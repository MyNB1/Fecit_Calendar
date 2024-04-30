//
//  TabBar.swift
//  fecitCalendar
//
//  Created by 둘리 on 4/15/24.
//

import SwiftUI

struct MainContentView: View {
    @State private var selection = 2
    
    init() {
        UINavigationBar.appearance().backgroundColor = .systemBlue
        let navBarAppearance = UINavigationBarAppearance()
        
        navBarAppearance.backgroundColor = UIColor.systemBlue
        navBarAppearance.shadowColor = .clear
        
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().standardAppearance = navBarAppearance
    }
    
    var body: some View {
        TabView(selection : $selection) {
            NavigationView {
                Text("Achieves Tab")
            }
            .tabItem {
                Image(systemName: "sparkle")
                Text("Achieves")
            }
            .tag(1)
            
            NavigationView {
                VStack {
                    VStack {
                        HStack {
                            Text("TODAY")
                                .fontWeight(.bold)
                                .padding(.leading, 10)
                            Spacer()
                            Text("March 2023")
                                .fontWeight(.bold)
                                .padding(.leading, 35)
                            Spacer()
                            Image(systemName: "calendar")
                                .fontWeight(.semibold)
                            Spacer(minLength: 10)
                            Image(systemName: "line.3.horizontal")
                                .fontWeight(.heavy)
                                .padding(.trailing, 10)
                        }

                            let days : [String] = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT",]
                            
                            HStack(spacing: 0) {
                                ForEach(days, id: \.self) { day in     
                                    Text(day)
                                        .padding(.top, 10)
                                        .padding(.bottom, 10)
                                        .font(.footnote)
                                        .fontWeight(.semibold)
                                        .frame(width: UIScreen.main.bounds.width / CGFloat(days.count), height: 20)
                                }
                            }
                        }
                    .background(Color.blue)
                    .foregroundColor(.white)
                    CalendarView()
                }
            }
            .tabItem {
                Image(systemName: "calendar")
                Text("Action")
            }
            .tag(2)
            
            NavigationView {
                Text("Memo Tab")
            }
            .tabItem {
                Image(systemName: "folder")
                Text("Memo")
            }
            .tag(3)
            
            NavigationView {
                Text("Library Tab")
            }
            .tabItem {
                Image(systemName: "tray")
                Text("Library")
            }
            .tag(4)
            
            NavigationView {
                Text("Society Tab")
            }
            .padding()
            .badge(7)
            .tabItem {
                Image(systemName: "square.grid.2x2.fill")
                Text("Society")
            }
            .tag(5)
        }
        .font(.headline)
        .onAppear(){
            UITabBar.appearance().backgroundColor = .systemGray5
            UITabBar.appearance().scrollEdgeAppearance = .init()
        }
    }
}

#Preview {
    MainContentView()
}
