import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:reddit_clone_ui/Screens/inbox_screen/widgets/message_tab_container.dart';
import 'package:reddit_clone_ui/Screens/inbox_screen/widgets/notification_tab_container.dart';




class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen>

with TickerProviderStateMixin {
  late final TabController _controller;
  @override

  void initState() {
    _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(headerSliverBuilder: (context, value) {
      return [
        SliverToBoxAdapter(
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 2.0,
                  offset: const Offset(1.0, 1.0),
                )
              ]
            ),
            child: SizedBox(
              width: 250,
              child: TabBar(
                  controller: _controller,
                  indicatorColor: Theme.of(context).colorScheme.secondary,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    const Tab(text:  "Notifications"),
                    Badge(
                      badgeContent: const Text(
                        "2",
                        style: TextStyle(

      ) ,),
                   badgeColor:Colors.red.shade600,
                   position: BadgePosition.topEnd(end: -40, top: 1),
                   child:const Tab(text: "Message"),
                    )
                  ]),
            ),
          ),
        )
      ];

    }  ,
    body: TabBarView(
        controller: _controller,
        children: const [NotificationTabContainer(), MessageTabContainer()]),
    );
  }
}
