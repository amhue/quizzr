import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizzr/widgets/texts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Headercard extends StatelessWidget {
  final String _cardTitle;
  final String _desc;
  final int _questionLen;
  final int _index;

  const Headercard({
    required String cardTitle,
    required String desc,
    required int questionLen,
    required int index,
    super.key,
  }) : _questionLen = questionLen,
       _desc = desc,
       _cardTitle = cardTitle,
       _index = index;

  Future<List<String>?> getSolved() async {
    final prefs = await SharedPreferences.getInstance();
    // print(prefs.getStringList("selected$_index"));
    return prefs.getStringList("selected$_index");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getSolved(),
      builder: (context, snapshot) {
        final solved = snapshot.data;

        return GestureDetector(
          onTap: () => context.push("/quiz/$_index"),

          child: Card(
            elevation: 1,
            child: Padding(
              padding: EdgeInsetsGeometry.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Padding(
                    padding: EdgeInsetsGeometry.all(3),
                    child: Icon(
                      solved == null ? Icons.lightbulb : Icons.check,
                      color: solved == null
                          ? Theme.of(context).colorScheme.primary
                          : Colors.green,
                    ),
                  ),

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        TitleSmall(data: _cardTitle),
                        Padding(
                          padding: EdgeInsetsGeometry.fromLTRB(0, 0, 0, 5),
                          child: BodyText(data: _desc),
                        ),
                        DescText(data: "$_questionLen Questions"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
