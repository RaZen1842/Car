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
    @State private var drivetrainPackage = false
    @State private var ecuFuelPackage = false
    @State private var remainingFunds = 1000
    
    
    var exhaustPackageEnabled: Bool {
        if remainingFunds < 500 {
            if self.exhaustPackage != true {
                return false
            }
        }
        else {
            return true
        }
        return true
    }
    
    var tiresPackageEnabled: Bool {
        if remainingFunds < 500 {
            if self.tiresPackage != true {
                return false
            }
        }
        else {
            return true
        }
        return true
    }
    
    var drivetrainPackageEnabled: Bool {
        if remainingFunds < 300 {
            if self.drivetrainPackage != true {
                return false
            }
        }
        else {
            return true
        }
        return true
    }
    
    var ecuFuelPackageEnabled: Bool {
        if remainingFunds < 1000 {
            if self.ecuFuelPackage != true {
                return false
            }
        }
        else {
            return true
        }
        return true
    }
    
    
    
    
    var body: some View {
        
        let exhaustPackageBinding = Binding<Bool> (
            get: { self.exhaustPackage },
            set: { newValue in
                self.exhaustPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 5
                    remainingFunds -= 500
                }
                else {
                    starterCars.cars[selectedCar].topSpeed -= 5
                    remainingFunds += 500
                }
                
            }
        )
        
        let tiresPackageBinding = Binding<Bool> (
            get: { self.tiresPackage },
            set: { newValue in
                self.tiresPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 5
                    remainingFunds -= 500
                }
                else {
                    starterCars.cars[selectedCar].topSpeed -= 5
                    remainingFunds += 500
                }
                
            }
        )
        
        let drivetrainPackageBinding = Binding<Bool> (
            get: { self.drivetrainPackage },
            set: { newValue in
                self.drivetrainPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 2
                    remainingFunds -= 300
                }
                else {
                    starterCars.cars[selectedCar].topSpeed -= 2
                    remainingFunds += 300
                }
                
            }
        )
        
        let ecuFuelPackageBinding = Binding<Bool> (
            get: { self.ecuFuelPackage },
            set: { newValue in
                self.ecuFuelPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 3
                    starterCars.cars[selectedCar].acceleration -= 1.5
                    remainingFunds -= 1000
                }
                else {
                    starterCars.cars[selectedCar].topSpeed -= 3
                    starterCars.cars[selectedCar].acceleration += 1.5
                    remainingFunds += 1000
                }
                
            }
        )
        
        VStack {
            
            Form {
                VStack(alignment: .leading, spacing: 20) {
                    Text("\(starterCars.cars[selectedCar].displayStats())")
                    Button("Next Car", action: {
                        selectedCar += 1
                        if selectedCar == self.starterCars.cars.count {
                            selectedCar = 0
                        }
                        resetDisplay()
                    })
                }
                Section {
                    Toggle("Exhaust Package (Cost: 500)", isOn: exhaustPackageBinding)
                        .disabled(!exhaustPackageEnabled)
                    Toggle("Tires Package (Cost: 500)", isOn: tiresPackageBinding)
                        .disabled(!tiresPackageEnabled)
                    Toggle("Drivetrain Package (Cost: 300)", isOn: drivetrainPackageBinding)
                        .disabled(!drivetrainPackageEnabled)
                    Toggle("ECU & Fuel Package (Cost: 1000)", isOn: ecuFuelPackageBinding)
                        .disabled(!ecuFuelPackageEnabled)
                }
            }
            Text("Remaining Funds: \(remainingFunds)")
                .foregroundColor(.red)
                .baselineOffset(20)
        }
    }
    func resetDisplay() {
        remainingFunds = 1000
        exhaustPackage = false
        tiresPackage = false
        drivetrainPackage = false
        ecuFuelPackage = false
        starterCars = StarterCars()
    }
}

#Preview {
    ContentView()
}
