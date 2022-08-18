class Urls {
  Urls._();

  static const url = "https://chat.johannes-jahn.com/";
  // static const url = "http://localhost:3000/";

  static const register = "${url}app/auth/register";
  static const login = "${url}app/auth/login";

  static const userList = "${url}app/user";

  static const createConversation = "${url}app/chat/create-conversation";
  static const getConversations = "${url}app/chat/get-conversations";
  static const sendMessage = "${url}app/chat/send-message";
  static const getMessages = "${url}app/chat/get-messages";
}
