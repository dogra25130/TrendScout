//
//  HomeScreenBaseView+TopTabs.swift
//  TrendScout
//
//  Created by Abhishek Dogra on 23/07/24.
//

import SwiftUI
extension HomeScreen {
    
    @ViewBuilder
    func Screen() -> some View {
        ZStack {
            Color.black
            VStack(spacing: .zero) {
                if shouldShowTopInfoBar() {
                    TabBarAndTopTabs()
                }
                BaseScreenView(selectedPage: $selectedPage,
                               currentBaseModel: $currentBaseModel,
                               currentTab: $currentTab)
                .ignoresSafeArea()
            }
            
        }.ignoresSafeArea()
        
    }
    
    @ViewBuilder
    private func TabBarAndTopTabs() -> some View {
        VStack(spacing: .zero) {
            TopInfoBar()
            CustomSegmentedControl(selectedIndex: $selectedPage,
                                   currentScreenModels: $currentBaseModel)
        }
        .ignoresSafeArea()
        .background(LinearGradient(colors: [Color(hex: "#3B4371"),
                                            Color(hex: "#F0F2F0")],
                                   startPoint: .top, endPoint: .bottom))
    }
    
    @ViewBuilder
    func TopInfoBar() -> some View {
        VStack {
            HStack(alignment: .center, spacing: .p10) {
                OptionsView()
                AddressView()
                Spacer()
                SearchView()
                CartView()
            }
            .padding()
        }
        .padding(.top, Utils.getSafeAreaTop())
    }
    
    @ViewBuilder
    private func OptionsView() -> some View {
        Button {
            showSideMenu.toggle()
        } label: {
            Image(systemName: showSideMenu ?
                  "xmark" : "line.3.horizontal")
            .resizable()
            .frame(width: .p16, height: .p16)
            .foregroundStyle(.black)
        }
    }
    
    @ViewBuilder
    private func AddressView() -> some View {
        Group {
            Text("Home ")
                .font(.title2)
                .bold()
            +
            Text("D-61, Block G, Sector 63")
        }
        .foregroundStyle(.black)
        .lineLimit(1)
    }
    
    @ViewBuilder
    private func SearchView() -> some View {
        Button {
            
        } label: {
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: .p22, height: .p22)
                .foregroundStyle(.black)
            
        }
    }
    
    @ViewBuilder
    private func CartView() -> some View {
        Button {
            
        } label: {
            Image(systemName: "cart")
                .resizable()
                .frame(width: .p22, height: .p22)
                .foregroundStyle(.black)
            
        }
    }
}

extension HomeScreen {
    private func shouldShowTopInfoBar() -> Bool {
        return currentTab != .profile && currentTab != .logout
    }
}
#Preview {
    HomeScreen()
}
