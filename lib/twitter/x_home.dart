import 'package:first_project/twitter/TweetsArticles.dart';
import 'package:first_project/twitter/constraints.dart';
import 'package:first_project/twitter/xbottomnavbar.dart';
import 'package:flutter/material.dart';
import 'tweet.dart';

class Xhome extends StatefulWidget {
  const Xhome({super.key});

  @override
  State<Xhome> createState() => _XhomeState();
}

class _XhomeState extends State<Xhome> {
  List<Tweetsarticles> tweetsmodel = [];
  bool isloading = true;
  @override
  void initState() {
    super.initState();
    fetchNews(); // Call the separate async method
  }

  // Separate async method to fetch news
  Future<void> fetchNews() async {
    tweetsmodel = await TweetServices().getweets();
    isloading = false;
    setState(() {}); // Update the state to refresh the UI
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Image.network(
            'https://logos-world.net/wp-content/uploads/2020/04/Twitter-Logo.png',
            width: 30,
            color: Colors.black,
            height: 30,
          ),
          centerTitle: true,
          leading: const Padding(
            padding: EdgeInsets.only(left: 5),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                'https://www.pngarts.com/files/3/Avatar-Transparent-Image.png',
              ),
            ),
          ),
          bottom: const TabBar(
            unselectedLabelColor:
                contentColor, // Make sure these are defined in constraints.dart
            indicatorColor: primaryColor,
            labelStyle: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            tabs: [
              Tab(text: "For you"),
              Tab(text: 'Following'),
              Tab(text: 'Subscribed'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.separated(
              separatorBuilder: (context, index) =>
                  const Divider(), // Improved separator
              itemCount: tweets.length, // Ensure tweets is a global variable
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(tweets[index].image),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  tweets[index].name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 7),
                                const Icon(Icons.verified,
                                    color: Colors.blue, size: 15),
                                const SizedBox(width: 7),
                                Text(
                                  "${tweets[index].username} - ${tweets[index].time}",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              tweets[index].tweet,
                              style: const TextStyle(fontSize: 14),
                            ),
                            tweets[index].image != ''
                                ? GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return Scaffold(
                                          body: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  child: Image.network(
                                                    tweetsmodel[index].image,
                                                  )),
                                            ),
                                          ),
                                        );
                                      }));
                                    },
                                    child: Container(
                                        height: 300,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                tweetsmodel[index].image),
                                            fit: BoxFit.cover,
                                          ),
                                        )),
                                  )
                                : Container(),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(Icons.reply_outlined,
                                    color: Colors.grey, size: 20),
                                const SizedBox(width: 5),
                                Text(tweets[index].shares.toString(),
                                    style: const TextStyle(color: Colors.grey)),
                                const SizedBox(width: 10),
                                const Icon(Icons.comment_outlined,
                                    color: Colors.grey, size: 20),
                                const SizedBox(width: 5),
                                Text(tweets[index].comments.toString(),
                                    style: const TextStyle(color: Colors.grey)),
                                const SizedBox(width: 10),
                                const Icon(Icons.favorite_border,
                                    color: Colors.grey, size: 20),
                                const SizedBox(width: 5),
                                Text(tweets[index].likes.toString(),
                                    style: const TextStyle(color: Colors.grey)),
                                const SizedBox(width: 10),
                                const Icon(Icons.analytics_outlined,
                                    color: Colors.grey, size: 20),
                                const SizedBox(width: 5),
                                Text(tweets[index].views.toString(),
                                    style: const TextStyle(color: Colors.grey)),
                              ],
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.more_horiz)),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.file_upload_outlined)),
                            ],
                          ))
                    ],
                  ),
                );
              },
            ),
            // Placeholder widgets for other tabs
            ListView.separated(
              separatorBuilder: (context, index) =>
                  const Divider(), // Improved separator
              itemCount: tweets.length, // Ensure tweets is a global variable
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(tweets[index].image),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  tweets[index].name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 7),
                                const Icon(Icons.verified,
                                    color: Colors.blue, size: 15),
                                const SizedBox(width: 7),
                                Text(
                                  "${tweets[index].username} - ${tweets[index].time}",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              tweets[index].tweet,
                              style: const TextStyle(fontSize: 14),
                            ),
                            tweets[index].image != ''
                                ? Container(
                                    height: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image:
                                            NetworkImage(tweets[index].image),
                                        fit: BoxFit.cover,
                                      ),
                                    ))
                                : Container(),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(Icons.reply_outlined,
                                    color: Colors.grey, size: 20),
                                const SizedBox(width: 5),
                                Text(tweets[index].shares.toString(),
                                    style: const TextStyle(color: Colors.grey)),
                                const SizedBox(width: 10),
                                const Icon(Icons.comment_outlined,
                                    color: Colors.grey, size: 20),
                                const SizedBox(width: 5),
                                Text(tweets[index].comments.toString(),
                                    style: const TextStyle(color: Colors.grey)),
                                const SizedBox(width: 10),
                                const Icon(Icons.favorite_border,
                                    color: Colors.grey, size: 20),
                                const SizedBox(width: 5),
                                Text(tweets[index].likes.toString(),
                                    style: const TextStyle(color: Colors.grey)),
                                const SizedBox(width: 10),
                                const Icon(Icons.analytics_outlined,
                                    color: Colors.grey, size: 20),
                                const SizedBox(width: 5),
                                Text(tweets[index].views.toString(),
                                    style: const TextStyle(color: Colors.grey)),
                              ],
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.more_horiz)),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.file_upload_outlined)),
                            ],
                          ))
                    ],
                  ),
                );
              },
            ),
            ListView.separated(
              separatorBuilder: (context, index) =>
                  const Divider(), // Improved separator
              itemCount: tweets.length, // Ensure tweets is a global variable
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(tweets[index].image),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  tweets[index].name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 7),
                                const Icon(Icons.verified,
                                    color: Colors.blue, size: 15),
                                const SizedBox(width: 7),
                                Text(
                                  "${tweets[index].username} - ${tweets[index].time}",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              tweets[index].tweet,
                              style: const TextStyle(fontSize: 14),
                            ),
                            tweets[index].image != ''
                                ? Container(
                                    height: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image:
                                            NetworkImage(tweets[index].image),
                                        fit: BoxFit.cover,
                                      ),
                                    ))
                                : Container(),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(Icons.reply_outlined,
                                    color: Colors.grey, size: 20),
                                const SizedBox(width: 5),
                                Text(tweets[index].shares.toString(),
                                    style: const TextStyle(color: Colors.grey)),
                                const SizedBox(width: 10),
                                const Icon(Icons.comment_outlined,
                                    color: Colors.grey, size: 20),
                                const SizedBox(width: 5),
                                Text(tweets[index].comments.toString(),
                                    style: const TextStyle(color: Colors.grey)),
                                const SizedBox(width: 10),
                                const Icon(Icons.favorite_border,
                                    color: Colors.grey, size: 20),
                                const SizedBox(width: 5),
                                Text(tweets[index].likes.toString(),
                                    style: const TextStyle(color: Colors.grey)),
                                const SizedBox(width: 10),
                                const Icon(Icons.analytics_outlined,
                                    color: Colors.grey, size: 20),
                                const SizedBox(width: 5),
                                Text(tweets[index].views.toString(),
                                    style: const TextStyle(color: Colors.grey)),
                              ],
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.more_horiz)),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.file_upload_outlined)),
                            ],
                          ))
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
