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
        'Ortodontik tedaviler diğer diş tedavilerine göre uzun süren, özellikli tedavilerdir. Ciddi manada hasta uyumu ve sabır gerektirirler. Siz dişlerinize ne kadar iyi bakarsanız, hekiminizin koyduğu kurallara ne kadar çok uyarsanız tedaviniz de o derece kolay, sorunsuz ve hızlı ilerleyecektir. Yoksa sık sık braketleriniz çıkacak, tedaviniz aksayacak, dişlerinizde çürükler oluşacak, diş eti problemleriyle yüz yüze kalacaksınız ve tedavi bir anlamda size zarar vermiş olacaktır. Bu nedenle tedavi sürecinde beslenme kurallarına uyar, düzenli diş fırçalayıp ağız bakımına özen gösterir, randevularınızı takip edip aksatmazsanız tedavi sürecinizde oluşabilecek tüm olumsuz durumlardan kaçınmış olursunuz.',
        expanded: false,
        icon: 'assets/x-ray.png'),
    Information(
        id: 2,
        name: 'Nasıl Beslenmeliyim?',
        description: '1.YENİLMEMESİ GEREKEN SERT VE YAPIŞKAN GIDALAR\n\n'
            'Fındık, fıstık, leblebi, badem, çekirdek gibi sert kuruyemişler\n'
            'Kızarmış ekmek, sert tost, sert simit, ekmeğin sert kısımları\n'
            'Patlamış mısır, cips gibi hazır gıdalar\n'
            'Lokum, sakız, kuru meyveler, karamelli çikolatalar/şekerlemeler gibi yapışkan yiyecekler.\n'
            'Yeşil erik \n'
            'Sert gofretler/bisküviler/krakerler\n\n'

            '2.YENİLİRKEN DİKKAT EDİLMESİ GEREKEN GIDALAR\n\n'
            'Elma, armut, şeftali gibi ön dişlerle bütün halde ısırılarak tüketilen meyveler küçük parçalar halinde doğrandıktan sonra arka dişlerle çiğnenmelidir.\n'
            'Çikolata ve şeker kesinlikle çiğnenmemeli, ağız içinde eritilerek tüketilmelidir.\n'
            'Tavuk ve et gibi yiyecekler yumuşak kıvamda pişirilerek yenmelidir.\n'
            'Havuç, salatalık gibi sert sebzeler bütün halde yenmemeli, rendelenerek tüketilmelidir.\n'
            'Zeytin, kiraz, vişne, yumuşak erik gibi çekirdekli meyveler tüketilirken çekirdekleri dışarıda çıkarılıp yenmeli, ağız içinde çekirdekler çıkarılmaya çalışılmamalıdır.\n'
            'Pide ve pizza gibi yiyeceklerin sert kızarmış yerleri yenmemelidir.\n\n'

            '3.İÇİLMEMESİ GEREKEN GIDALAR\n\n'
            'Kola, fanta gibi şekerli ve gazlı hazır içecekler tüketilmemelidir.\n\n',
        expanded: false,
        icon: 'assets/nutrition.png'),
    Information(id: 3, name: 'Dişlerimde ağrı ve\n'
        'hassasiyet olur mu?', description: 'Tedaviniz başlarken dişlerinizin üzerine braket/bant/buton gibi ataçmanlar yerleştirilir ve bu ataçmanlara ortodontik teller dahil edilerek tedavi süreciniz başlamış olur. '
        'Bu işlemin ardından 7-10 gün kadar kişiden kişiye değişmekle beraber ufak ağrılar/hassasiyetler/dişlerde sallanma hissi/yanak-dudak içlerinde ve dilde küçük tahrişler görülebilir. Bu durum tamamen tedavinin mekanikleri gereği '
        'oluşan geçici bir durumdur. Dişler ve tüm ağız dokuları 7-10 gün içerisinde tedaviye uyum sağlayacaktır. Bu süreci hafif atlatmak için birkaç gün yumuşak gıdalar tüketebilir, parasetamol türevi ağrı kesicilerden günde '
        'en fazla 2 tane olmak suretiyle yararlanabilir ve ağız dokularınızı tahriş eden bölgelere ortodontik mum koyabilirsiniz.Tedavinin başlangıcından sonra tedavi sonuna kadar hastalar '
        '4-6 haftalık periyotlarla hekimlerine kontrol amaçlı giderler ve kontrol günlerinin ardından 2-3 gün benzer şikayetler tekrar görülebilir. ', expanded: false, icon: 'assets/toothache.png'),
    Information(id: 4, name: 'Dişlerimi Nasıl\n'
        'Fırçalamalıyım?', description: 'Ortodontik tedavi sürecinde dişler günde 3 kere her bir fırçalama en az 2 dk olmak suretiyle fırçalanmalıdır. Dişler önce baş kısmı ortodontik tedaviye uygun tasarlanmış büyük fırça ile dişlere ve diş etlerine temas ederek yatay hareketlerle fırçalanmalı, ardından arayüz fırçası olarak isimlendirilen ince ve küçük uçlu fırçalar ile tüm dişlerin araları ve ortodontik ataçmanların kenarları temizlenmelidir.', expanded: false, icon: 'assets/toothpaste.png')
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
                const SizedBox(width: 10),
                Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold,) )
              ],
            ));
      },
      body: ListTile(

        title: Container( padding:const EdgeInsets.all(8),child: Text(item.description, textAlign: TextAlign.justify)),
      ),
      isExpanded: item.expanded,
    );
  }).toList();
}
