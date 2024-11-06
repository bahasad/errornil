//
//  ContentView.swift
//  HW1M4P8_SwiftUI
//
//  Created by Baha Sadyr on 10/29/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack {
            Color(red: 0.22, green: 1.6, blue: 1.33)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("111")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 5))
                VStack {
                    Text("Baha Sadyr")
                        .font(.system(size: 40))
                        .bold()
                    Text("IOS developer")
                        .font(.system(size: 25))
                }
                .foregroundColor(.white)
                Divider()
                InfoView(text: "+44 123 456 789", imageName: "phone.fill")
                InfoView(text: "example@baha.com", imageName: "envelope.fill")
                
                
                
            }
            
            
        }
    }
    
}

//#Preview {
//    ContentView()
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice(PreviewDevice(rawValue: "iPhone XR"))
    }
}



//struct InfoView: View {
//    let text: String
//    let imageName: String
//    var body: some View {
//        RoundedRectangle(cornerRadius: 25)
//            .fill(Color.white)
//            .frame(height: 50.0)
//            .overlay(
//                HStack {
//                    
//                    Image(systemName: imageName)
//                        .foregroundColor(.green)
//                    Text(text).foregroundColor(.black)
//                })
//            .padding(.all)
//    }
//}
