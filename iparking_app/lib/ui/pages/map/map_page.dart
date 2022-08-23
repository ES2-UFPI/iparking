import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../components/components.dart';
import 'map_controller.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  int _selectedIndex = 0;
  late PageController _pageController;
  late MapController controller;

  @override
  void initState() {
    _pageController = PageController(initialPage: _selectedIndex);

    _pageController.addListener(() {
      if (_pageController.page! > _selectedIndex + 0.5) {
        setState(() {
          _selectedIndex = _pageController.page!.ceil();
        });
      } else if (_pageController.page! < _selectedIndex - 0.5) {
        setState(() {
          _selectedIndex = _pageController.page!.floor();
        });
      }
    });

    controller = Get.put(MapController());
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    controller.estacionamentoAtual.stream.listen((event) {
      if (event != null) {
        showModalBottomSheet(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            context: context,
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            builder: (_) {
              return EstacionamentoDetalhesBottomSheet(estacionamento: event);
            });
      }
    });
    super.didChangeDependencies();
  }

  void _onItemTapped(int index) {
    _selectedIndex = index;
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        return PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(
              parent: BouncingScrollPhysics()),
          children: [
            GetBuilder<MapController>(
              init: controller,
              builder: (event) {
                return SafeArea(
                  child: GoogleMap(
                    scrollGesturesEnabled: true,
                    mapType: MapType.normal,
                    zoomControlsEnabled: true,
                    initialCameraPosition:
                        CameraPosition(target: controller.position, zoom: 13),
                    onMapCreated: controller.onMapCreated,
                    myLocationEnabled: true,
                    markers: controller.markers,
                  ),
                );
              },
            ),
            const MenuPage()
          ],
        );
      }),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Mapa',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'Menu',
            ),
          ]),
    );
  }
}

class MenuPage extends StatelessWidget {
  const MenuPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: const [
            Text("name"),
            ParkinListTileOption(
                title: "Perfil",
                subtitle: "Verificar seus dados",
                icon: Icons.person),
            ParkinListTileOption(
                title: "Pagamentos",
                subtitle: "Métodos de pagamentos",
                icon: Icons.credit_card),
          ],
        ),
      ),
    );
  }
}

class ParkinListTileOption extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData icon;
  const ParkinListTileOption(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: Text(title),
      subtitle:
          Text(subtitle ?? "", style: Theme.of(context).textTheme.labelMedium),
      leading: Icon(icon, color: Colors.white),
    );
  }
}
