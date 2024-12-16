//
//  FlickFeedApp.swift
//  FlickFeed
//
//  Created by Citlalli Jaramar Lopez Medina on 16/12/24.
//

import SwiftUI

@main
struct FlickFeedApp: App {
    var body: some Scene {
        WindowGroup {
            TabView{
                Tab ("Home", systemImage: "house.fill"){
                    HomeView()
                }
                
                Tab ("Search", systemImage:"magnifyingglass"){
                    SearchView()
                }
                
                Tab ("Activity", systemImage:"bolt.fill"){
                    ActivityLibraryView()                }
                
                Tab ("Profile", systemImage: "person.crop.circle.fill"){
                    ProfileView2()                }
            }        }
    }
}
