import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  /* List<Information> _items = generateItems(15);*/
  final List<Information> _items = [
    Information(
        id: 1,
        name: 'Genel Bilgiler',
        description:
            'Ortodontik tedaviler diğer diş tedavilerine göre uzun süren, '
            'özellikli tedavilerdir. Ciddi manada hasta uyumu ve sabır gerektirirler. '
            'Siz dişlerinize ne kadar iyi bakarsanız, hekiminizin koyduğu kurallara '
            'ne kadar çok uyarsanız tedaviniz de o derece kolay, sorunsuz ve hızlı ilerleyecektir. '
            'Yoksa sık sık braketleriniz çıkacak, tedaviniz aksayacak, dişlerinizde çürükler oluşacak, '
            'diş eti problemleriyle yüz yüze kalacaksınız ve tedavi bir anlamda size zarar vermiş olacaktır. '
            'Bu nedenle tedavi sürecinde beslenme kurallarına uyar, düzenli diş fırçalayıp ağız bakımına özen gösterir, '
            'randevularınızı takip edip aksatmazsanız tedavi sürecinizde oluşabilecek tüm olumsuz durumlardan kaçınmış olursunuz.',
        expanded: false,
        icon: 'assets/x-ray.png'),
    Information(
        id: 2,
        name: 'Nasıl Beslenmeliyim?',
        description: 'desc',
        expanded: false,
        icon: 'assets/nutrition.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tedavimle İlgili Bilmem Gerekenler'),
        backgroundColor: const Color.fromRGBO(1, 24, 38, 1),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => {Navigator.of(context).pop()},
        ),
      ),
      body: SingleChildScrollView(
          child: ExpansionPanelList(
        animationDuration: const Duration(milliseconds: 500),
        children: _getExpansionPanels(_items),
        expansionCallback: (panelIndex, expanded) {
          _items[panelIndex].expanded = !expanded;
          setState(() {});
        },
      )),
    );
  }
}

class Information {
  int id;
  String name;
  String description;
  String icon;
  bool expanded;

  Information(
      {required this.id,
      required this.name,
      required this.description,
      required this.expanded,
      required this.icon});
}

List<ExpansionPanel> _getExpansionPanels(List<Information> _items) {
  return _items.map<ExpansionPanel>((Information item) {
    return ExpansionPanel(
      headerBuilder: (BuildContext context, bool isExpanded) {
        return Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              children: [
                Image.asset(
                  item.icon,
                  width: 50,
                ),
                const SizedBox(width: 20),
                Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold,),)
              ],
            ));
      },
      body: ListTile(
        
        title: Container( padding:EdgeInsets.all(8),child: Text(item.description)),
      ),
      isExpanded: item.expanded,
    );
  }).toList();
}
