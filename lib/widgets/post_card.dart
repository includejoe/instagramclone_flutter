import "package:flutter/material.dart";
import "package:instagram_clone/utils/colors.dart";

class PostCard extends StatelessWidget {
  const PostCard({Key? key}) : super(key: key);
  final defaultNetworkImage = "https://mir-s3-cdn-cf.behance.net/projects/404/fa1a1e115357173.Y3JvcCwxMzgwLDEwODAsMjcwLDA.png";
  final defaultUsername = "erenyeager";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mobileBgColor,
      padding: const EdgeInsets.symmetric(
        vertical: 10
      ),
      child: Column(
        children: <Widget>[
          // HEADER SECTION
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 16
            ).copyWith(right: 0),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(defaultNetworkImage),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          defaultUsername,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                ),
                IconButton(
                  onPressed: () {
                    showDialog(context: context, builder: (context) => Dialog(
                      child: ListView(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shrinkWrap: true,
                        children: [
                          "Delete"
                        ].map((e) => InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 16
                            ),
                            child: Text(e),
                          ),
                        )).toList(),
                      ),
                    ));
                  },
                  icon: const Icon(Icons.more_vert)
                )
              ],
            ),
          ),

          // IMAGE SECTION
          SizedBox(
            height: MediaQuery.of(context).size.height*0.4,
            width: double.infinity,
            child: Image.network(
              defaultNetworkImage,
              fit: BoxFit.cover,
            )
          ),
          
          // ACTIONS SECTION
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.comment_outlined,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.send,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.bookmark_border,
                    ),
                  ),
              ))
            ],
          ),

          // DETAILS SECTION
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle(
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w800
                  ),
                  child: Text(
                    "123,032 likes",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                    top: 8
                  ),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        color: Colors.white
                      ),
                      children: [
                        TextSpan(
                          text: defaultUsername,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold
                          )
                        ),

                        const TextSpan(text: " ",),

                        const TextSpan(
                            text: "It's jinarashi time baby",
                        ),
                      ]
                    ),
                  ),
                ),

                InkWell(
                  onTap: () {},
                  child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 4
                  ),
                  child: const Text(
                    "View all 200 comments",
                    style: TextStyle(
                        fontSize: 16,
                        color: secondaryColor
                    ),
                  ),
                ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 4
                  ),
                  child: const Text(
                    "21/03/21",
                    style: TextStyle(
                        fontSize: 16,
                        color: secondaryColor
                    ),
                  ),
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}
