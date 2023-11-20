import 'package:flutter/material.dart';
import 'package:whatsapp/chat_details_screen.dart';
import 'package:whatsapp/model/contact.dart';
import 'package:whatsapp/widgets/contact_tile.dart';
import 'package:whatsapp/widgets/search_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<Contact> contactList = [
    Contact(
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYxsG3Ac8-CCLG3PzEvZXAfVoQxmjHleJqjg&usqp=CAU",
        name: "Sally Shaheen",
        desc: "desc 1",
        date: "10.00 PM"),
    Contact(
        image:
            "https://www.corporatephotographerslondon.com/wp-content/uploads/2021/06/non-smiling-LinkedIn-profile-photo.jpg",
        name: "Boss",
        desc: "desc 2",
        date: "1.00 PM"),
    Contact(
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6Hb5xzFZJCTW4cMqmPwsgfw-gILUV7QevvQ&usqp=CAU",
        name: "Sarah Alrefa3i",
        desc: "desc 3",
        date: "12.00 PM"),
    Contact(
        image:
            "https://townsquare.media/site/988/files/2021/05/RS20034_GettyImages-1041010664-scr.jpg?w=980&q=75=",
        name: "Grandma",
        desc: "desc 2",
        date: "1.00 PM"),
    Contact(
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREO17hg6KvLlweeZWN0LCEdi-OXM9qGpbQ9w&usqp=CAU",
        name: "Michel ",
        desc: "desc 2",
        date: "1.00 PM"),
    Contact(
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTc5zvih9QZ8u73YF5kfG_Zwbzchkdawq9zavMWAQdm88Of0V0oiVPpC7BOdqsfvydc6_8&usqp=CAU",
        name: "Michel ",
        desc: "desc 2",
        date: "1.00 PM"),
    Contact(
        image:
            "https://writestylesonline.com/wp-content/uploads/2019/01/What-To-Wear-For-Your-Professional-Profile-Picture-or-Headshot.jpg",
        name: "Michel ",
        desc: "desc 2",
        date: "1.00 PM"),
  ];
  ScrollController scrollController = ScrollController();
  double _scrollPosition = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: TextButton(
            child: const Text(
              "Edit",
              style: TextStyle(
                  color: Color.fromARGB(255, 43, 136, 212), fontSize: 18),
            ),
            onPressed: () {},
          ),
          title: const Text(
            "Chats",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.camera_alt_outlined),
              color: const Color.fromARGB(255, 43, 136, 212),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.add_circle_outline_sharp),
              color: const Color.fromARGB(255, 43, 136, 212),
              onPressed: () {},
            ),
          ]),
      body: Column(
        children: [
          _scrollPosition == 0 ? const SearchView() : Container(),
          const Divider(),
          Expanded(
            child: ListView.builder(
                itemCount: contactList.length,
                controller: scrollController,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: ContactTile(
                      contact: contactList[index],
                    ),
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) {
                        return const ChatDetailsScreen();
                      }));
                    },
                  );
                }),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.update_rounded),
          label: "Updates",
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.call_sharp),
          label: "Calls",
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: "Communities",
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: "Chats",
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: "Settings",
          backgroundColor: Colors.blue,
        ),
      ]),
    );
  }
}
