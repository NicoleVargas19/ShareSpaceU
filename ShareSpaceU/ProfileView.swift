//
//  ProfileView.swift
//  ShareSpaceU
//
//

import Foundation
import SwiftUI
import PhotosUI

struct ProfileView: View {
    @Environment(\.modelContext) private var modelContext
    @StateObject var imagePicker = ImagePicker()
    private var frameSize: CGFloat = 222
    // @State var nickname: String
    // @State var age: Int
    // @State var hope: String
   
    
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
            
            
            VStack {
                
                HStack {
                    Text("Nickname:")
                    
                    // TextField("Enter your nickname", text: $nickname)
                    Spacer()
                }
                HStack {
                    Text("Age:")
                    Spacer()
                }
                HStack {
                    Text("Gender")
                    Spacer()
                }
                HStack {
                    Text("Ideal Rental Area:")
                    Spacer()
                }
                HStack {
                    Text("Ideal Rental Price:")
                    Spacer()
                }
                HStack {
                    Text("Ideal Layout:")
                    Spacer()
                }
                HStack {
                    Text("Rest Time:")
                    Spacer()
                }
                HStack {
                    Text("Self Description:")
                    Spacer()
                }
                HStack {
                    Text("Hope Roommates Are:")
                    // TextField("'Super nice and fun to be around'", text: $hope)
                    Spacer()
                }
            }
            .padding(.leading, 50)
           
        }
    }
}


#Preview {
    ProfileView()
}
