//
//  ContentView.swift
//  carCustomiser
//
//  Created by Veturi, Shreyas (HJRM) on 23/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var starterCars = StarterCars()
    @State private var selectedCar: Int = 0
    
    @State private var exhaustPackage = false
    @State private var tiresPackage = false
    
    var body: some View {
        
        let exhaustPackageBinding = Binding<Bool> (
            get: { self.exhaustPackage },
            set: { newValue in
                self.exhaustPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 5
                }
                else {
                    starterCars.cars[selectedCar].topSpeed -= 5
                }
                
            }
        )
        
        let tiresPackageBinding = Binding<Bool> (
            get: { self.tiresPackage },
            set: { newValue in
                self.tiresPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].handling += 1
                }
                else {
                    starterCars.cars[selectedCar].handling -= 1
                }
                
            }
        )
        
        Form {
            VStack(alignment: .leading, spacing: 20) {
                Text("\(starterCars.cars[selectedCar].displayStats())")
                Button("Next Car", action: {
                    selectedCar += 1
                    if selectedCar == self.starterCars.cars.count {
                        selectedCar = 0
                    }
                })
            }
            Section {
                Toggle("Exhaust Package", isOn: exhaustPackageBinding)
                Toggle("Tires Package", isOn: tiresPackageBinding)
            }
        }
    }
}

#Preview {
    ContentView()
}
