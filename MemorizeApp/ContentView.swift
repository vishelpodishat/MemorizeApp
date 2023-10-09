//
//  ContentView.swift
//  MemorizeApp
//
//  Created by Алишер Сайдешев on 09.10.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = false
    var body: some View {
        ZStack(alignment: .center) {
            let baseCornerRadius = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                baseCornerRadius
                    .fill(.white)
                    .foregroundColor(.white)
                baseCornerRadius
                    .strokeBorder(lineWidth: 2)
                Text("☃️")
                    .font(.largeTitle)
            } else {
                baseCornerRadius
                    .fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
