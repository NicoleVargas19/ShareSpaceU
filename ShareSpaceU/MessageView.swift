import SwiftUI

struct Message: Identifiable {
    let id: UUID
    let senderName: String
    let messagePreview: String
//    let avatar: String
}

struct MessageView: View {
    @State private var selectedMessage: Message?
    let messages = [
        Message(id: UUID(), senderName: "Justin", messagePreview: "Hey, how are you?"),
        Message(id: UUID(), senderName: "David", messagePreview: "Let's meet tomorrow."),
        Message(id: UUID(), senderName: "Kenny", messagePreview: "What's your ideal price range?"),
        Message(id: UUID(), senderName: "Robert", messagePreview: "Really? I like your idea."),
        Message(id: UUID(), senderName: "Adam", messagePreview: "How about have a meeting this afternoon?"),
        Message(id: UUID(), senderName: "Lenny", messagePreview:"OK bro, I got you."),
    ] // currently we just hardcoded the senders and message, but hope to have better ideas in the future

    var body: some View {
        List(messages, id: \.id) { message in
            Button(action: {
                self.selectedMessage = message
            }) {
                HStack {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.black)
                        .opacity(0.7)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading) {
                        Text(message.senderName)
                            .font(.headline)
                            .foregroundColor(.black)
                            .opacity(0.6)
                        Text(message.messagePreview)
                            .font(.subheadline)
                            .foregroundColor(.black)
                            .opacity(0.5)
                    }
                }
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
