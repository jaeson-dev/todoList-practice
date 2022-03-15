//
//  TodoList_tutorialApp.swift
//  TodoList_tutorial
//
//  Created by Jaeson.dev on 2022/03/14.
//

import SwiftUI

@main
struct TodoList_tutorialApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView ()
            }
            .environmentObject(listViewModel)
        }
    }
}
