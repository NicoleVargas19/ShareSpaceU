//
//  MainView.swift
//  ShareSpaceU
//
//
//

import Foundation
import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            Group {
                NavigationStack {
                    HomeView()
                        .navigationTitle("ShareSpaceU")
                        .navigationBarTitleDisplayMode(.inline)
                        .frame(maxWidth: .infinity)
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Text("")
                            }
                            ToolbarItem(placement: .principal) {
                                Text("ShareSpaceU").foregroundColor(.white)
                            }
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Text("")
                            }
                        }
                        .toolbarBackground(.black,
                                           for: .navigationBar)
                        .toolbarBackground(.visible,
                                           for: .navigationBar)
                }
                    .tabItem {
                        Label("Home", systemImage: "person.crop.circle.fill.badge.plus")           }
                NavigationStack {
                    MessageView()
                    .navigationTitle("ShareSpaceU")
                    .navigationBarTitleDisplayMode(.inline)
                    .frame(maxWidth: .infinity)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Text("")
                        }
                        ToolbarItem(placement: .principal) {
                            Text("ShareSpaceU").foregroundColor(.white)
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Text("")
                        }
                    }
                    .toolbarBackground(.black,
                                       for: .navigationBar)
                    .toolbarBackground(.visible,
                                       for: .navigationBar)
                    
                }
                    .tabItem {
                        Label("Message", systemImage: "message")
                    }
                
                NavigationStack {
                    ProfileView()
                        .navigationTitle("ShareSpaceU")
                        .navigationBarTitleDisplayMode(.inline)
                        .frame(maxWidth: .infinity)
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Text("")
                            }
                            ToolbarItem(placement: .principal) {
                                Text("ShareSpaceU").foregroundColor(.white)
                            }
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Text("")
                            }
                        }
                        .toolbarBackground(.black,
                                           for: .navigationBar)
                        .toolbarBackground(.visible,
                                           for: .navigationBar)
                }
                    .tabItem {
                        Label("Profile", systemImage: "person.crop.circle")
                    }
            }
            .toolbarBackground(.black, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarColorScheme(.dark, for: .tabBar)
            
           
        }
    }
}


#Preview {
    MainView()
}

