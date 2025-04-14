part of 'widget_imports.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final inputFillColor = isDark ? Colors.white10 : Colors.grey.shade100;
    final borderColor = isDark ? Colors.white24 : Colors.grey.shade400;

    final inputDecorationTheme = InputDecorationTheme(
      filled: true,
      fillColor: inputFillColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: borderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: isDark ? TColors.white : TColors.primary, width: 1.5),
      ),
      labelStyle: TextStyle(color: isDark ? Colors.white70 : Colors.black87),
      prefixIconColor: isDark ? Colors.white54 : Colors.black54,
    );

    return Form(
      child: Theme(
        data: Theme.of(context).copyWith(inputDecorationTheme: inputDecorationTheme),
        child: Column(
          children: [
            // First Name & Last Name
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: TTexts.firstName,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                ),
                const SizedBox(width: TSizes.spaceBtwInputFields),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: TTexts.lastName,
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: TSizes.spaceBtwInputFields),

            // Username
            TextFormField(
              decoration: const InputDecoration(
                labelText: TTexts.username,
                prefixIcon: Icon(Iconsax.user_edit),
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwInputFields),

            // Email
            TextFormField(
              decoration: const InputDecoration(
                labelText: TTexts.email,
                prefixIcon: Icon(Iconsax.direct),
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwInputFields),

            // Phone Number
            TextFormField(
              decoration: const InputDecoration(
                labelText: TTexts.phoneNo,
                prefixIcon: Icon(Iconsax.call),
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwInputFields),

            // Password
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: TTexts.password,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwSections),

            // Terms & Conditions Checkbox
            const TTermsAndConditionCheckbox(),

            const SizedBox(height: TSizes.spaceBtwSections),

            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDark ? const Color.fromARGB(255, 196, 56, 56) : TColors.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {},
                child: const Text(
                  TTexts.createAccount,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
