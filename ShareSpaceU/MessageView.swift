import SwiftUI

struct ChatMessage: Identifiable {
    let id: UUID
    let text: String
    let isFromCurrentUser: Bool
}

struct Message: Identifiable {
    let id: UUID
    let senderName: String
    let messagePreview: String
    let avatar: String
    var chatMessages: [ChatMessage]
}

struct MessageView: View {
    @Environment(\.modelContext) private var context
    @State private var selectedMessage: Message?
    let messages = [
        Message(id: UUID(), senderName: "Justin", messagePreview: "Wow! That fits me as well!", avatar: "JustinAvatar", chatMessages: [
            ChatMessage(id: UUID(), text: "Hey, how are you?", isFromCurrentUser: false),
            ChatMessage(id: UUID(), text: "My name is Justin", isFromCurrentUser: false),
            ChatMessage(id: UUID(), text: "Hi, my name is Oski.", isFromCurrentUser: true),
            ChatMessage(id: UUID(), text: "Nice to meet you!", isFromCurrentUser: true),
            ChatMessage(id: UUID(), text: "What's your ideal price range?", isFromCurrentUser: false),
            ChatMessage(id: UUID(), text: "About 1k-1.5k.", isFromCurrentUser: true),
            ChatMessage(id: UUID(), text: "Wow! That fits me as well!", isFromCurrentUser: false),]
               ),
        Message(id: UUID(), senderName: "David", messagePreview: "Okay! Sounds great.", avatar: "DavidAvatar", chatMessages: [
            ChatMessage(id: UUID(), text: "This is David. I like your self description a lot.", isFromCurrentUser: false),
            ChatMessage(id: UUID(), text: "Hi, My name is Oski Bear! Nice to meet you.", isFromCurrentUser: true),
            ChatMessage(id: UUID(), text: "Mabye we can have a lunch together and discuss some details.", isFromCurrentUser: false),
            ChatMessage(id: UUID(), text: "Okay! Sounds great.", isFromCurrentUser: true),
            
            ]),
        Message(id: UUID(), senderName: "Kenny", messagePreview: "Well, this shouldn't be a problem, I'll consider about it and reply you ASAP.", avatar:"KennyAvatar", chatMessages: [
            ChatMessage(id: UUID(), text: "Hi!!!! My name is Kenny, from public Health.", isFromCurrentUser: false),
            ChatMessage(id: UUID(), text: "Hello, I'm Oski, from CS.", isFromCurrentUser: true),
            ChatMessage(id: UUID(), text: "I've noticed that the highest rental price you can accept is 1.2k, is it possible to be a little bit higher, like 1.3k?", isFromCurrentUser: true),
            ChatMessage(id: UUID(), text: "Well, this shouldn't be a problem, I'll consider about it and reply you ASAP.", isFromCurrentUser: false)
        ]),
        Message(id: UUID(), senderName: "Robert", messagePreview: "Hi, I am Robert, I think our requirements for the apartment are pretty similar.", avatar: "RobertAvatar", chatMessages: [ChatMessage(id: UUID(), text: "Hi, I am Robert, I think our requirements for the apartment are pretty similar.", isFromCurrentUser: false),]
               ),
        Message(id: UUID(), senderName: "Adam", messagePreview: "Yeah, that's right.", avatar: "AdamAvatar", chatMessages: [ChatMessage(id: UUID(), text: "Hi Oski, I am Adam, a junior year student looking for renting an apartment.", isFromCurrentUser: false), ChatMessage(id: UUID(), text: "Wait, I think we might attend the same course last semester!", isFromCurrentUser: true), ChatMessage(id: UUID(), text:"Oh! I remeber, we met in CS198 Game Design, right?", isFromCurrentUser: false),
            ChatMessage(id: UUID(), text: "Yeah, that's right.", isFromCurrentUser: true),]),
        Message(id: UUID(), senderName: "Lenny", messagePreview:"Thank your, I am fine! I am Oski.", avatar: "LennyAvatar", chatMessages: [ChatMessage(id: UUID(), text: "Hi, Lenny is here! How are you.", isFromCurrentUser: false),ChatMessage(id: UUID(), text: "Thank your, I am fine! I am Oski.", isFromCurrentUser: true),]),
    ] // currently we just hardcoded the senders and message, but hope to have better ideas in the future

    var body: some View {
        List(messages, id: \.id) { message in
            Button(action: {
                self.selectedMessage = message
            }) {
                HStack {
                    Image(message.avatar)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading) {
                        Text(message.senderName)
                            .font(.headline)
                            .foregroundColor(.black)
                            .opacity(0.9)
                        Text(message.messagePreview)
                            .font(.subheadline)
                            .foregroundColor(.black)
                            .opacity(0.5)
                    }
                }
                .padding(.vertical, 8)
            }
        }
        .sheet(item: $selectedMessage) { message in
            ConversationView(message: message)
            
        }
    }
}

struct ConversationView: View {
    let message: Message
    @State private var inputText: String = ""
    var body: some View {
        VStack{
            NavigationStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(message.chatMessages) { chatMessage in
                            HStack {
                                if chatMessage.isFromCurrentUser {
                                    Spacer()
                                    HStack{
                                        Text(chatMessage.text)
                                            .padding()
                                            .background(Color.blue)
                                            .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                                            .foregroundColor(.white)
                                            .frame(minWidth: 50, maxWidth: .infinity, alignment: .trailing)
                                        Image("OskiAvatar")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 40, height: 40)
                                            .clipShape(Circle())
                                    }
                                } else {
                                    HStack{
                                        Image(message.avatar)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 40, height: 40)
                                            .clipShape(Circle())
                                        Text(chatMessage.text)
                                            .padding()
                                            .background(Color.gray.opacity(0.2))
                                            .clipShape(Capsule())
                                            .foregroundColor(.black)
                                            .frame(minWidth: 50, maxWidth: .infinity, alignment: .leading)
                                        Spacer()
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                }
                .navigationTitle(message.senderName)
                }
            Spacer()
            HStack {
                TextField("Type a message...", text: $inputText)
                    .padding(10)
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(20)
                    .frame(minHeight: 44)
                }
                .padding(.horizontal)
            }
        }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
