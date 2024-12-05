//
//  TabbarView.swift
//  News-App
//
//  Created by Jack Delamou on 05/12/2024.
//

import SwiftUI

struct TabbarView: View {
    var body: some View {
           TabView {
               ArticleScreenView()
                   .tabItem {
                       Label("My Articles", systemImage: "list.bullet.rectangle")
                   }
               SearchScreenView()
                   .tabItem {
                       Label("Search", systemImage: "magnifyingglass")
                   }
               SettingScreenView(model: APIParameterStore())
                   .tabItem {
                       Label("Settings", systemImage: "gearshape")
                   }
           }
       }
}

#Preview {
    TabbarView()
}
