import 'package:flutter/material.dart';

class PaginationSection extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final Function(int) onPageChanged;

  const PaginationSection({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: currentPage > 1
              ? () {
                  onPageChanged(currentPage - 1);
                }
              : null,
        ),
        Text(
          'Page $currentPage of $totalPages',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        IconButton(
          icon: const Icon(Icons.chevron_right),
          onPressed: currentPage < totalPages
              ? () {
                  onPageChanged(currentPage + 1);
                }
              : null,
        ),
      ],
    );
  }
}

class PaginationCustomText extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final int minPage;
  final Text customText;
  final Function(int) onPageChanged;

  const PaginationCustomText({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
    required this.customText,
    required this.minPage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: currentPage > minPage
              ? () {
                  onPageChanged(currentPage - 1);
                }
              : null,
        ),
        customText,
        IconButton(
          icon: const Icon(Icons.chevron_right),
          onPressed: currentPage < totalPages
              ? () {
                  onPageChanged(currentPage + 1);
                }
              : null,
        ),
      ],
    );
  }
}
