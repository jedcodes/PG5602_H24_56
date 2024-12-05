//
//  SplashScreenView.swift
//  News-App
//
//  Created by Jack Delamou on 05/12/2024.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack {
            Color(Theme.PrimaryBG)
                .ignoresSafeArea()
            
            Image("news")
                .resizable()
                .aspectRatio(contentMode: .fit)
               
        }
    }
}

#Preview {
    SplashScreenView()
}
