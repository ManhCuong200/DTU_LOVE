part of 'message_imports.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = HomeController.instance;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Appbar
            const THomeAppBar(iconSecurityActionAppbar: true),

            // New Matches
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  const TSectionHeading(title: TTexts.newMatches),
                  const SizedBox(height: TSizes.spaceBtwItems - 5),

                  // Card
                  Obx(
                    () {
                      if (controller.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (controller.allUsers.isEmpty) {
                        return const Text('No user found');
                      } else {
                        return SizedBox(
                          height: 160,
                          child: Row(
                            children: [
                              const NewMatchLikesCard(),
                              ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: controller.allUsers.length,
                                itemBuilder: (context, index) {
                                  final user = controller.allUsers[index];
                                  return GestureDetector(
                                    onTap: () => Get.to(
                                      () => ChatPage(
                                        imagePath: user.profilePictures[0],
                                        name: user.username,
                                        receiverID: user.id,
                                      ),
                                    ),
                                    child: TNewMatchUserCard(
                                      name: user.username,
                                      image: user.profilePictures[0],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          // New Likes Match Card
                          return const NewMatchLikesCard();
                        } else {
                          // User card
                          return const TNewMatchUserCard();
                        }
                      },
                    ),
                  )
                ],
              ),
            ),

            // Message
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: Column(
                children: [
                  // Title
                  const TSectionHeading(title: TTexts.message),
                  const SizedBox(height: TSizes.spaceBtwItems - 5),

                  // List Message
                  Obx(
                    () {
                      if (controller.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (controller.allUsers.isEmpty) {
                        return const Text('No user found');
                      } else {
                        return Column(
                          children: [
                            const TMessageCard(
                              imagePath: TImages.lightAppLogo,
                              name: 'Team DTU_LOVE',
                              message: 'Upgrade now to start matching...',
                              isVerify: true,
                              isNetworkImage: false,
                            ),
                            ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: 2,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final user = controller.allUsers[index];
                                return GestureDetector(
                                  onTap: () => Get.to(
                                    () => ChatPage(
                                      imagePath: user.profilePictures[0],
                                      name: user.username,
                                      receiverID: user.id,
                                    ),
                                  ),
                                  child: TMessageCard(
                                    imagePath: user.profilePictures[0],
                                    name: user.username,
                                    message: 'Hello',
                                  ),
                                );
                              },
                            )
                          ],
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return const TMessageCard(
                          imagePath: TImages.lightAppLogo,
                          name: 'DTU_LOVE',
                          message: 'Upgrade now to start matching...',
                          isVerify: true,
                        );
                      } else {
                        return const TMessageCard(
                          imagePath: TImages.girl,
                          name: 'Yogurt',
                          message: 'Hello',
                        );
                      }
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
