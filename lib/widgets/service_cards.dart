import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konga_testapp/constants/colors.dart';

class ServiceCards extends StatelessWidget {
  final Function(String) onServiceTap;

  const ServiceCards({Key? key, required this.onServiceTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final services = [
      'BUY & POST',
      'CALL TO ORDER\n07080635700',
      'Konga\nMall',
      'EXCLUSIVE\nACCESS',
    ];
    final colors = [
      Colors.black,
      Colors.white,
      AppColors.primary,
      Colors.green,
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: constraints.maxWidth * 0.04,
          ),
          child: Row(
            children: List.generate(services.length, (index) {
              return Expanded(
                child: GestureDetector(
                  onTap: () => onServiceTap(services[index]),
                  child: Container(
                    margin: EdgeInsets.only(
                      right: index < services.length - 1 ? 8 : 0,
                    ),
                    height: constraints.maxWidth * 0.2,
                    decoration: BoxDecoration(
                      color: colors[index],
                      borderRadius: BorderRadius.circular(8),
                      border: colors[index] == Colors.white
                          ? Border.all(color: Colors.grey.shade300)
                          : null,
                    ),
                    child: Center(
                      child: Text(
                        services[index],
                        style: GoogleFonts.inter(
                          color: colors[index] == Colors.white
                              ? Colors.black
                              : Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: constraints.maxWidth * 0.025,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
