//
//  BaseScreen.swift
//  TrendScout
//
//  Created by Abhishek Dogra on 22/07/24.
//

import SwiftUI

struct HomeScreen: View {
    @State var viewModel = HomeScreenViewModel()
    @State var showSideMenu: Bool = false
    @State var currentTab: MenuOptions = .clothes
    @State var currentBaseModel: [BaseDataModel] = []
    @State var selectedPage: Int = 0
    
    var body: some View {
        AnimatedSideBar(showMenu: $showSideMenu) { safeArea in
            NavigationStack {
                Screen()
            }
        } menuView: { safeArea in
            SideBarMenuView(safeArea)
        } background: {
            Rectangle()
                .fill(.black.opacity(0.8))
        }
    }
}

extension HomeScreen {
    
    @ViewBuilder
    private func SideBarMenuView(_ safeArea: UIEdgeInsets) -> some View {
        VStack(alignment: .leading, spacing: .p12) {
            Text("TrendScout")
                .font(.system(.title, design: .rounded))
                .bold()
                .padding(.bottom, .p10)
                .foregroundStyle(Color.white)
            
            SideBarButton(.clothes)
            SideBarButton(.jewellery)
            SideBarButton(.accessories)
            SideBarButton(.premium)
            Spacer()
            SideBarButton(.profile)
            SideBarButton(.logout)
        }
        .padding(.horizontal, .p15)
        .padding(.vertical, .p20)
        .padding(.top, safeArea.top)
        .padding(.bottom, safeArea.bottom)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
    
    @ViewBuilder
    private func SideBarButton(_ menu: MenuOptions) -> some View {
        Button {
            selectedPage = .zero
            withAnimation {
                currentTab = menu
            }
        } label: {
            HStack {
                Image(systemName: menu.image)
                    .font(.title3)
                    .frame(width: .p40)
                Text(menu.title)
                    .font(.title3)
                    .bold()
                Spacer()
            }
            .bold()
            .padding(.vertical, .p10)
            .contentShape(.rect)
            .foregroundStyle(Color.white)
        }
    }
}

#Preview {
    HomeScreen()
}
