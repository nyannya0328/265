//
//  VeriticalCrouselList.swift
//  UI-265
//
//  Created by nyannyan0328 on 2021/07/21.
//

import SwiftUI

struct VeriticalCrouselList<Content : View>: UIViewRepresentable {
    
    var content : Content
    
    
    init(@ViewBuilder content : @escaping() -> Content){
        
       
        
        self.content = content()
        
        
    }
    
    let scroll = UIScrollView()
    func makeUIView(context: Context) -> UIScrollView {
        setUP(scroll: scroll)
        return scroll
        
        
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
        
    }
    
    func setUP(scroll : UIScrollView){
        
        scroll.showsVerticalScrollIndicator = false
        scroll.isPagingEnabled = true
        
        
        let hostView = UIHostingController(rootView: content)
        
        hostView.view.backgroundColor = .clear
        hostView.view.translatesAutoresizingMaskIntoConstraints = false
        
        let contains = [
            
            hostView.view.topAnchor.constraint(equalTo: scroll.topAnchor),
            hostView.view.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
            hostView.view.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
            hostView.view.trailingAnchor.constraint(equalTo: scroll.trailingAnchor),
            hostView.view.widthAnchor.constraint(equalTo: scroll.widthAnchor),
        
        
        
        ]
        
        scroll.addSubview(hostView.view)
        scroll.addConstraints(contains)
        
        
        
        
        
    }
}


