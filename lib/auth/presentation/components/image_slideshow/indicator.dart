part of 'image_slideshow.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    required this.count,
    required this.currentIndex,
    required this.padding,
    required this.height,
    required this.width,
    this.activeColor,
    this.inactiveColor,
    super.key,
  });

  final int count;
  final int currentIndex;
  final Color? activeColor;
  final Color? inactiveColor;
  final double padding;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: padding,
      runSpacing: padding,
      alignment: WrapAlignment.center,
      children: List.generate(
        count,
        (index) {
          return Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: currentIndex == index ? activeColor : inactiveColor,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
          );
        },
      ),
    );
  }
}
