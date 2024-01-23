//
//  ContentView.swift
//  carCustomiser
//
//  Created by Veturi, Shreyas (HJRM) on 23/01/2024.
//

import SwiftUI

struct ContentView: View {
    let starterCars = StarterCars()
    @State private var selectedCar: Int = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("\(starterCars.cars[selectedCar].displayStats())")
            Button("Random Car", action: {
                selectedCar = Int.random(in: 0..< self.starterCars.cars.count)
            })
        }
    }
}

#Preview {
    ContentView()
}
