import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _ContactState();
}

class _ContactState extends State<MyApp> {
  List<Map<int, String>> contacts = [
    {123: 'person1'},
    {456: 'person2'},
    {789: 'person3'}
  ];
  bool flag = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StateFull Widget example',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Contacts'),
        ),
        body: Column(
            children: contacts.map((contact) {
          return ContactCard(contact.values.first, contact.keys.first);
        }).toList()),
      ),
    );
  }
}

class ContactCard extends StatefulWidget {
  final String? name;
  final int? number;
  const ContactCard(this.name, this.number, {super.key});

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  bool favorite = false;
  Set favoritesSet = {};
  void addToFavorite(int number) {
    favoritesSet.add(number);
    print(favoritesSet);
  }

  void removeFromFavorites(int number) {
    if (favoritesSet.contains(number)) {
      favoritesSet.remove(number);
      print(favoritesSet);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        width: 160,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 149, 224, 149),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextButton(
                onPressed: () {
                  setState(() {
                    if (favorite == true) {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                  title: const Text('Favorites'),
                                  content: const Text(
                                      'Do you want you remove from favourites'),
                                  actions: [
                                    TextButton(
                                        onPressed: () => {
                                              Navigator.of(context).pop(),
                                              favorite = false,
                                              removeFromFavorites(
                                                  widget.number ?? 0)
                                            },
                                        child: const Text('yes')),
                                    TextButton(
                                        onPressed: () =>
                                            {Navigator.of(context).pop()},
                                        child: const Text('no'))
                                  ]));
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                  title: const Text('Favorites'),
                                  content: const Text('Add to favourite'),
                                  actions: [
                                    TextButton(
                                        onPressed: () => {
                                              Navigator.of(context).pop(),
                                              addToFavorite(widget.number ?? 0),
                                              favorite = true
                                            },
                                        child: const Text('yes')),
                                    TextButton(
                                        onPressed: () => {
                                              Navigator.of(context).pop(),
                                              removeFromFavorites(
                                                  widget.number ?? 0)
                                            },
                                        child: const Text('no'))
                                  ]));
                    }
                  });
                },
                child: Icon(
                  Icons.favorite,
                  color: favorite
                      ? Colors.red
                      : const Color.fromARGB(255, 255, 255, 255),
                )),
            Row(
              children: [const Icon(Icons.person_2), Text(widget.name ?? '')],
            ),
            Text('phn. no: ${widget.number ?? ''}')
          ],
        ));
  }
}

// class DialogBox extends StatefulWidget{

//   const DialogBox({super.key});
//   @override
//   State<DialogBox> createState() => _CreateDialogState();
  
// }

// class _CreateDialogState extends State<DialogBox>{
  
//   @override
//   Widget build(BuildContext context){
//     return showDialog(context: context, builder:  ()=>AlertDialog(title:  Text('Favorites'),actions: <Widget>[TextButton(onPressed: null, child: Text('yes')),TextButton(onPressed: null, child: Text('no'))]));
//   }
// }
