import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:segunda_oportu/screens/product_screen.dart';
import 'package:segunda_oportu/widgets/consts.dart';
import 'package:segunda_oportu/widgets/style_widgets.dart';

class HomeListScreen extends HookWidget {
  const HomeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firebase = FirebaseFirestore.instance;

    final selected = useState("NoPerecibles");

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
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryMap.entries.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {
                        selected.value =
                            categoryMap.entries.elementAt(index).value;
                      },
                      child: Text(
                        categoryMap.entries.elementAt(index).key,
                        style: selected.value ==
                                categoryMap.entries.elementAt(index).value
                            ? selectedItem
                            : noSelectedItem,
                      ),
                    ),
                  );
                },
              ),
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
            Expanded(
              child: StreamBuilder(
                stream: firebase.collection(selected.value).snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text("Loading");
                  }

                  return GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.8,
                    ),
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductScreen(document: document),
                              ));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            side: BorderSide(width: 2, color: greenColor),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                width: double.infinity,
                                height: 150,
                                child: Image.network(
                                  data['image_url'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Text(
                                      data['nombre'],
                                      style: const TextStyle(
                                        fontSize: 15,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
