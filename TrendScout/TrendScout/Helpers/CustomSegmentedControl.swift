//
//  CustomSegmentedControl.swift
//  TrendScout
//
//  Created by Abhishek Dogra on 23/07/24.
//

import SwiftUI
struct CustomSegmentedControl: View {
    @Binding var selectedIndex: Int
    @Binding var currentScreenModels: [BaseDataModel]
    
    let color = Color.secondary
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: .p20) {
                ForEach(currentScreenModels.indices, id:\.self) { index in
                    Text(currentScreenModels[index].tabTitle)
                        .foregroundStyle(Color.black)
                        .fontWeight(selectedIndex == index ? .bold : .regular)
                        .overlay(
                            RoundedRectangle(cornerRadius: 1, style: .circular)
                                .fill(Color(hex: "#F56217"))
                                .cornerRadius(20)
                                .offset(y: .p14)
                                .frame(height: .p6)
                                .opacity(selectedIndex == index ? 1 : 0.01)
                        )
                        .onTapGesture {
                            selectedIndex = index
                        }
                }
            }
            .padding(EdgeInsets(top: .p16, leading: .p16, bottom: .p4, trailing: .p16))
        }
    }
}
#Preview {
    HomeScreen()
}
