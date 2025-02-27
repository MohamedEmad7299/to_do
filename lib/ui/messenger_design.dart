
import 'package:flutter/material.dart';

class MessengerDesign extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(children: [
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 16, top: 16),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          'https://static1.srcdn.com/wordpress/wp-content/uploads/2021/12/League-of-Legends-Ekko-in-Arcane-Leading-the-Firelights.jpg?q=50&fit=crop&w=1140&h=&dpr=1.5',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(top: 16, start: 16),
                      child: Text(
                        "Chats",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Padding(
                      padding: EdgeInsetsDirectional.only(top: 16),
                      child: IconButton(
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.white24,
                          ),
                          onPressed: () {},
                          icon: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(top: 16, end: 16),
                      child: IconButton(
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.white24,
                          ),
                          onPressed: () {},
                          icon: Icon(
                            Icons.edit,
                            color: Colors.white,
                          )),
                    ),
                  ]),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      top: 24,
                      start: 16,
                      end: 16,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius:
                        BorderRadius.circular(20), // Add corner radius here
                      ),
                      width: double.infinity,
                      height: 40,
                      child: Row(
                        children: [
                          Padding(
                            padding:
                            EdgeInsetsDirectional.symmetric(horizontal: 16),
                            child: Icon(
                              Icons.search,
                            ),
                          ),
                          Text(
                            "Search",
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
                    height: 120,
                    child: ListView.separated(
                      itemBuilder: (context, index) => buildStoryItem(),
                      separatorBuilder: (context, index) => SizedBox(width: 16),
                      scrollDirection: Axis.horizontal,
                      itemCount: 7,
                    ),
                  ),
                  SizedBox(height: 24),
                  ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => buildChatItem(),
                    separatorBuilder: (context, index) => SizedBox(height: 16),
                    scrollDirection: Axis.vertical,
                    itemCount: 7,
                  )
                ],
              ),
            )
        ));
  }

  Widget buildChatItem() =>
      Row(
        children: [
          SizedBox(width: 20),
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
                'https://aimodelab.com/wp-content/uploads/2024/09/deepseek.webp'),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Mohamed E.Aboud",
                style: TextStyle(color: Colors.white),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8),
              Text(
                "Anything anywhere anytime all at once",
                style: TextStyle(color: Colors.white30),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      );

  Widget buildStoryItem() =>
      Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    'https://aimodelab.com/wp-content/uploads/2024/09/deepseek.webp'),
              ),
              CircleAvatar(
                radius: 7,
                backgroundColor: Colors.green,
              )
            ],
          ),
          Padding(
              padding: EdgeInsetsDirectional.only(top: 8),
              child: SizedBox(
                width: 60,
                child: Text(
                  "Mohamed E.Aboud",
                  style: TextStyle(color: Colors.white),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ))
        ],
      );
}
