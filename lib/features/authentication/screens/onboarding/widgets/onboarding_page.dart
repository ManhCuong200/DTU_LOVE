part of 'widget_imports.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);
    final screenWidth = THelperFunctions.screenWidth();
    final screenHeight = THelperFunctions.screenHeight();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace,
          vertical: TSizes.spaceBtwSections,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image with shadow effect
            Container(
              width: screenWidth * 0.85,
              height: screenHeight * 0.55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 12,
                    offset: const Offset(0, 8),
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwItems * 1.5),

            // Title
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black87,
                  ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: TSizes.spaceBtwItems),

            // Subtitle
            Text(
              subTitle,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: isDarkMode ? Colors.white70 : Colors.black54,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
