class Message {
  final String? message;

  final String userId;
  final String? userEmail;
  final String? userPassword;

  Message({
    required this.message,
    required this.userId,
    required this.userEmail,
    required this.userPassword,
  });

  factory Message.fromjson(jsondata) {
    return Message(
      message: jsondata['message'],
      userId: jsondata['userId'],
      userEmail: jsondata['userEmail'],
      userPassword: jsondata['userPassword'],
    );
  }
}
