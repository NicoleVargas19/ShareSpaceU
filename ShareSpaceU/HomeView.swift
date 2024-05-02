//
//  HomeView.swift
//
//

import Foundation
import SwiftUI
import SwiftUI

class UserViewModel: ObservableObject {
    @Published var users: [SSUser]
    @Published var acceptedUsers: [SSUser] = []
    @Published var rejectedUsers: [SSUser] = []
    
    init(users: [SSUser]) {
        self.users = users
    }
    
    func acceptUser(at index: Int) {
        if index < users.count {
            acceptedUsers.append(users[index])
        }
    }
    
    func rejectUser(at index: Int) {
        if index < users.count {
            rejectedUsers.append(users[index])
        }
    }
}


struct HomeView: View {
    @State var fanCards: Bool = false
    @State var cardSelected = false
    @State var tappedIndex: Int = 0
    @Namespace var cardAnimation
    @State private var offset: CGFloat = 0
    @State private var index = 0
    let spacing: CGFloat = 10
    @ObservedObject var viewModel: UserViewModel

    
    var body: some View {
        VStack(spacing: 40) {
            Spacer().frame(height: 20)
            GeometryReader { geometry in
                ScrollView(.horizontal, showsIndicators: true) {
                            HStack() {
                            ForEach(self.viewModel.users.indices, id: \.self) { index in
                                    CardView(user: self.viewModel.users[index])
                                    .frame(width: geometry.size.width)
                                }
                            }
                        }
                .content.offset(x: self.offset)
                            .frame(width: geometry.size.width, alignment: .leading)
                            .gesture(
                                DragGesture()
                                    .onChanged({ value in
                                        self.offset = value.translation.width - geometry.size.width * CGFloat(self.index)
                                    })
                                    .onEnded({ value in
                                        if -value.predictedEndTranslation.width > geometry.size.width / 2, self.index < self.viewModel.users.count - 1 {
                                            self.index += 1
                                        }
                                        if value.predictedEndTranslation.width > geometry.size.width / 2, self.index > 0 {
                                            self.index -= 1
                                        }
                                        withAnimation { self.offset = -(geometry.size.width + self.spacing) * CGFloat(self.index) }
                                    })
                            )
            }
            HStack(spacing: 80){
                Button {
                    self.viewModel.rejectUser(at: self.index)
                } label: {
                    Image(systemName: "x.circle")
                        .resizable()
                        .frame(width: 65, height: 65)
                        .foregroundColor(.white)
                        .background(Color.red)
                        .clipShape(Circle())
                }
                .buttonStyle(PlainButtonStyle())
                Button {
                    self.viewModel.acceptUser(at: self.index)
                } label: {
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .foregroundColor(.green)
                        .background(Color.white)
                        .clipShape(Circle())
                }
                .buttonStyle(PlainButtonStyle())
            }
            Spacer().frame(height: 0.5)
        
        }
       
        
               
    }
    
    struct CardView: View {
        var user: SSUser
        var body: some View {
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: 300, height: 450)
                .foregroundStyle(.white)
                .overlay(
                       RoundedRectangle(cornerRadius: 16)
                           .stroke(.black, lineWidth: 2)
                   )
                .shadow(radius: 10)
                .overlay {
                    VStack{
                        Spacer()
                        Image("OskiAvatar")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                        Spacer()
                        Text("Nickname: \(user.nickName)")
                        Text("Age: \(user.age)")
                        Text("Ideal Rental Area: \(user.idealRentalArea)")
                        Text("Ideal Rental Price: \(user.idealRentalPrice)")
                        Text("Ideal Rental Layout: \(user.idealRentalLayout)")
                        Text("Rest Time: \(user.restTime)")
                        Text("Self Description: \(user.selfDescription)")
                        Text("Hope roomates are: \(user.hopeRoommatesAre)")
                        Spacer()
                    }
                        .foregroundStyle(.black)
                        .font(.subheadline)
                }
        }
    }
}


#Preview {
    HomeView(viewModel: UserViewModel(users: [
               SSUser(nickName: "Oski", age: 19, gender: "M", idealRentalArea: "Northside Berkeley", idealRentalPrice: 1200, idealRentalLayout: "2Bd/1Ba", restTime: "11:00 pm", selfDescription: "Junior", hopeRoommatesAre: "Nice"),
               SSUser(nickName: "Bear", age: 19, gender: "M", idealRentalArea: "Northside Berkeley", idealRentalPrice: 1200, idealRentalLayout: "2Bd/1Ba", restTime: "11:00 pm", selfDescription: "Sophmore", hopeRoommatesAre: "kind")
           ]))
}

// TO DO:
// 1. add functionality with SwiftData
// 2. add two views: recommendations and pending requests
// Each user should have a list of accepted reccomendations ? -> add this attribute to SSUser class?

