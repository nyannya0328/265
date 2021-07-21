//
//  MacBookProView.swift
//  UI-265
//
//  Created by nyannyan0328 on 2021/07/21.
//

import SwiftUI

struct MacBookProView: View {
    var body: some View {
        ZStack{
            
            proScreenView()
            
            MacBottomSheet()
            
            
        }
    }
}

struct MacBookProView_Previews: PreviewProvider {
    static var previews: some View {
        MacBookProView()
            .previewLayout(.fixed(width: 1500, height: 1000))
    }
}

struct proScreenView : View{
   
    
    var body: some View{
        
        ZStack{
            
            RoundedRectangle(cornerRadius: 30)
            
            RoundedRectangle(cornerRadius: 30)
                .strokeBorder(Color("Gray"))
            
            
            VStack(spacing:0){
                
                
                Image("p1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 1200, height: 590)
                    .cornerRadius(0)
                    .padding(.top,40)
                    .padding(.bottom,13)
                
                
                Rectangle()
                    .fill(Color.white.opacity(0.14))
                    .overlay(
                    
                        
                        Text("Mac book Pro")
                            .font(.footnote.italic())
                            .foregroundColor(.orange)
                           
                            
                    
                    )
               
            }
            
            
            HStack{
                
                ZStack{
                    
                    
                    Color.gray.opacity(0.3)
                        .clipShape(Circle())
                    
                        .frame(width: 10, height: 10)
                    
                    
                    Color.black.opacity(0.3)
                        .clipShape(Circle())
                    
                        .frame(width: 5, height: 5)
                    
                    
                    
                    
                    
                }
                
                Color.green
                    .clipShape(Circle())
                    .frame(width: 10, height: 10)
                
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .offset(y: 10)
            
            
        }
        .frame(width: 1265, height: 695)
        
        
    }
}

struct MacBottomSheet : View{
    
    var body: some View{
        
        
        ZStack{
            
            ZStack{
                
                RoundedRectangle(cornerRadius: 100)
                    .fill(Color("Gray2"))
                
                RoundedRectangle(cornerRadius: 3)
                    .fill(
                    
                    LinearGradient(colors:
                        
                        macbooklinea()
                    
                    
                    , startPoint: .leading, endPoint: .trailing)
                    )
                    .frame(width: 180)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                
                RoundedRectangle(cornerRadius: 3)
                    .fill(
                    
                    LinearGradient(colors:
                        
                                    macbooklinea().reversed()
                    
                    
                    , startPoint: .leading, endPoint: .trailing)
                    )
                    .frame(width: 180)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
                
                
                
                
            }
            .frame(height: 25)
            .scaleEffect(0.7)
            
            
            CustomShape(radi: 20, corner: [.bottomLeft,.bottomRight])
                .fill(Color("Gray1").opacity(0.5))
                .frame(height: 50)
                .overlay(
                    
                    CustomShape(radi: 20, corner: [.bottomLeft,.bottomRight])
                        .fill(
                        
                            LinearGradient(colors: [
                            
                                Color("Gray1"),
                                Color("Gray1").opacity(0.4),
                                .black.opacity(0.2),
                                .black.opacity(0.6)
                            
                            
                            
                            ], startPoint: .top, endPoint: .bottom)
                        )
                
                
                
                
                )
                .overlay(
                
                    CustomShape(radi: 20, corner: [.bottomLeft,.bottomRight])
                        .fill(
                        
                            LinearGradient(colors: [
                            
                                .black.opacity(0.2),
                                .black.opacity(0.1),
                                .clear
                            
                            
                            
                            ], startPoint: .top, endPoint: .bottom)
                            
                        
                        )
                        .frame(height: 80)
                        .rotation3DEffect(.init(degrees: 50), axis: (x: 1, y: 0, z: 0), anchor: .center, anchorZ: 0.3, perspective: 3)
                        .shadow(radius: 2)
                        .scaleEffect(1.05)
                        .offset(y: 50)
                
                
                
                
                )
                .scaleEffect(0.675)
                .rotation3DEffect(.init(degrees: -70), axis: (x: 1, y: 0, z: 0), anchor: .center, anchorZ: 1, perspective: 3)
                .offset(y: 15.5)
               
        }
        .frame(width: 1200, height: 1000)
        .drawingGroup()
        .scaleEffect(1.7)
        .overlay(
        
            ZStack{
            
            
            RoundedRectangle(cornerRadius: 100)
                .fill(.gray.opacity(0.4))
            
            
            let cleaColor = Array(repeating: Color.clear, count: 15)
            
            
            
            let colos : [Color] = [
            
                .black.opacity(0.55),
                .black.opacity(0.25),
                .black.opacity(0.05)
                
            
            ]
            
            let comborenia = colos + cleaColor + colos.reversed()
            
            RoundedRectangle(cornerRadius: 100)
                .fill(LinearGradient(colors: comborenia, startPoint: .leading, endPoint: .trailing))
            
            
            RoundedRectangle(cornerRadius: 100)
                .fill(.red.opacity(0.1))
            
            
            
        }
                .frame(width: 220, height: 35)
                .offset(y: -15)
                .clipped()
                .offset(y: 2)
        
        )
        .offset(y: 350)
        
    }
    
    func macbooklinea()->[Color]{
        
        let colors = [
        
            Color("Gray2"),
            Color("Gray1").opacity(0.7),
            Color("Gray2"),
            Color("Gray2"),
            Color("Gray2"),
        
        
        ]
        
        return colors
        
        
    }
}

struct CustomShape : Shape{
    let radi : CGFloat
    let corner : UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let paht = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radi, height: radi))
        
        return Path(paht.cgPath)
    }
}
