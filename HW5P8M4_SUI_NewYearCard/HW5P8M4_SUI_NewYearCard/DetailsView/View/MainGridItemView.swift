//
//  MainGridItemView.swift
//  HW5P8M4_SUI_NewYearCard
//
//  Created by Baha Sadyr on 11/19/24.
//

import SwiftUI

struct MainGridItemView: View {
    
    var tag: String
    
    var body: some View {
            Text(tag)
                .font(.system(size: 16))
                .frame(height: 34)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 22)
                .background(.appColorMainCard)
                .foregroundStyle(.white)
                .clipShape(Capsule())  
    }
}
