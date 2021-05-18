//
//  ContentView.swift
//  CatchTheKennySwiftUI
//
//  Created by Mutlu Aydın on 5/1/21.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    @State var score = 0
    @State var timeLeft = 6
    @State var kennyPositionWidth : Double = 0.5
    @State var kennyPositionHeight : Double = 0.4
    @State var alert = false
    @State var endGame = false
    
    
    func randomFloatWidth () -> Double {
        let randomFloatWidth = Double.random(in: 0.1...0.9)
        
        return randomFloatWidth
        
    }
    
    func randomFloatHeight () -> Double {
        let randomFloatHeight = Double.random(in: 0.1...0.7)
        
        return randomFloatHeight
        
    }
    
    var counterTimer : Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
            
        if timeLeft >= 1 {
            self.timeLeft -= 1
            
        } else {
            alert = true
        }
                
        }
    }
    
    var timer : Timer {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {
            _ in
            
            if timeLeft >= 1 {
                self.kennyPositionWidth = self.randomFloatWidth()
                self.kennyPositionHeight = self.randomFloatHeight()
                print(kennyPositionWidth)
                print(kennyPositionHeight)
                
            } else {
                alert = true
            }
        
        }
    }
    
    
    var body: some View {
    
        VStack {
            
            VStack {
            
                Text("Catch the Kenny").font(.title)
                Text("Score: \(self.score)")
                Text("Time Left: \(self.timeLeft)")
                Divider()
                    
            }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.15)
            .foregroundColor(.blue)
            
            VStack {
                    
                
                Image("kenny").resizable().frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.height * 0.2, alignment: .center)
                    .foregroundColor(.blue)
                                        
                    .position(x: UIScreen.main.bounds.width * CGFloat(kennyPositionWidth) , y: UIScreen.main.bounds.height * CGFloat(kennyPositionHeight)
                    )
                    .gesture(TapGesture(count: 1).onEnded({ (_) in
                        self.score += 1
                    }))
                
                    
                    
                    .onAppear{
                        
                        
                        _ = self.timer // _ = anlami bunu bir degisken olarak degil sadece bir seferlik kullanacagim anlamina geliyor

                        _ = self.counterTimer
                        
                        
                    }
                    .alert(isPresented: $alert) {
                        Alert(
                            title: Text("Your Score is: \(String(score))"),
                            message: Text("Please try again..."),
                            primaryButton: .default(
                                Text("Try Again"),
                                action: {
                                    self.timeLeft = 5
                                    self.score = 0
                                }
                            ),
                            secondaryButton: .destructive(
                                Text("End.."),
                                action: {
                                    
                                    self.alert = true
                        
                                }
                            )
                        )
                    }
                
            }
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}
