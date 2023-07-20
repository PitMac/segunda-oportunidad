import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:segunda_oportu/widgets/style_widgets.dart';

class HomeListScreen extends HookWidget {
  const HomeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final index = useState(0);

    final selectedItem =
        TextStyle(color: greenColor, fontSize: 17, fontWeight: FontWeight.bold);
    const noSelectedItem = TextStyle(fontSize: 17);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    index.value = 0;
                  },
                  child: Text(
                    'Productos',
                    style: index.value == 0 ? selectedItem : noSelectedItem,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    index.value = 1;
                  },
                  child: Text(
                    'Comestibles',
                    style: index.value == 1 ? selectedItem : noSelectedItem,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: greenColor),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[800]),
                hintText: "Buscar",
                fillColor: Colors.white70,
                suffixIcon: const Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text(
                  'Cerca de tu posicion',
                  style: TextStyle(fontSize: 17),
                ),
                const Expanded(child: SizedBox()),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.location_on,
                    color: Colors.blue,
                  ),
                  label: const Text(
                    'Portoviejo',
                    style: TextStyle(fontSize: 17, color: Colors.blue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
