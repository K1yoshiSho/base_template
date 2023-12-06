import 'package:base/src/core/common/exports/main_export.dart';

class CustomBottomAppBarItem {
  CustomBottomAppBarItem({required this.iconData, required this.text, required this.index});
  IconData iconData;
  String text;
  int index;
}

class CustomBottomAppBar extends StatefulWidget {
  const CustomBottomAppBar({
    super.key,
    required this.items,
    required this.centerItemText,
    this.height = 60.0,
    this.iconSize = 24.0,
    required this.backgroundColor,
    required this.color,
    required this.selectedColor,
    // required this.notchedShape,
    required this.onTabSelected,
    required this.navigatorShell,
  });
  final List<CustomBottomAppBarItem> items;
  final String centerItemText;
  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color color;
  final Color selectedColor;
  // final NotchedShape notchedShape;
  final ValueChanged<int> onTabSelected;
  final StatefulNavigationShell navigatorShell;

  @override
  State<StatefulWidget> createState() => FABBottomAppBarState();
}

class FABBottomAppBarState extends State<CustomBottomAppBar> {
  _updateIndex(int index) {
    widget.onTabSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: sharedPreference.isDarkMode ? const Color.fromARGB(86, 29, 29, 29) : const Color.fromARGB(41, 144, 144, 144),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: widget.backgroundColor,
          items: items
              .map(
                (e) => BottomNavigationBarItem(icon: e, label: ""),
              )
              .toList(),
          // shape: widget.notchedShape,
          // color: widget.backgroundColor,
          // clipBehavior: Clip.antiAliasWithSaveLayer,
          // shadowColor: context.theme.appColors.divider,
          // surfaceTintColor: Colors.black.withOpacity(0),
          // elevation: 10,
          // // height: 60,
          // notchMargin: 10,
          // padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          // child: Row(
          //   mainAxisSize: MainAxisSize.max,
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: items,
          // ),
        ),
      ),
    );
  }

  Widget _buildTabItem({
    required CustomBottomAppBarItem item,
    required int index,
    required ValueChanged<int> onPressed,
  }) {
    Color color = widget.navigatorShell.currentIndex == item.index ? widget.selectedColor : widget.color;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          color: Colors.transparent,
          type: MaterialType.transparency,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () => onPressed(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  item.iconData,
                  color: color,
                  size: widget.iconSize,
                ),
                const Gap(6),
                AutoSizeText(
                  item.text,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.b3(context).copyWith(color: color, fontSize: 12),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
