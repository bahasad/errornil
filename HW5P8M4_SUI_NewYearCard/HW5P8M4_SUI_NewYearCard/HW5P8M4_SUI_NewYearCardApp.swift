//
//  HW5P8M4_SUI_NewYearCardApp.swift
//  HW5P8M4_SUI_NewYearCard
//
//  Created by Baha Sadyr on 11/19/24.
//

import SwiftUI

@main
struct HW5P8M4_SUI_NewYearCardApp: App {
    @State var path = NavigationPath()
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $path) {
                HomeView(path: $path)
                    .navigationDestination(for: Pages.self) { page in
                        switch page {
                        case .profile(let mainCardModels):
                            MainView(mainViewModel: mainCardModels)
                        }
                    }
            }
        }
    }
}
