//
//  ContentView.swift
//  HW4P8M4SUI_Grids
//
//  Created by Baha Sadyr on 11/8/24.
//

import SwiftUI

struct SecondView: View {
    
    @StateObject var vm = ViewModel()
    var column = [GridItem(.flexible(), spacing: 12),
                  GridItem(.flexible(), spacing: 12 )]
    @State var isBookmarked = true
    
    var body: some View {
        VStack {
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
                VStack {
                    Image(._81124Restart)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.bottom, 18)
                .padding(.top, 0)
            }
            
            ScrollView(showsIndicators: false) {
                VStack {
                    LazyVGrid(columns: column, spacing: 10) {
                        ForEach(vm.items, id: \.self) { card in
                            ItemCardView(card: card)
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 14)
        .background(.appColorBackgroundMain)
        
    }
}

#Preview {
    SecondView()
}

