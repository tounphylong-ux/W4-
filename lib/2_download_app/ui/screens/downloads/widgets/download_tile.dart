import 'package:flutter/material.dart';

import 'download_controler.dart';

class DownloadTile extends StatelessWidget {
  const DownloadTile({super.key, required this.controller});

  final DownloadController controller;

  @override
  Widget build(BuildContext context) {
    // TODO
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.green[50],
            borderRadius: BorderRadius.circular(12),
          ),
          child: _buildContent(),
        );
      },
    );
  }

  Widget _buildContent() {
    Icon statusIcon;
    switch (controller.status) {
      case DownloadStatus.notDownloaded:
        statusIcon = const Icon(Icons.download, color: Colors.black54);
        break;
      case DownloadStatus.downloading:
        statusIcon = const Icon(Icons.downloading, color: Colors.black87);
        break;
      case DownloadStatus.downloaded:
        statusIcon = const Icon(Icons.folder, color: Colors.black87);
        break;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(controller.ressource.name),
            IconButton(
              icon: statusIcon,
              onPressed: controller.status == DownloadStatus.notDownloaded
                  ? controller.startDownload
                  : null,
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          "${(controller.progress * 100).toStringAsFixed(1)}% completed - "
          "${(controller.ressource.size * controller.progress).toStringAsFixed(1)} of ${controller.ressource.size} MB",
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
      ],
    );
  }
}
