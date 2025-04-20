# 🤖 YesNoApp

YesNoApp is a simple **chat-like** Flutter application that interacts with a bot. Users can ask a question, and the bot responds with a random image showing either "Yes" or "No."

## 📱 Features

- 💬 **Chat Interface**: A simple and clean chat interface where users can type their questions.
- ✅ **Yes/No Response**: The bot responds with an image that says either "Yes" or "No."
- 🎲 **Randomized Responses**: Each time you ask a question, the bot randomly generates one of two responses.

## 🧭 Screens

- **Chat Screen**:
  - The user types a question into a text input field.
  - After sending the question, the bot replies with an image saying "Yes" or "No."
  
## 🛠 Architecture Overview

The app uses a simple architecture, focusing on the **UI** and **state management** to simulate a chat interface.

### Main Layers:

1. **UI Layer**: Contains all the widgets, including the chat input field, message bubbles, and response display.
2. **Bot Response Logic**: The bot selects a random response ("Yes" or "No") and fetches the corresponding image.
