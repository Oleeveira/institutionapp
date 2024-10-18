import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:institutionapp/components/custom_text_field.dart';
import 'package:institutionapp/controllers/product_registration_controller.dart';
import 'package:institutionapp/resources/text_styles.dart';

import '../components/rounded_background_component.dart';

class ItemRegisterPage extends StatefulWidget {
  const ItemRegisterPage({super.key});

  @override
  State<ItemRegisterPage> createState() => _ItemRegisterPageState();
}

class _ItemRegisterPageState extends State<ItemRegisterPage> {

  final TextEditingController nameController = TextEditingController();

  final TextEditingController qtdController = TextEditingController();

  final TextEditingController categoryController = TextEditingController();

  final TextEditingController descController = TextEditingController();



  /*Future createItem() async {
    if (_formKey.currentState!.validate()) {
      final newItem = FirebaseFirestore.instance.collection('items');
      final currentUser = FirebaseAuth.instance.currentUser;

      final item = Item(
          id: newItem.id,
          nome: nameController.text,
          descricao: descController.text,
          quantidade: qtdController.text,
          categoria: categoryController.text,
          usuarioId: currentUser!.uid,
          statusDoacaoId: 1,
          dataDeCadastro: DateTime.now());

          final json = item.toJson();

          await newItem.get(json);
    }
  }*/

  /*Future signItem() async{
    FirebaseFirestore.instance
    .collection('itens')
    .where("userId", isEqualTo: user?uid)
    .get()
    .then((ds){
      ds.docs.forEach((data){
        var tempList = {
          'name' = nameController.text
        };
      }
      )
    }
    
    )
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).go('/bar_state');
          },
        ),
        title: const Text(
          'Criar nova necessidade',
          style: TextStylesConstants.kformularyTitle,
        ),
        backgroundColor: const Color.fromARGB(255, 3, 32, 106),
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
                DonationItemComponent(),
                const Row(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DonationItemComponent extends StatefulWidget {
  @override
  State<DonationItemComponent> createState() => _DonationItemComponentState();
}

class _DonationItemComponentState extends State<DonationItemComponent> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController qtdController = TextEditingController();

  TextEditingController categoryController = TextEditingController();

  final TextEditingController descController = TextEditingController();

  final ProductRegistrationController productRegistrationController =
      ProductRegistrationController();

  @override
  void dispose() {
    nameController.dispose();
    qtdController.dispose();
    categoryController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([categoryController, qtdController]),
      builder: (_, __) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Nome do produto'),
            CustomTextField(
                type: TextInputType.name, controller: nameController),
            const SizedBox(height: 20),
            const Text('Descrição'),
            CustomTextField(
                type: TextInputType.multiline, controller: descController),
            const SizedBox(height: 20),
            const Text('Categoria e Quantidade'),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CustomDropDownButtonComponent(
                    selected: productRegistrationController
                        .selectedValueCategory.value,
                    items: productRegistrationController.category,
                    hint: 'Selecione uma opção',
                    onChanged: (item) =>
                        categoryController = item as TextEditingController,
                  ),
                ),
                Flexible(
                  child: CustomTextField(
                    controller: qtdController,
                    type: TextInputType.number,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 180.0),
                child: SizedBox(
                  height: 70,
                  width: 400,
                  child: ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).go('/bar_state');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo.shade900,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    child: const Text(
                      'Continuar',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            )
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
