//
//  ToDoListAppWithSwiftUIApp.swift
//  ToDoListAppWithSwiftUI
//
//  Created by yanghj on 2023/07/10.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListAppWithSwiftUIApp: App {
    init() {
        // firebase 설정
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
