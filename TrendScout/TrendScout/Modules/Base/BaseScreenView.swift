//
//  HomeScreen.swift
//  TrendScout
//
//  Created by Abhishek Dogra on 20/07/24.
//

import SwiftUI

struct BaseScreenView: View {
    @StateObject var viewModel: BaseScreenViewModel
    @Binding var selectedPage: Int
    @Binding var currentBaseModel: [BaseDataModel]
    @Binding var currentTab: MenuOptions
    init(selectedPage: Binding<Int>,
         currentBaseModel: Binding<[BaseDataModel]>,
         currentTab: Binding<MenuOptions>) {
        _selectedPage = selectedPage
        _currentBaseModel = currentBaseModel
        _currentTab = currentTab
        _viewModel = StateObject(wrappedValue: BaseScreenViewModel())
    }
    
    var body: some View {
        VStack {
            TabView(selection: $selectedPage) {
                ForEach(viewModel.baseModel.indices, id: \.self) { index in
                    Text(viewModel.baseModel[index].tabTitle)//.tag(index)
                        .foregroundStyle(Color.white)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
        .onAppear {
            viewModel.fetchData(for: currentTab)
        }
        .onChange(of: viewModel.baseModel) { _, model in
            currentBaseModel = model
        }
        .onChange(of: currentTab) {
            viewModel.fetchData(for: currentTab)
        }
    }
}

#Preview {
    HomeScreen()
}
