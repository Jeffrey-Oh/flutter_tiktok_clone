import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/users/widgets/user_info.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final bool isOfficialUser = false;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: const Text('제프리'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const FaIcon(
                FontAwesomeIcons.gear,
                size: Sizes.size20,
              ),
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                foregroundColor: Colors.blue,
                foregroundImage: NetworkImage(
                    "https://avatars.githubusercontent.com/u/45170847?v=4"),
                child: Text("제프리"),
              ),
              Gaps.v20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "@제프리",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: Sizes.size14,
                    ),
                  ),
                  if (isOfficialUser) Gaps.h5,
                  if (isOfficialUser)
                    FaIcon(
                      FontAwesomeIcons.solidCircleCheck,
                      size: Sizes.size16,
                      color: Colors.blue.shade300,
                    ),
                ],
              ),
              Gaps.v24,
              SizedBox(
                height: Sizes.size48,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const UserInfo(count: "97", title: "Following"),
                    VerticalDivider(
                      width: Sizes.size32,
                      thickness: Sizes.size1,
                      color: Colors.grey.shade400,
                      indent: Sizes.size14,
                      endIndent: Sizes.size14,
                    ),
                    const UserInfo(count: "10M", title: "Followers"),
                    VerticalDivider(
                      width: Sizes.size32,
                      thickness: Sizes.size1,
                      color: Colors.grey.shade400,
                      indent: Sizes.size14,
                      endIndent: Sizes.size14,
                    ),
                    const UserInfo(count: "194.3M", title: "Likes"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
