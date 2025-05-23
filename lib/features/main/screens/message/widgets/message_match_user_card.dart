import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:DTU_LOVE/utils/constants/sizes.dart';

import '../../../../../common/widgets/loaders/shimmer.dart';

class TNewMatchUserCard extends StatelessWidget {
  const TNewMatchUserCard({
    super.key,
    required this.name,
    required this.image,
  });

  final String name;
  final String image;
import 'package:flutter/material.dart';
import 'package:DTU_LOVE/utils/constants/image_strings.dart';
import 'package:DTU_LOVE/utils/constants/sizes.dart';

class TNewMatchUserCard extends StatelessWidget {
  const TNewMatchUserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: TSizes.iconXs),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(TSizes.borderRadiusSm),
            child: CachedNetworkImage(
              imageUrl: image,
              width: 110,
              height: 120,
              fit: BoxFit.cover,
              placeholder: (context, url) => const TShimmerEffect(
                width: 110,
                height: 120,
                radius: TSizes.borderRadiusSm,
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red),
            child: Image.asset(
              TImages.girl,
              width: 110,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: TSizes.xs),
          Text(
            name,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w600),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            'Yogurt',
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

}
}
