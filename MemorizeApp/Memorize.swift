//
//  Memorize.swift
//  MemorizeApp
//
//  Created by Алишер Сайдешев on 09.10.2023.
//

import SwiftUI

@main
struct Memorize: App {
    @StateObject var game = MemoryViewModel()
    var body: some Scene {
        WindowGroup {
            MemoryView(viewModel: game)
        }
    }
}
