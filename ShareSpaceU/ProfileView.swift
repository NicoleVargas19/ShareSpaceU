//
//  ProfileView.swift
//  ShareSpaceU
//
//

import Foundation
import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 2, dash: [10]))
                .foregroundColor(.blue)
                .frame(width: 111, height: 111)
                .overlay(alignment: .bottomTrailing) {
                    Image(systemName: "plus").font(Font.system(size: 30, weight: .bold)).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                }
                .overlay(alignment: .center) {
                    Text("Upload Photo Here").font(Font.system(size: 10, weight: .medium))
                }
            
            VStack {
                HStack {
                    Text("Nickname:")
                }
                HStack {
                    Text("Age:")
                }
                HStack {
                    Text("Gender")
                }
                HStack {
                    Text("Ideal Rental Area:")
                }
                HStack {
                    Text("Ideal Rental Price:")
                }
                HStack {
                    Text("Ideal Layout:")
                }
                HStack {
                    Text("Rest Time:")
                }
                HStack {
                    Text("Self Description:")
                }
                HStack {
                    Text("Hope Roommates Are:")
                }
            }
        }
    }
}
