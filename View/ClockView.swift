//
//  ClockView.swift
//  UI-265
//
//  Created by nyannyan0328 on 2021/07/21.
//

import SwiftUI
extension View{
    
    
    func getRect()->CGRect{
        
        return UIScreen.main.bounds
    }
}

struct ClockView: View {
    @State var dark = false
    
    @State var currentTime = Time(min: 0, sec: 0, hour: 0)
    
    @State var reciver = Timer.publish(every: 1, on: .current, in: .default).autoconnect()
    var body: some View {
        VStack{
            
            
            HStack{
                
                Text("Analog Clock")
                    .font(.largeTitle.italic())
                    .foregroundColor(.pink)
                
                Spacer()
                
                Button {
                    
                    withAnimation{
                        
                        dark.toggle()
                    }
                    
                } label: {
                    
                    Image(systemName: dark ? "pawprint" : "sun.min.fill")
                        .font(.system(size: 30, weight: .bold))
                        .padding(10)
                        .foregroundColor(.orange)
                        .background(.ultraThinMaterial,in: Circle())
                    
                    
                }

                
                
                
            }
            .padding(.horizontal)
            
            
            ZStack{
                
                Circle()
                    .fill(.gray.opacity(0.3))
                
                ForEach(0..<60,id:\.self){index in
                    
                    Rectangle()
                        .fill(.primary)
                        .frame(width: 2, height: (index % 5) == 0 ? 15 : 0)
                        .offset(y:180)
                        .rotationEffect(.init(degrees: Double(index ) * 6))
                    
                    
                    
                }
                
                
                Rectangle()
                    .fill(.primary)
                    .frame(width: 2, height: (getRect().width - 180) / 2)
                    .offset(y: -(getRect().width - 180) / 4)
                    .rotationEffect(.init(degrees: Double(currentTime.sec) * 6))
                
                Rectangle()
                    .fill(.primary)
                    .frame(width: 4, height: (getRect().width - 200) / 2)
                    .offset(y: -(getRect().width - 200) / 4)
                    .rotationEffect(.init(degrees: Double(currentTime.min) * 6))
                
                Rectangle()
                    .fill(.primary)
                    .frame(width: 4.5, height: (getRect().width - 240) / 2)
                    .offset(y: -(getRect().width - 240) / 4)
                    .rotationEffect(.init(degrees: Double(currentTime.hour) + (Double(currentTime.min) / 60) * 30))
                
                
           Circle()
                    .fill(.primary)
                    .frame(width: 15, height: 15)
                
                
                
                
                
            }
            .padding()
          //  .frame(width: getRect().width - 80, height: getRect().height - 90)
            
            
            Text(Locale.current.localizedString(forRegionCode: Locale.current.regionCode ?? "")!)
            
            
            Text(getTime())
                .font(.title.bold())
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .preferredColorScheme(dark ? .dark : .light)
        .onReceive(reciver) { _ in
            
            
            let carrneder = Calendar.current
            
            let min = carrneder.component(.minute, from: Date())
            
            let hour = carrneder.component(.hour, from: Date())
            
            let sec = carrneder.component(.second, from: Date())
            
            withAnimation(.linear){
                
                
                self.currentTime = Time(min: min, sec: sec, hour:hour)
            }
            
            
        }
        .onAppear {

            let carrneder = Calendar.current

            let min = carrneder.component(.minute, from: Date())

            let hour = carrneder.component(.hour, from: Date())

            let sec = carrneder.component(.second, from: Date())

            withAnimation(.linear){


                self.currentTime = Time(min: min, sec: sec, hour:hour)
            }


        }
    }
    
    func getTime()->String{
        
        
        
        let fomatt = DateFormatter()
        
        fomatt.dateFormat = "hh:mm a"
        
        return fomatt.string(from: Date())
    }
}

struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView()
    }
}

struct Time{
    
    
   var min : Int
    var sec : Int
    var hour : Int
}
