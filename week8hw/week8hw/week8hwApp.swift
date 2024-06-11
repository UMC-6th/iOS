//
//  week8hwApp.swift
//  week8hw
//
//  Created by 이재용 on 5/30/24.
//

import SwiftUI

@main
struct week8hwApp: App {
    var body: some Scene {
        WindowGroup {
            MenuView(menuViewModel: MenuViewModel() )
        }
    }
}
