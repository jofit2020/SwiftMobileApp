//
//  ContentView.swift
//  lab1_fitsum_asgedom
//
//  Created by Serbijos on 15/03/26.
//

import SwiftUI

struct ContentView: View {
    @State private var number = Int.random(in: 1...100)
       @State private var correct = 0
       @State private var wrong = 0
       @State private var attempts = 0

       @State private var resultSymbol = ""
       @State private var showDialog = false
    
        @State private var timeRemaining: Int = 5

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
                    
                }label:{
                    
                    buttonActionView(text: "Not Prime")
                   
                }
                Spacer()
               
                resultImage(imageName: "checkmark.rectangle.fill")
                Text(resultSymbol)
                               .font(.system(size:80))
                           
                           Text("Correct: \(correct)")
                           Text("Wrong: \(wrong)")
            
                Spacer()
                
            }
            .padding()
        }
       
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
    var body: some View {
        Image(systemName: imageName)
            .symbolRenderingMode(.monochrome)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.white)
            .background(.green)
            .frame(width: 100, height: 100)
    }
}

