//
//  AktivitasBulanan.swift
//  BoBNolepAssique
//
//  Created by Raja Azian on 28/06/21.
//


import SwiftUI

struct AktivitasBulanan: View {
    @State var pickerSelectedItem = 0

    @State var dataPoints: [[CGFloat]] = [
        [50, 100, 150, 30, 40],
        [150, 100, 50, 200, 10],
        [10, 20, 30, 50, 100]
    ]

    var body: some View {
        ZStack {
            VStack (alignment: .leading, spacing: 10){
                
                HStack (spacing: 50){
                    
                    VStack (alignment: .leading, spacing: 0) {
                        Text("Aktivitas impulsif bulanan")
                            .font(.system(size: 18))
                            .fontWeight(.regular)
                    }
                    
                    VStack (alignment: .trailing, spacing: 0) {
                        Button("Lihat Semua", action: {
                            print("Hello")
                        })
                    }
                }.padding(.top, 10)
                
                HStack(spacing: 25) {
                    BarView(value: dataPoints[pickerSelectedItem][0])
                    BarView(value: dataPoints[pickerSelectedItem][1])
                    BarView(value: dataPoints[pickerSelectedItem][2])
                    BarView(value: dataPoints[pickerSelectedItem][3])
                    BarView(value: dataPoints[pickerSelectedItem][4])
                    BarView(value: dataPoints[pickerSelectedItem][4])
                    BarView(value: dataPoints[pickerSelectedItem][4])
                }.padding(.top, 24)
                    .animation(.default)
            }
        }
    }
}

    struct BarView: View {

    var value: CGFloat

    var body: some View {
        VStack{
            ZStack (alignment: .bottom) {
                Capsule().frame(width: 30, height: 200)
                    .foregroundColor(Color(red: 186 / 255, green: 186 / 255, blue: 186 / 255))
                Capsule().frame(width: 30, height: value)
                    .foregroundColor(Color(red: 79 / 255, green: 140 / 255, blue: 155 / 255))
            }
            Text("D").padding(.top, 8)
        }
    }
}

