import SwiftUI

struct Message: Identifiable {
    let id: UUID
    let senderName: String
    let messagePreview: String
    let avatar: String
}

struct MessageView: View {
    @Environment(\.modelContext) private var context
    @State private var selectedMessage: Message?
    let messages = [
        Message(id: UUID(), senderName: "Justin", messagePreview: "Hey, how are you?", avatar: "JustinAvatar"),
        Message(id: UUID(), senderName: "David", messagePreview: "Let's meet tomorrow.", avatar: "DavidAvatar"),
        Message(id: UUID(), senderName: "Kenny", messagePreview: "What's your ideal price range?", avatar:"KennyAvatar"),
        Message(id: UUID(), senderName: "Robert", messagePreview: "Really? I like your idea.", avatar: "RobertAvatar"),
        Message(id: UUID(), senderName: "Adam", messagePreview: "How about have a meeting this afternoon?", avatar: "AdamAvatar"),
        Message(id: UUID(), senderName: "Lenny", messagePreview:"OK bro, I got you.", avatar: "LennyAvatar"),
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
    var body: some View {
        NavigationStack {
            Text("Conversation with \(message.senderName)")
                .navigationTitle(message.senderName)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
