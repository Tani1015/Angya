import 'package:angya/extensions/context_extension.dart';
import 'package:angya/gen/assets.gen.dart';
import 'package:angya/model/entities/sample/user/user.dart';
import 'package:angya/model/use_cases/sample/item_controller.dart';
import 'package:angya/model/use_cases/sample/my_profile.dart';
import 'package:angya/presentation/custom_hooks/use_effect_once.dart';
import 'package:angya/presentation/pages/sample/user/user_edit_page.dart';
import 'package:angya/presentation/widgets/thumbnail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserPage extends HookConsumerWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(fetchMyProfileProvider);
    final items = ref.watch(itemProvider);
    final scrollController = useScrollController();

    useEffectOnce(() {
      Future(() async {
        final result = await ref.watch(itemProvider.notifier).fetch();
        result.when(
          success: () {},
          failure: (e) {},
        );
      });
      return null;
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: SizedBox(
          height: context.height * 0.1,
          width: context.width * 0.3,
          child: Assets.images.icon.image(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            highlightColor: Colors.white,
            splashColor: Colors.white,
            color: Colors.black,
            onPressed: () {
              UserEditPage.show(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileTile(profile.value),
              SizedBox(
                height: context.height * 0.02,
              ),
              items.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.only(top: 100),
                      child: Center(
                        child: Text('場所を追加してください'),
                      ),
                    )
                  : ListView.builder(
                      controller: scrollController,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        final data = items[index];
                        return Card(
                          color: Colors.grey.shade200,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Thumbnail(
                                  height: context.height * 0.4,
                                  width: context.width * 0.9,
                                  url: data.imageUrl?.url,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: ListTile(
                                  title: Text(data.title!),
                                  subtitle: Text(data.address!),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: items.length,
                    )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile(this.user, {super.key});

  final User? user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleThumbnail(
                size: 90,
                url: user?.image?.url,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                user?.name ?? '-',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
