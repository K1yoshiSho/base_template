import 'package:base/src/core/common/exports/main_export.dart';
import 'package:base/src/core/resource/domain/models/city.dart';

class ChooseCityDialog extends StatefulWidget {
  final List<CityModel> cities;

  const ChooseCityDialog({Key? key, required this.cities}) : super(key: key);

  static Future<CityModel?> show({
    required BuildContext context,
    required List<CityModel> cities,
    CityModel? currentCity,
  }) {
    return showDialog(
      context: context,
      barrierColor: AppPalette.white.withOpacity(0.3),
      builder: (context) {
        return ChooseCityDialog(cities: cities);
      },
    );
  }

  @override
  State<ChooseCityDialog> createState() => _ChooseCityDialogState();
}

class _ChooseCityDialogState extends State<ChooseCityDialog> {
  CityModel? selectedCity;

  @override
  Widget build(BuildContext context) {
    final fullWidth = MediaQuery.of(context).size.width;
    final width = fullWidth - 32;

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      insetPadding: const EdgeInsets.all(16),
      contentPadding: const EdgeInsets.all(16),
      backgroundColor: AppPalette.black,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 1,
      content: SizedBox(
        width: width,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitleDialog(),
                  const Gap(24),
                  _buildCitiesList(),
                  const Gap(70),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _buildChooseButton(),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTitleDialog() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppLocalizations.of(context)!.choose_your_city,
          style: AppTextStyle.h2(context),
        ),
        InkWell(
          onTap: () => Navigator.pop(context),
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 2, color: AppPalette.white),
            ),
            child: const Icon(
              Icons.close,
              color: AppPalette.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCitiesList() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: List.generate(
        widget.cities.length,
        (index) {
          final city = widget.cities[index];

          return _buildCityItem(city);
        },
      ),
    );
  }

  Widget _buildCityItem(CityModel city) {
    final isSelected = selectedCity?.id == city.id;

    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        setState(() {
          selectedCity = city;
        });
      },
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: AppPalette.white, width: 0.5),
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? AppPalette.white : null,
        ),
        child: Text(
          city.name,
          style: AppTextStyle.h4(context).copyWith(
            color: isSelected ? AppPalette.black : AppPalette.white,
          ),
        ),
      ),
    );
  }

  Widget _buildChooseButton() {
    return AppButton(
      onPressed: () => Navigator.pop(context, selectedCity),
      isDisabled: selectedCity == null,
      text: AppLocalizations.of(context)!.select,
    );
  }
}
