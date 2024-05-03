//
//  ProfileView.swift
//  ShareSpaceU
//
//

import Foundation
import SwiftUI
import PhotosUI
import SwiftData

struct ProfileView: View {
    @Environment(\.modelContext) private var modelContext
    @StateObject var imagePicker = ImagePicker()
    private var frameSize: CGFloat = 222
    @State private var nickName: String = ""
    @State private var age: String = ""
    @State private var gender: String = ""
    @State private var idealRentalArea: String = ""
    @State private var idealRentalPrice: String = ""
    @State private var idealRentalLayout: String = ""
    @State private var restTime: String = ""
    @State private var selfDescription: String = ""
    @State private var hopeRoommatesAre: String = ""
    
    var body: some View {
        VStack {
            VStack {
                if let image = imagePicker.image {
                    VStack {
                        image
                            .resizable()
                            .clipShape(Circle())
                            .frame(width: frameSize, height: frameSize)
                        PhotosPicker(selection: $imagePicker.imageSelection) {
                            Text("Change Profile Picture").font(Font.system(size: 15, weight: .medium))
                        }
                        .padding(10)
                    }
                } else {
                    ZStack {
                        Circle()
                            .stroke(style: StrokeStyle(lineWidth: 2, dash: [10]))
                            .foregroundColor(.blue)
                            .frame(width: frameSize, height: frameSize)
                            .overlay(alignment: .bottomTrailing) {
                                PhotosPicker(selection: $imagePicker.imageSelection) {
                                    Image(systemName: "plus").font(Font.system(size: 30, weight: .bold)).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                }
                            }
                        Text("Upload Profile Picture Here").font(Font.system(size: 15, weight: .medium))
                    }
                }
            }
            .padding(30)
            
            
            VStack(spacing: 5) {
                
                HStack {
                    Text("Nickname:")
                    TextField("Nickname", text: $nickName)
                    Spacer()
                }
                HStack {
                    Text("Age:")
                    TextField("Age", text: $age)
                    Spacer()
                }
                HStack {
                    Text("Gender:")
                    TextField("Gender", text: $gender)
                    Spacer()
                }
                HStack {
                    Text("Ideal Rental Area:")
                    TextField("Ideal Rental Area", text: $idealRentalArea)
                    Spacer()
                }
                HStack {
                    Text("Ideal Rental Price:")
                    TextField("Ideal Rental Price", text: $idealRentalPrice)
                    Spacer()
                }
                HStack {
                    Text("Ideal Layout:")
                    TextField("Ideal Layout", text: $idealRentalLayout)
                    Spacer()
                }
                HStack {
                    Text("Rest Time:")
                    TextField("Rest Time", text: $restTime)
                    Spacer()
                }
                HStack {
                    Text("Self Description:")
                    TextField("Self Description", text: $selfDescription)
                    Spacer()
                }
                HStack {
                    Text("Hope Roommates Are:")
                    TextField("Hope Roommates Are", text: $hopeRoommatesAre)
                    Spacer()
                }
            }
//            .onAppear {
//                 loadProfile()
//            }
            .padding(.leading, 40)
            Button {
//                    let newUser = SSUser(image: "", nickName: nickName, age: Int(age) ?? 0, gender: gender, idealRentalArea: idealRentalArea, idealRentalPrice: Int(idealRentalPrice) ?? 0, idealRentalLayout: idealRentalLayout, restTime: restTime, selfDescription: selfDescription, hopeRoommatesAre: hopeRoommatesAre, acceptedUsers: [])
//                modelContext.insert(newUser)
//                do {
//                    try modelContext.save()
//                } catch {
//                    print(error.localizedDescription)
//                }
                
            } label: {
                Text("Save changes")
                    .frame(width: 140, height: 40)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 100, height: 10)))
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
//    func loadProfile() {
//        @Query var users: SSUser
//           do {
//               nickName = user.nickName
//               age = String(user.age)
//               
//           }
//       }
}



#Preview {
    ProfileView()
}

