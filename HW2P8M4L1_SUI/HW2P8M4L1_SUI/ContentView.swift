////
////  ContentView.swift
////  HW2P8M4L1_SUI
////
////  Created by Baha Sadyr on 11/2/24.
////
//
//import SwiftUI
//
//struct ContentView: View {
//
//    @State var textForTextField: String = ""
//
//    var body: some View {
//        ZStack {
//
//            Color(red: 251/255, green: 251/255, blue: 253/255)
//                .edgesIgnoringSafeArea(.all)
//
//
//            VStack {
//
//                HStack {
//                    Image("021024-1")
//                    Spacer()
//                    Image("021024-2")
//                }
//
//                VStack(alignment: .leading, spacing: 14) {
//                    Text("Hello User")
//                        .font(.system(size: 16)).bold()
//                    Text("Find your specialist")
//                        .font(.system(size: 32)).bold()
//                }
//                .frame(maxWidth: .infinity, alignment: .leading)
//                .padding(.top, 31)
//
//                ZStack {
//                    Color.white
//                    HStack {
//                        TextField("search", text: $textForTextField)
//                            .font(.system(size: 16))
//                        Spacer()
//                        Button {
//                            print("Btn tapped")
//                        }label: {
//                            Image("Group021124")
//                                .resizable()
//                                .frame(width: 47, height: 47)
//                                .scaledToFit()
//                        }
//
//                    }
//                    .padding(.leading,16)
//                    .padding(.trailing, 6)
//                }
//                .frame(maxWidth: .infinity, maxHeight: 60)
//                .clipShape(Capsule())
//
//                HStack(alignment: .center,  spacing: 17){
//                    CardView(imageName: "mappin.circle", text: "Place", colorName: Color(red: 113/255, green: 165/255, blue: 215/255))
//                    CardView(imageName: "phone.fill", text: "Phone", colorName: AppColors.colorGreen)
//                    CardView(imageName: "person.fill", text: "User", colorName: Color(red: 248/255, green: 184/255, blue: 148/255))
//                }
//                .padding(.top, 48)
//
//                HStack {
//                    Text("Top Doctor")
//                        .font(.system(size: 25)).bold()
//                    Spacer()
//                    Button {
//
//                    }label: {
//                        Text("See all")
//                            .foregroundStyle(AppColors.colorGreen)
//                            .font(.system(size: 14))
//                    }
//                }
//                .padding(.top, 40)
//
//                Spacer()
//                VStack(spacing: 14) {
//                    ZStack {
//                        Color.white
//                            .clipShape(RoundedRectangle(cornerRadius: 20))
//                        HStack(alignment: .top, spacing: 21) {
//                            Image("021124-5")
//                                .resizable()
//                                .scaledToFill()
//                                .frame(width: 82, height: 82)
//                                .clipShape(RoundedRectangle(cornerRadius: 15))
//                                .padding(.top, 16)
//                                .padding(.leading, 10)
//                            VStack(alignment: .leading, spacing: 8) {
//                                Text("User Name")
//                                    .font(.system(size: 20)).bold()
//                                Text("Lorem ipsum dolor sit amet")
//                                    .font(.system(size: 14))
//                                    .foregroundColor(AppColors.colorGray)
//                                HStack {
//                                    Image(systemName: "021124-6")
//                                        .resizable()
//                                        .frame(width: 14, height: 14)
//                                        .foregroundColor(AppColors.colorGray)
//                                    Text("10.40 am - 2.40 pm")
//                                        .font(.system(size: 14))
//                                        .foregroundColor(AppColors.colorGray)
//                                }
//                                HStack(spacing: 67) {
//                                    Text("$10.50")
//                                        .font(.system(size: 14))
//                                        .foregroundColor(AppColors.colorGray)
//                                    Button(action: {
//                                        print("Appointment tapped")
//                                    }) {
//                                        Text("Appointment")
//                                            .font(.system(size: 14))
//                                            .foregroundColor(.white)
//                                            .padding(.horizontal, 12)
//                                            .padding(.vertical, 4)
//                                    }
//                                    .background(AppColors.colorGreen)
//                                    .clipShape(Capsule())
//                                }
//                            }
//                            .padding(.top, 16)
//                        }
//                    }
//                    .frame(height: 145)
//                    .padding(.horizontal, 0)
//                    Spacer()
//                }
//                .padding(.horizontal, 30)
//                .padding(.top, 0)
//            }
//        }
//
//    }
//        .padding(.horizontal, 30)
//}
//
//#Preview {
//    ContentView()
//}
//
//struct CardView: View {
//    var imageName: String
//    var text: String
//    var colorName: Color
//    var body: some View {
//        VStack(spacing: 14) {
//            Image(systemName: imageName)
//                .resizable()
//                .scaledToFit()
//                .frame(width: 42, height: 42)
//                .foregroundStyle(.white)
//            Text(text)
//                .font(.system(size: 16))
//                .foregroundColor(.white)
//        }
//        .frame(minWidth: 80, idealWidth: 112, maxWidth: 112, minHeight: 80, idealHeight: 112, maxHeight: 112)
//        .background(colorName)
//        .clipShape(RoundedRectangle(cornerRadius: 20))
//    }
//}
//
//enum AppColors {
//    static let  colorGreen = Color(red: 114/255, green: 204/255, blue: 212/255)
//    static let colorGray = Color(red: 171/255, green: 173/255, blue: 185/255)
//}

//
//  ContentView.swift
//  HW2P8M4L1_SUI
//
//  Created by Baha Sadyr on 11/2/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var textForTextField: String = ""
    var body: some View {
        ZStack {
            
            Color(red: 251/255, green: 251/255, blue: 253/255)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack {
                
                HStack {
                    Image("021024-1")
                    Spacer()
                    Image("021024-2")
                }
                
                VStack(alignment: .leading, spacing: 14) {
                    Text("Hello User")
                        .font(.system(size: 16)).bold()
                    Text("Find your specialist")
                        .font(.system(size: 32)).bold()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 31)
                
                ZStack {
                    Color.white
                    HStack {
                        TextField("search", text: $textForTextField)
                            .font(.system(size: 16))
                        Spacer()
                        Button {
                            print("Btn tapped")
                        }label: {
                            Image("Group021124")
                                .resizable()
                                .frame(width: 47, height: 47)
                                .scaledToFit()
                        }
                        
                    }
                    .padding(.leading,16)
                    .padding(.trailing, 6)
                }
                .frame(maxWidth: .infinity, maxHeight: 60)
                .clipShape(Capsule())
                
                HStack(alignment: .center,  spacing: 17){
                    CardView(imageName: "mappin.circle", text: "Place", colorName: Color(red: 113/255, green: 165/255, blue: 215/255))
                    CardView(imageName: "phone.fill", text: "Phone", colorName: AppColors.colorGreen)
                    CardView(imageName: "person.fill", text: "User", colorName: Color(red: 248/255, green: 184/255, blue: 148/255))
                }
                .padding(.top, 48)
                
                HStack {
                    Text("Top Doctor")
                        .font(.system(size: 25)).bold()
                    Spacer()
                    Button {
                        
                    }label: {
                        Text("See all")
                            .foregroundStyle(AppColors.colorGreen)
                            .font(.system(size: 14))
                    }
                }
                .padding(.top, 40)
                
                Spacer()
                VStack(spacing: 14) {
                    FooterCardView(imageName: "021124-5",textDesc: "Lorem ipsum dolor sit amet" )
                    FooterCardView(imageName: "021124-5",textDesc: "Lorem ipsum dolor sit amet" )
                }
                Spacer()
            }
            .padding(.horizontal, 30)
            .padding(.top, 0)
            
            
            
            
            
            
            
            
            
            
            
            
        }
        
    }
    
}


#Preview {
    ContentView()
}

enum AppColors {
    static let  colorGreen = Color(red: 114/255, green: 204/255, blue: 212/255)
    static let colorGray = Color(red: 171/255, green: 173/255, blue: 185/255)
}


struct CardView: View {
    var imageName: String
    var text: String
    var colorName: Color
    var body: some View {
        VStack(spacing: 14) {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 42, height: 42)
                .foregroundStyle(.white)
            Text(text)
                .font(.system(size: 16))
                .foregroundColor(.white)
        }
        .frame(minWidth: 80, idealWidth: 112, maxWidth: 112, minHeight: 80, idealHeight: 112, maxHeight: 112)
        .background(colorName)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct FooterCardView: View {
    var imageName: String
    var textDesc: String
    var body: some View {
        ZStack {
            Color.white
                .clipShape(RoundedRectangle(cornerRadius: 20))
            HStack(alignment: .top, spacing: 21) {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 82, height: 82)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding(.top, 16)
                    .padding(.leading, 10)
                VStack(alignment: .leading, spacing: 8) {
                    Text("User Name")
                        .font(.system(size: 20)).bold()
                    Text(textDesc)
                        .font(.system(size: 14))
                        .foregroundColor(AppColors.colorGray)
                    HStack {
                        Image( "021124-6")
                            .resizable()
                            .frame(width: 14, height: 14)
                            .foregroundColor(AppColors.colorGray)
                        Text("10.40 am - 2.40 pm")
                            .font(.system(size: 14))
                            .foregroundColor(AppColors.colorGray)
                    }
                    HStack(spacing: 67) {
                        Text("$10.50")
                            .font(.system(size: 14))
                            .foregroundColor(AppColors.colorGray)
                        Button(action: {
                            print("Appointment tapped")
                        }) {
                            Text("Appointment")
                                .font(.system(size: 14))
                                .foregroundColor(.white)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 4)
                        }
                        .background(AppColors.colorGreen)
                        .clipShape(Capsule())
                    }
                }
                .padding(.top, 16)
            }
        }
        .frame(height: 145)
        .padding(.horizontal, 0)
    }
}
