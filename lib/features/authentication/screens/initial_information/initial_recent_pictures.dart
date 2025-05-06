part of 'initial_information_imports.dart';

class InitialRecentPicturePage extends StatelessWidget {
  const InitialRecentPicturePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = InitialInformationController.instance;
    return Scaffold(
      appBar: const TAppbar(showBackArrow: true),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              TTexts.titleRecentPicture,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            // SubTitle
            Text(TTexts.subTitleRecentPicture, style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: TSizes.spaceBtwSections),

<<<<<<< HEAD
            const TInitialProFilePhoto(),
=======
            const TProFilePhoto(),
>>>>>>> 0ef12e2 (chức năng lấy và sửa thông tin cá nhân khi mới tạo tài khoản)

            const Spacer(),

            // Button Next
            TBottomButton(
<<<<<<< HEAD
              onPressed: () async {
                if (controller.newPhotos.isEmpty || controller.newPhotos.length < 2) {
                  TLoaders.errorSnackBar(
                    title: 'Oh Snap!',
                    message: 'Please upload at least two photo!',
                  );
                  return;
                }

                await controller.saveImages();
                controller.updateInitialInformation();
              },
=======
              onPressed: controller.updateInitialInformation,
>>>>>>> 0ef12e2 (chức năng lấy và sửa thông tin cá nhân khi mới tạo tài khoản)
              textButton: 'Next',
            )
          ],
        ),
      ),
    );
  }
}
