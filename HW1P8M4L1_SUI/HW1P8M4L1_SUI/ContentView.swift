//
//  ContentView.swift
//  HW1P8M4L1_SUI
//
//  Created by Baha Sadyr on 10/30/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .bottomLeading) {
                Image("103024-1")
                    .resizable().aspectRatio(contentMode: .fill)
                    .frame(height: 249).clipped().padding(.horizontal)
                Text("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod")
                    .foregroundColor(.white)
                    .padding(.bottom, 33).padding(.leading, 30).padding(.trailing, 13)
            }
            HStack(spacing: 14) {
                ImageView(imageName: "103024-2")
                ImageView(imageName: "103024-3")
                ImageView(imageName: "103024-4")
            }
            .padding(.top, 17)
            .padding(.leading, 15)
            
            VStack(alignment: .leading) {
                HStack(spacing: 27) {
                    UserNameAgeView(imageName: "personIcon", text: "User Name")
                    UserNameAgeView(imageName: "ageIcon", text: "25")
                }
                .padding(.leading, 15)
                .padding(.top, 43)
            }
            
            VStack(alignment: .leading, spacing: 6) {
                Text("About")
                    .font(.system(size: 13))
                    .foregroundColor(Color.gray)
                Text("Lorem ipsum dolor sit amet, consectetur\nadipisicing elit, sed do eiusmod")
                    .font(.system(size: 16))
            }
            .padding(.top, 26)
            .padding(.leading, 15)
            
            Spacer()
            
            HStack {
                Text("настроить профиль")
                    .font(.system(size: 16))
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        } 
    }
}

#Preview {
    ContentView()
}

struct ImageView: View {
    var imageName: String
    var body: some View {
        Image(imageName)
            .resizable().aspectRatio(contentMode: .fill)
            .frame(width: (UIScreen.main.bounds.width - 60) / 3, height: 114)
            
    }
}

struct UserNameAgeView: View {
    var imageName: String
    var text: String
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 27, height: 27)
            Text(text)
                .font(.system(size: 20)).bold()
        }
    }
}
