//
//  InfoView.swift
//  HW1M4P8_SwiftUI
//
//  Created by Baha Sadyr on 10/29/24.
//

import SwiftUI

struct InfoView: View {
    let text: String
    let imageName: String
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(height: 50.0)
            .overlay(
                HStack {
                    
                    Image(systemName: imageName)
                        .foregroundColor(.green)
                    Text(text).foregroundColor(.black)
                })
            .padding(.all)
    }
}
