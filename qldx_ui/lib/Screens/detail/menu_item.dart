import 'package:flutter/material.dart';
import 'package:qldx_ui/Screens/home_screens/home_screens.dart';

class MenuItem extends StatefulWidget {
  const MenuItem({super.key, required this.title});
  final String title;

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  final bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 75),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Column(
          children: [
            InkWell(
              child: Text(
                widget.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isActive
                      ? Colors.deepPurple
                      : const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              onTap: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreens()),
                  );
                });
              },
            ),
            const SizedBox(
              height: 6,
            ),
            isActive
                ? Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
