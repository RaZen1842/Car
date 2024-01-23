//
//  ContentView.swift
//  carCustomiser
//
//  Created by Veturi, Shreyas (HJRM) on 23/01/2024.
//

import SwiftUI

struct ContentView: View {
    let car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5)
    
    
    var body: some View {
        Text("Make: \(car.make)")
        Text("Model: \(car.model)")
        Text("Top Speed: \(car.topSpeed)mph")
        Text("Acceleration (0-60): \(car.acceleration)s")
        Text("Handling: \(car.handling)")
        
            .multilineTextAlignment(.center)


    }
}

#Preview {
    ContentView()
}
