//
//  ContentView.swift
//  lengthConversion
//
//  Created by Hua Son Tung on 9/16/20.
//  Copyright © 2020 Hua Son Tung. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let values = ["meter","kilometer","inch","foot"]
    @State private var input = 0
    @State private var inputValue = ""
    @State private var output = 0
    
    var result:Double {
        var finalResult: Double = 0
        let userInput = Double(inputValue) ?? 0
        
        switch output {
        case 0:
            switch input {
            case 0:
                finalResult = userInput * 1
            case 1:
                finalResult = userInput * 0.001
            case 2:
                finalResult = userInput * 39.3700787
            case 3:
                finalResult = userInput * 3.2808399
            default:
                break
            }
        case 1:
            switch input {
                case 0:
                    finalResult = userInput * 1000
                case 1:
                    finalResult = userInput * 1
                case 2:
                    finalResult = userInput * 39370.0787
                case 3:
                    finalResult = userInput * 3280.8399
                default:
                    break
            }
            
        case 2:
            switch input {
                case 0:
                    finalResult = userInput * 0.0254
                case 1:
                    finalResult = userInput * 0.0000254
                case 2:
                    finalResult = userInput * 1
                case 3:
                    finalResult = userInput * 0.083333333
                default:
                    break
            }
        
        case 3:
            switch input {
                case 0:
                    finalResult = userInput * 0.3048
                case 1:
                    finalResult = userInput * 0.0003048
                case 2:
                    finalResult = userInput * 12
                case 3:
                    finalResult = userInput * 1
                default:
                    break
            }
        
            
        default:
            return 0
            
        }
        return finalResult
    }
    
    
    
    var body: some View {
        NavigationView {
                Form {
                    Section (header: Text("Choose your input value type")) {
                        Picker ("Choose input value", selection: $input) {
                            ForEach (0 ..< values.count) {
                                Text("\(self.values[$0])")
                            }
                        }
                    .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    Section (header: Text("Enter your value")) {
                        TextField("Input value", text: $inputValue)
                            .keyboardType(.decimalPad)
                    }
                
            
                    Section (header: Text("Choose your output value type")) {
                        Picker ("Choose output value", selection: $output) {
                            ForEach (0 ..< values.count) {
                                Text("\(self.values[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                    
                    Section (header: Text("Result")) {
                        Text("\(result, specifier: "%.3f")")
                    }
            }
            .navigationBarTitle(Text("Length Conversion"))
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
