import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

final tabs = [
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "LIVE",
  "Shopping",
  "Brands",
];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({
    super.key,
    required this.onTap,
  });

  final Function onTap;

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _textEditingController = TextEditingController();

  late final TabController _tabController;

  String searchText = "";

  bool _isWriting = false;

  @override
  void initState() {
    super.initState();

    _textEditingController.addListener(() {
      setState(() {
        searchText = _textEditingController.text;
        if (searchText.isNotEmpty) {
          _isWriting = true;
        } else {
          _isWriting = false;
        }
      });
    });

    _tabController = TabController(
      length: tabs.length,
      vsync: this,
    );

    // tab 이동 시에 키보드가 보이는 경우에 unfocus 처리
    _tabController.addListener(() {
      FocusScope.of(context).unfocus();
    });
  }

  void _deleteAll() {
    _textEditingController.clear();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  // 뒤로가기 누를 시 Home 으로 이동
  void _onBackRoute() {
    widget.onTap(0);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 1,
          title: Row(
            children: [
              GestureDetector(
                onTap: _onBackRoute,
                child: const FaIcon(
                  FontAwesomeIcons.chevronLeft,
                  size: Sizes.size20,
                ),
              ),
              Gaps.h14,
              Expanded(
                child: SizedBox(
                  height: Sizes.size36,
                  child: TextField(
                    controller: _textEditingController,
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                      prefixIcon: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          FaIcon(
                            FontAwesomeIcons.magnifyingGlass,
                            color: Colors.black,
                            size: Sizes.size16,
                          ),
                        ],
                      ),
                      hintText: "Search",
                      hintStyle: const TextStyle(
                        fontSize: Sizes.size14,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Sizes.size6),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(
                          right: Sizes.size8,
                        ),
                        child: Opacity(
                          opacity: _isWriting ? 1 : 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: _deleteAll,
                                child: const FaIcon(
                                  FontAwesomeIcons.circleXmark,
                                  size: Sizes.size16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    textAlignVertical: TextAlignVertical.bottom,
                  ),
                ),
              ),
              Gaps.h14,
              const FaIcon(
                FontAwesomeIcons.sliders,
                size: Sizes.size20,
              ),
            ],
          ),
          bottom: TabBar(
            controller: _tabController,
            splashFactory: NoSplash.splashFactory,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size16,
            ),
            isScrollable: true,
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Sizes.size16,
            ),
            unselectedLabelColor: Colors.grey.shade500,
            tabs: [
              for (var tab in tabs)
                Tab(
                  text: tab,
                ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            GridView.builder(
              // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag
              // 키보드가 열려있을 때 드래그를 하면 숨겨주게하는 옵션
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.all(Sizes.size6),
              itemCount: 20,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: Sizes.size10,
                mainAxisSpacing: Sizes.size10,
                childAspectRatio: 9 / 20,
              ),
              itemBuilder: (context, index) => Column(
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Sizes.size4),
                    ),
                    child: AspectRatio(
                      aspectRatio: 9 / 16,
                      child: FadeInImage.assetNetwork(
                          fit: BoxFit.cover,
                          placeholder: "assets/images/placeholder.jpg",
                          image:
                              "https://images.unsplash.com/photo-1598373182133-52452f7691ef?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2340&q=80"),
                    ),
                  ),
                  Gaps.v10,
                  const Text(
                    "This is very long caption for my tiktok that im upload just now currently.",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: Sizes.size18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v5,
                  DefaultTextStyle(
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w600,
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: Sizes.size12,
                          backgroundImage: NetworkImage(
                              "https://avatars.githubusercontent.com/u/45170847?v=4"),
                        ),
                        Gaps.h4,
                        const Expanded(
                          child: Text(
                            "My avatar is going to be very long",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Gaps.h4,
                        FaIcon(
                          FontAwesomeIcons.heart,
                          size: Sizes.size16,
                          color: Colors.grey.shade600,
                        ),
                        Gaps.h2,
                        const Text(
                          "2.5M",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            for (var tab in tabs.skip(1))
              Center(
                child: Text(
                  tab,
                  style: const TextStyle(
                    fontSize: Sizes.size28,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
