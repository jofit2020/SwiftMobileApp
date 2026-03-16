//
//  ContentView.swift
//  lab1_fitsum_asgedom
//
//  Created by Serbijos on 15/03/26.
//

import SwiftUI
import Combine

struct ContentView: View {
       @State private var number = Int.random(in: 1...100)
       @State private var correct = 0
       @State private var wrong = 0
       @State private var attempts = 0

       @State private var resultSymbol = ""
       @State private var showDialog = false
       @State private var timeRemaining: Int = 5
    
       @State private var resultImageName=""
       @State private var resultColor: Color = .clear
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.blue, Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea(edges: .all)
                
            VStack{
                
                Text("\(number)")
                               .font(.system(size:70))
                               .foregroundColor(.white)
                               .padding()
                
                Text("Time Left: \(timeRemaining)")
                               .font(.system(size:20))
                               .foregroundColor(.white)
                               .frame(width:160,height: 30)
                               .background(.gray)
                               .padding()
                
                Spacer()
                
                Button{
                    checkAnswer(userPrime:true)
                    
                }label:{
                    
                    buttonActionView(text: "Prime")
                   
                }
                Spacer()
                Button{
                    checkAnswer(userPrime:false)
                }label:{
                    
                    buttonActionView(text: "Not Prime")
                   
                }
                Spacer()
               
                if !resultImageName.isEmpty{
                    
                    resultImage(imageName: resultImageName,bgColor: resultColor)
                }
                Text(resultSymbol)
                    .font(.system(size:40)).foregroundColor(.brown)
                           
              
            
                Spacer()
                
            }
            .padding()
        }
        .onReceive(timer) { _ in
            if attempts < 10 {
                timeRemaining -= 1
                if timeRemaining == 0 {
                    timeout()
                }
            }
        }.alert("Results ", isPresented: $showDialog){
            Button("OK"){
                resetGame()
            }
        } message: {
            Text("Correct: \(correct)\nWrong: \(wrong)")
        }
       
    }
    func checkAnswer(userPrime: Bool) {
            let prime = isPrime(number)

            if prime == userPrime {
                resultSymbol = "Correct!"
                resultImageName = "checkmark.rectangle.fill"
                resultColor = .green
                correct += 1
            } else {
                resultSymbol = "Wrong!"
                resultImageName = "xmark.rectangle.fill"
                resultColor = .red
                wrong += 1
            }

            attempts += 1
            checkAttempts()

            if !showDialog {
                nextNumber()
                timeRemaining = 5
            }
        }

        func timeout() {
            wrong += 1
            resultSymbol = "Time's up!"
            resultImageName = "xmark.rectangle.fill"
            resultColor = .red
            attempts += 1
            checkAttempts()

            if !showDialog {
                nextNumber()
                timeRemaining = 5
            }
        }

        func nextNumber() {
            number = Int.random(in: 1...100)
        }

        func checkAttempts() {
            if attempts == 10 {
                showDialog = true
            }
        }

        func resetGame() {
            number = Int.random(in: 1...100)
            correct = 0
            wrong = 0
            attempts = 0
            resultSymbol = ""
            resultImageName = ""
            resultColor = .clear
            timeRemaining = 5
        }

        func isPrime(_ n: Int) -> Bool {
            if n <= 1 { return false }
            if n == 2 { return true }
            if n % 2 == 0 { return false }

            for i in 3...Int(Double(n).squareRoot()) {
                if n % i == 0 {
                    return false
                }
            }
            return true
        }
    }


#Preview {
    ContentView()
}
    

struct buttonActionView:View{
    
    var text: String
    
    var body: some View{
        
        Text(text)
            .font(.system(size: 30, weight: .bold, design:.default))
            .frame(width: 300, height:60, alignment: .init(horizontal: .center, vertical: .center))
            .foregroundColor(.blue)
            .background(.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10).stroke(.orange, lineWidth: 3)
                )
    }
}

struct resultImage: View {
    var imageName:String
    var bgColor:Color
    var body: some View {
        Image(systemName: imageName)
            .symbolRenderingMode(.monochrome)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.white)
            .background(bgColor)
            .frame(width: 100, height: 100)
    }
}

