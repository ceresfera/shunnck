import 'package:flutter/material.dart';
import 'instant.dart';
import 'busqueda.dart';

class InstanteViews extends StatefulWidget {
  const InstanteViews({
    Key? key,
  }) : super(key: key);

  @override
  State<InstanteViews> createState() => _InstanteViewsState();
}

class _InstanteViewsState extends State<InstanteViews> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            children: const [
              Text(
                'INTS PLAY',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: "LeaugeSpartan",
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(27),
                  color: const Color(0XFF171717)),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: TextField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0XFF171717),
                    hintText: 'Busca aquí.',
                    hintStyle: const TextStyle(
                      color: Color(0XFFCACACA),
                      fontSize: 50,
                      height: 1.3,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(27),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(27),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(
                    color: Color(0XFFF8F8F8),
                    fontSize: 50,
                    height: 1.3,
                  ),
                  maxLines: null,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (String userInput) {
                    // Check if the user input is a valid URL
                    if (Uri.tryParse(userInput)?.hasScheme ?? false) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BusquedaView(url: userInput),
                        ),
                      );
                    } else {
                      // If the user input is not a valid URL, perform a DuckDuckGo search
                      final searchQuery = Uri.encodeComponent(userInput);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BusquedaView(
                            url: 'https://duckduckgo.com/?q=$searchQuery',
                          ),
                        ),
                      );
                    }
                    // Clear the text field
                    _textEditingController.clear();
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
