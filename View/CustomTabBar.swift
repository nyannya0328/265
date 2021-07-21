//
//  CustomTabBar.swift
//  UI-265
//
//  Created by nyannyan0328 on 2021/07/21.
//

import SwiftUI

struct CustomTabBar: View {
    @StateObject var model = HomeViewModel()
    
    init(){
        
        UITabBar.appearance().isHidden = true
    }
    
    @Namespace var animation
    var body: some View {
        TabView(selection:$model.currentTab){
            
            
            GeometryReader{proxy in
                
                
                
                let top = proxy.safeAreaInsets.top
                
                ForYou(topEdge: top)
                    .padding(.top,top)
                    .ignoresSafeArea(.all, edges: .top)
            }
                .tag("For You")
            
            ImacView()
                .scaleEffect(0.3)
                .tag("Display")
            
          MacBookProView()
                .scaleEffect(0.3)
                .tag("Note")
            
            Text("Settings")
                .tag("Settings")
            
            
            
            
        }
        .overlay(
        
            HStack{
            TabButton(title: "For You", image: "house", animation: animation)
            
            TabButton(title: "Display", image: "display", animation: animation)
            
            TabButton(title: "Note", image: "laptopcomputer", animation: animation)
            
            TabButton(title: "Settings", image: "gearshape.2", animation: animation)
            
            
            
            
        }
                .environmentObject(model)
                .padding(.vertical,9)
                .padding(.horizontal)
                .background(.thinMaterial,in: Capsule())
                .padding(.vertical,8)
                .padding(.horizontal,8)
                .shadow(color: .black.opacity(0.3), radius: 5, x: 5, y: 5)
                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: -5)
            
            
            ,alignment: .bottom
        
        )
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
    }
}

struct TabButton : View{
    
    var title : String
    var image : String
    @EnvironmentObject var model : HomeViewModel
    
    var animation : Namespace.ID
    
    var body: some View{
        
        
        Button {
            withAnimation{
                
                
                model.currentTab = title
            }
        } label: {
            
            VStack(spacing:10){
                
                Image(systemName: image)
                    .font(.title2)
                    
                
                Text(title)
                    .font(.footnote.bold())
                
                
                ZStack{
                    
                    
                    if model.currentTab == title{
                        
                        Capsule()
                            .fill(Color.green)
                            .frame(height: 3.5)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                    }
                    
                    else{
                        
                        Capsule()
                            .fill(Color.clear)
                            .frame(height: 3.5)
                        
                        
                        
                        
                    }
                }
            }
            .foregroundColor(model.currentTab == title ? .black : .gray)
            .frame(maxWidth: .infinity)
            
        }

    }
}
