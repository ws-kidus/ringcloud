import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ringcloud/app/core/widgets/app_button_wrapper.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "404",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 64,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Page not found",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 24),
            AppButtonWrapper(
              onPressed: () => context.go("/"),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 0.5),
                ),
                child: Text(
                  "Go back home",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
