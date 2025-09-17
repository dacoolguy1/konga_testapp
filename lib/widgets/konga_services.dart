import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konga_testapp/constants/colors.dart';

class KongaServices extends StatelessWidget {
  final Function(String) onServiceTap;

  const KongaServices({Key? key, required this.onServiceTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topServices = [
      {'emoji': '🧳', 'title': 'TRAVEL'},
      {'emoji': '💳', 'title': 'KongaPay'},
      {'emoji': '🏪', 'title': 'Konga'},
      {'emoji': '📋', 'title': 'KongaList'},
    ];
    final bottomServices = [
      {'emoji': '🚚', 'title': 'LOGISTICS'},
      {'emoji': '🛒', 'title': 'GROCERIES'},
      {'emoji': '📺', 'title': 'KongaTV'},
      {'emoji': '⚡', 'title': 'kongaNOW'},
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        double serviceSize = constraints.maxWidth * 0.15;

        return Container(
          color: Colors.white,
          padding: EdgeInsets.all(constraints.maxWidth * 0.04),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: topServices
                    .map(
                      (service) => _buildKongaService(
                        context,
                        service,
                        serviceSize,
                        constraints,
                      ),
                    )
                    .toList(),
              ),
              SizedBox(height: constraints.maxWidth * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: bottomServices
                    .map(
                      (service) => _buildKongaService(
                        context,
                        service,
                        serviceSize,
                        constraints,
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildKongaService(
    BuildContext context,
    Map<String, String> service,
    double serviceSize,
    BoxConstraints constraints,
  ) {
    return GestureDetector(
      onTap: () => onServiceTap(service['title']!),
      child: Column(
        children: [
          Container(
            width: serviceSize,
            height: serviceSize,
            decoration: BoxDecoration(
              color: AppColors.surfaceColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                service['emoji']!,
                style: TextStyle(fontSize: serviceSize * 0.4),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            service['title']!,
            style: GoogleFonts.inter(
              fontSize: constraints.maxWidth * 0.022,
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
