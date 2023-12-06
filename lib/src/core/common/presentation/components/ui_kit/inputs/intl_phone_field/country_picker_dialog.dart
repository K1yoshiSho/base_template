import 'package:base/src/core/common/exports/main_export.dart';

import 'countries.dart';
import 'helpers.dart';

class PickerDialogStyle {
  final Color? backgroundColor;

  final TextStyle? countryCodeStyle;

  final TextStyle? countryNameStyle;

  final Widget? listTileDivider;

  final EdgeInsets? listTilePadding;

  final EdgeInsets? padding;

  final Color? searchFieldCursorColor;

  final InputDecoration? searchFieldInputDecoration;

  final EdgeInsets? searchFieldPadding;

  final double? width;

  final BoxDecoration? decoration;

  PickerDialogStyle({
    this.backgroundColor,
    this.countryCodeStyle,
    this.countryNameStyle,
    this.listTileDivider,
    this.listTilePadding,
    this.padding,
    this.searchFieldCursorColor,
    this.searchFieldInputDecoration,
    this.searchFieldPadding,
    this.width,
    this.decoration,
  });
}

class CountryPickerDialog extends StatefulWidget {
  final List<Country> countryList;
  final Country selectedCountry;
  final ValueChanged<Country> onCountryChanged;
  final String searchText;
  final List<Country> filteredCountries;
  final PickerDialogStyle? style;
  final String languageCode;

  const CountryPickerDialog({
    Key? key,
    required this.searchText,
    required this.languageCode,
    required this.countryList,
    required this.onCountryChanged,
    required this.selectedCountry,
    required this.filteredCountries,
    this.style,
  }) : super(key: key);

  @override
  State<CountryPickerDialog> createState() => _CountryPickerDialogState();
}

class _CountryPickerDialogState extends State<CountryPickerDialog> {
  late List<Country> _filteredCountries;
  late Country _selectedCountry;

  @override
  void initState() {
    _selectedCountry = widget.selectedCountry;
    _filteredCountries = widget.filteredCountries.toList()
      ..sort(
        (a, b) => a.localizedName(widget.languageCode).compareTo(b.localizedName(widget.languageCode)),
      );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final width = widget.style?.width ?? mediaWidth;
    const defaultHorizontalPadding = 40.0;
    const defaultVerticalPadding = 24.0;
    return Dialog(
      insetPadding: EdgeInsets.symmetric(
          vertical: defaultVerticalPadding,
          horizontal: mediaWidth > (width + defaultHorizontalPadding * 2) ? (mediaWidth - width) / 2 : defaultHorizontalPadding),
      backgroundColor: widget.style?.backgroundColor,
      child: Container(
        padding: widget.style?.padding ?? const EdgeInsets.all(10),
        decoration: widget.style?.decoration,
        child: Column(
          children: <Widget>[
            Padding(
              padding: widget.style?.searchFieldPadding ?? const EdgeInsets.all(0),
              child: TextField(
                cursorColor: widget.style?.searchFieldCursorColor,
                decoration: widget.style?.searchFieldInputDecoration ??
                    InputDecoration(
                      suffixIcon: const Icon(Icons.search),
                      labelText: widget.searchText,
                    ),
                onChanged: (value) {
                  _filteredCountries = widget.countryList.stringSearch(value)
                    ..sort(
                      (a, b) => a.localizedName(widget.languageCode).compareTo(b.localizedName(widget.languageCode)),
                    );
                  if (mounted) setState(() {});
                },
              ),
            ),
            const Gap(20),
            Visibility(
              visible: _filteredCountries.isNotEmpty,
              replacement: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  context.l10n.nothingFound,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: widget.style?.countryNameStyle ?? const TextStyle(fontWeight: FontWeight.w900),
                ),
              ),
              child: Expanded(
                child: ListView.builder(
                  // shrinkWrap: true,
                  itemCount: _filteredCountries.length,
                  itemBuilder: (ctx, index) => Column(
                    children: <Widget>[
                      Material(
                        color: Colors.transparent,
                        child: Ink(
                          child: ListTile(
                            leading: kIsWeb
                                ? Image.asset(
                                    'assets/flags/${_filteredCountries[index].code.toLowerCase()}.png',
                                    package: 'intl_phone_field',
                                    width: 32,
                                  )
                                : Text(
                                    _filteredCountries[index].flag,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                            contentPadding: widget.style?.listTilePadding,
                            title: Text(
                              _filteredCountries[index].localizedName(widget.languageCode),
                              style: widget.style?.countryNameStyle ?? const TextStyle(fontWeight: FontWeight.w900),
                            ),
                            trailing: Text(
                              '+${_filteredCountries[index].dialCode}',
                              style: widget.style?.countryCodeStyle ?? TextStyle(fontWeight: FontWeight.w900, color: context.theme.appColors.text),
                            ),
                            onTap: () {
                              _selectedCountry = _filteredCountries[index];
                              widget.onCountryChanged(_selectedCountry);
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ),
                      // widget.style?.listTileDivider ?? const Divider(thickness: 1),
                    ],
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
