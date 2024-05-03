//
//  HomeView.swift
//
//

import Foundation
import SwiftUI
import SwiftData


struct HomeView: View {
    @Environment(\.modelContext) private var modelContext
//    @Query var users: [SSUser]
    @State private var offset: CGFloat = 0
    @State private var index = 0
    @State private var shakeAmount: CGFloat = 10
    let spacing: CGFloat = 10
    let users = [
        SSUser(image: "OskiAvatar", nickName: "Oski", age: 19, gender: "M", idealRentalArea: "Northside Berkeley", idealRentalPrice: 1200, idealRentalLayout: "2Bd/1B", restTime: "11:00 pm", selfDescription: "Junior", hopeRoommatesAre: "Nice", acceptedUsers: []),
        SSUser(image: "JustinAvatar", nickName: "Justin", age: 19, gender: "M", idealRentalArea: "Berkeley", idealRentalPrice: 1200, idealRentalLayout: "2Bd/1B", restTime: "11:00 pm", selfDescription: "Sophomore", hopeRoommatesAre: "Kind", acceptedUsers: []),
        SSUser(image: "KennyAvatar",nickName: "Kenny", age: 19, gender: "M", idealRentalArea: "Southside Berkeley", idealRentalPrice: 1200, idealRentalLayout: "2Bd/1Ba", restTime: "11:00 pm", selfDescription: "Sophomore", hopeRoommatesAre: "Clean&organized", acceptedUsers: [])
        ]
   

    var body: some View {
            
            GeometryReader { geometry in
                VStack(spacing: 25) {
                    Spacer().frame(height: 15)
                    Text("Recommendations").font(.title2)
                ScrollView(.horizontal, showsIndicators: true) {
                            HStack() {
                            ForEach(users.indices, id: \.self) { index in
                                    CardView(user: users[index])
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
                                        if -value.predictedEndTranslation.width > geometry.size.width / 2, self.index < users.count - 1 {
                                            self.index += 1
                                        }
                                        if value.predictedEndTranslation.width > geometry.size.width / 2, self.index > 0 {
                                            self.index -= 1
                                        }
                                        withAnimation { self.offset = -(geometry.size.width + self.spacing) * CGFloat(self.index) }
                                    })
                            )
                HStack(spacing: 90){
                    Button {
                        if self.index < users.count - 1 {
                            self.index += 1
                            withAnimation { self.offset = -(geometry.size.width + self.spacing) * CGFloat(self.index) }
                        }
                        
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
                        if self.index < users.count - 1 {
                            self.index += 1
                            withAnimation { self.offset = -(geometry.size.width + self.spacing) * CGFloat(self.index) }
                        }
    //                    let newUser = users[self.index]
    //                    currentUser.acceptedUsers.append(newUser)
    //                    do {
    //                        try modelContext.save()
    //                    } catch {
    //                        print("Error saving context: \(error)")
    //                    }
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
                Spacer().frame(height: 2)
            
            }
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
                        Image(user.image)
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
    HomeView()
}

// TO DO:
// 1. add functionality with SwiftData
// 2. add two views: recommendations and pending requests
// Each user should have a list of accepted reccomendations ? -> add this attribute to SSUser class?

// buttons functionality: if x -> then show next card
// if yes -> add user to matches

