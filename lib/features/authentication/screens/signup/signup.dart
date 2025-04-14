// SignUpScreen.dart
part of 'signup_imports.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final bgColor = isDark ? const Color.fromARGB(255, 187, 199, 48) : const Color.fromARGB(255, 187, 199, 48);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: isDark ? Colors.white : const Color.fromARGB(255, 205, 10, 121),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              TTexts.signupTitle,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: isDark ? Colors.cyan : Colors.pink,
                    fontWeight: FontWeight.bold,
                  ),
            ),

            const SizedBox(height: TSizes.spaceBtwSections),

            // Form
            const TSignupForm(),

            const SizedBox(height: TSizes.spaceBtwSections),

            // Divider with updated text color
            Divider(
              color: isDark ? Colors.white70 : const Color.fromRGBO(167, 12, 64, 1),  // Thay thế bằng Divider
              thickness: 1,  // Bạn có thể điều chỉnh độ dày của Divider
            ),

            const SizedBox(height: TSizes.spaceBtwItems),

            // Social Buttons
            const TSocialButtons(),
          ],
        ),
      ),
    );
  }
}
