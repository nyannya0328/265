//
//  GeoView.swift
//  UI-265
//
//  Created by nyannyan0328 on 2021/07/21.
//

import SwiftUI

struct GeoView: View {
    var body: some View {
      
        GeometryReader{proxy in
            
            let size = proxy.size
            
            
            VStack{
                
                HStack{
                    
                    Image("p1")
                        .resizable()
                       
                        .frame(height: 270)
                    
                    
                    VStack{
                        
                        Image("p2")
                            .resizable()
                            
                        
                        Image("p3")
                            .resizable()
                        
                        
                        
                    }
                    .frame(width: size.width / 3, height: 270)
                    
                    
                }
                
                
                
                HStack{
                    
                    Image("p2")
                        .resizable()
                        
                    
                    Image("p3")
                        .resizable()
                    
                    Image("p2")
                        .resizable()
                        
                    
                    Image("p3")
                        .resizable()
                    
                    
                    
                }
                .frame(height: 135)
                
            }
            .padding(.horizontal,13)
           
        }
            
      
    }
}

struct GeoView_Previews: PreviewProvider {
    static var previews: some View {
        GeoView()
    }
}
