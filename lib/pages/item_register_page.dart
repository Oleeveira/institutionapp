import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:institutionapp/components/custom_text_field.dart';
import 'package:institutionapp/controllers/product_registration_controller.dart';
import 'package:institutionapp/resources/text_styles.dart';

import '../components/rounded_background_component.dart';

class ItemRegisterPage extends StatelessWidget {
  ItemRegisterPage({Key? key}) : super(key: key);

  final ProductRegistrationController _controller =
      ProductRegistrationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Criar nova necessidade',
          style: TextStylesConstants.kformularyTitle,
        ),
        backgroundColor: Color.fromARGB(255, 3, 32, 106),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: RoundedBackgroundComponent(
        height: MediaQuery.of(context).size.height * 0.02,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DonationItemComponent(
                  productRegistrationController: _controller,
                ),
                Row(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DonationItemComponent extends StatelessWidget {
  final ProductRegistrationController productRegistrationController;

  const DonationItemComponent({
    Key? key,
    required this.productRegistrationController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        productRegistrationController.selectedValueCategory,
        productRegistrationController.itemQtdValue
      ]),
      builder: (_, __) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Nome do produto'),
            CustomTextField(
                type: TextInputType.name,
                controller: productRegistrationController.crtlItemName),
            const SizedBox(height: 20),
            const Text('Descrição'),
            CustomTextField(
                type: TextInputType.multiline,
                controller: productRegistrationController.crtlDesc),
            const SizedBox(height: 20),
            const Text('Categoria'),
            Row(
              children: [
                CustomDropDownButtonComponent(
                  selected:
                      productRegistrationController.selectedValueCategory.value,
                  items: productRegistrationController.category,
                  hint: 'Selecione uma opção',
                  onChanged: (item) =>
                      productRegistrationController.selectedItemCategory = item,
                ),
                const Text('Quantidade'),
                Flexible(
                  child: CustomTextField(
                    controller: productRegistrationController.crtlQtd,
                    type: TextInputType.number,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class CustomDropDownButtonComponent extends StatelessWidget {
  final String? selected;
  final List<String?> items;
  final String hint;
  final void Function(String?)? onChanged;

  const CustomDropDownButtonComponent({
    Key? key,
    required this.selected,
    required this.items,
    required this.onChanged,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String?>(
      value: selected,
      hint: Text(hint),
      items: items
          .map((item) => DropdownMenuItem<String?>(
                value: item,
                child: Text(
                  item!,
                  style: const TextStyle(fontSize: 24),
                ),
              ))
          .toList(),
      onChanged: onChanged,
    );
  }
}
