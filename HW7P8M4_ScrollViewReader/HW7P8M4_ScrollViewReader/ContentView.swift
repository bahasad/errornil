//
//  ContentView.swift
//  HW7P8M4_ScrollViewReader
//
//  Created by Baha Sadyr on 11/29/24.
//

import SwiftUI

class ViewModel: ObservableObject {
    
    @Published var items: [String] = [
        "Восточная", "Западная", "Sevерная","Азиатская","Африканская","Американская","Европейская","Avsтралийская",  "Avsтралийская",  "Африканская",
    ]
    @Published var searchText: String = "" {
        willSet {
            if newValue.count < 2 {
                items = defaultItems
            } else {
                var results = [String]()
                items.forEach {
                    if $0.lowercased().contains(newValue.lowercased()) {
                        results.append($0)
                    }
                }
                items = results
            }
        }
    }
    @Published var defaultItems: [String] = []
    
    init(){
        defaultItems = items
    }
    
    
}

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                VStack(alignment: .leading) {
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 10) {
                            Button {
                                withAnimation(.spring(response: 0.9, dampingFraction: 0.8, blendDuration: 0.3)) {
                                    proxy.scrollTo("Африканская", anchor: .top)
                                }
                                
                            } label: {
                                Text("Африканская")
                                    .butttonStyle()
                            }
                            Button {
                                withAnimation {
                                    proxy.scrollTo("Западная", anchor: .top)
                                }
                            } label: {
                                getText(text: "Западная")
                                    .frame(alignment: .leading)
                            }
                            Button {
                                withAnimation {
                                    proxy.scrollTo("Азиатская", anchor: .top)
                                }
                                
                            } label: {
                                getText(text: "Азиатская")
                                    .frame(alignment: .leading)
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
                VStack {
                    ForEach(viewModel.items, id: \.self) { item in
                        Text(item)
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .padding(.vertical, 180)
                            .background(Color.red.opacity(0.3))
                            .clipShape(.rect(cornerRadius: 10))
                            .id(item)
                    }
                }
                .padding(.horizontal)
            }
        }
        .searchable(text: $viewModel.searchText)
    }
        
    
    func getText(text: String) -> some View {
        return Text(text)
            .padding(.horizontal, 15)
            .padding(.vertical, 5)
            .background(.blue)
            .foregroundStyle(.white)
            .clipShape(.rect(cornerRadius: 5))
    }
}

struct ButttonStule: ViewModifier {
    var color: Color
    var fontColor: Color
    var radius: CGFloat
    
    func body(content: Content) -> some View {
        content
        .padding(.vertical, 5)
        .padding(.horizontal, 15)
        .background(color)
        .foregroundStyle(fontColor)
        .clipShape(RoundedRectangle(cornerRadius: radius))
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}

extension Text {
    
    func butttonStyle(color: Color = .blue, fontColor: Color = .white, radius: CGFloat = 10.0) -> some View {
        self
            .modifier(ButttonStule(color: color, fontColor: fontColor, radius: radius))
    }
}
