//
//  UMCWeek8App.swift
//  UMCWeek8
//
//  Created by 이승민 on 11/30/23.
//

import SwiftUI
import Firebase

@main
struct UMCWeek8App: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
            
        }
    }
}
