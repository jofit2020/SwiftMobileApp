//
//  ContentView.swift
//  lab1_fitsum_asgedom
//
//  Created by Serbijos on 15/03/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.blue, Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea(edges: .all)
                
            VStack{
                Button{
                    print("Tapped")
                }label:{
                    
                    buttonActionView(text: "Tap me")
                   
                }
                Spacer()
                Button{
                    print("Tapped")
                }label:{
                    
                    buttonActionView(text: "Prime")
                   
                }
                Spacer()
                Button{
                    print("Tapped")
                }label:{
                    
                    buttonActionView(text: "Not Prime")
                   
                }
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
