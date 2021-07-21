//
//  ForYou.swift
//  UI-265
//
//  Created by nyannyan0328 on 2021/07/21.
//

import SwiftUI

struct ForYou: View {
    var topEdge : CGFloat
    var body: some View {
        VStack(spacing:15){
            
            
            HStack{
                
               Text("**Todays For You**")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity,alignment: .leading)
                
                
                Spacer()
                
                Image(systemName: "person.fill")
                    .font(.system(size: 50, weight: .bold))
                    .foregroundColor(.green)
                    .overlay(
                        
                        
                        HStack{
                        
                        
                        Circle()
                            .fill(.red)
                            .frame(width: 20, height: 20)
                            .shadow(radius: 5)
                        
                        Spacer()
                        
                        
                        Circle()
                            .fill(.red)
                            .frame(width: 20, height: 20)
                            .shadow(radius: 5)
                        
                    }
                        
                    
                        
                        ,alignment: .top
                        
                    
                    
                    )
                
                
                
                
                
            }
            .padding()
            
            
            GeometryReader{proxy in
                
                let size = proxy.size
                
                
                VeriticalCrouselList {
                    
                    VStack(spacing:0){
                        
                        
                        ForEach(animals){animal in
                            
                            AnimalCard(animal: animal, topOffset: 70 + 15 + topEdge)
                                .frame(width: size.width, height: size.height)
                        
                            
                            
                            
                        }
                    }
                    
                    
                    
                    
                }
                
                
                
                
                
            }
            
            
            
            
        }
        
    }
}

struct ForYou_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct AnimalCard : View{
    
    var animal : Animal
    
    var topOffset : CGFloat
    
    
    var body: some View{
        
        
        GeometryReader{proxy in
            
            let size = proxy.size
            
            let minY = proxy.frame(in:.global).minY - topOffset
            
            let progress = -minY / size.height
            
            let scale = 1 - (progress / 3)
            
            let opa = 1 - progress
            
            ZStack{
                
                
                Image(animal.artWork)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width - 10, height: size.height - 80)
                    .cornerRadius(15)
                    .offset(x : -10)
                    .overlay(
                        Text(animal.title)
                            .font(.title.bold())
                            .foregroundColor(.yellow)
                        ,alignment: .leading
                    
                    )
                
                
               
            }
            .padding(.horizontal)
            .scaleEffect(minY < 0 ? scale : 1)
            .offset(y:minY < 0 ? -minY : 0)
            .opacity(minY < 0 ? opa : 1)
            
            
        }
        
        
    }
}
