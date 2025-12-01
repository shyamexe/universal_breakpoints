import 'package:flutter/material.dart';
import 'package:universal_breakpoints/universal_breakpoints.dart';
import 'docs_example.dart';
import 'breakpoints_showcase.dart';
import 'responsive_layouts.dart';
import 'device_detection.dart';
import 'scaling_extensions.dart';
import 'advanced_examples.dart';
import 'grid_examples.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> screens = [
    const DocsExample(),
    const BreakpointsShowcase(),
    const ResponsiveLayouts(),
    const DeviceDetection(),
    const ScalingExtensions(),
    const GridExamples(),
    const AdvancedExamples(),
  ];

  final List<String> screenTitles = [
    'Documentation',
    'Breakpoints',
    'Responsive Layouts',
    'Device Detection',
    'Scaling Extensions',
    'Grid Systems',
    'Advanced Examples',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(screenTitles[_selectedIndex]), elevation: 0),
      body: screens[_selectedIndex],
      bottomNavigationBar:
          context.isMobile
              ? SizedBox(
                width: MediaQuery.of(context).size.width,
                child: BottomNavigationBar(
                  currentIndex: _selectedIndex,
                  onTap: (index) {
                    setState(() => _selectedIndex = index);
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.description),
                      label: 'Docs',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.straighten),
                      label: 'Breakpoints',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.dashboard),
                      label: 'Responsive',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.phone_android),
                      label: 'Devices',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.text_fields),
                      label: 'Scaling',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.grid_3x3),
                      label: 'Grid',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.stars),
                      label: 'Advanced',
                    ),
                  ],
                ),
              )
              : null,
      drawer:
          !context.isMobile
              ? Drawer(
                child: NavigationRail(
                  extended: true,
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: (index) {
                    setState(() => _selectedIndex = index);
                  },
                  destinations: [
                    NavigationRailDestination(
                      icon: const Icon(Icons.description),
                      label: const Text('Documentation'),
                    ),
                    NavigationRailDestination(
                      icon: const Icon(Icons.straighten),
                      label: const Text('Breakpoints'),
                    ),
                    NavigationRailDestination(
                      icon: const Icon(Icons.dashboard),
                      label: const Text('Responsive'),
                    ),
                    NavigationRailDestination(
                      icon: const Icon(Icons.phone_android),
                      label: const Text('Devices'),
                    ),
                    NavigationRailDestination(
                      icon: const Icon(Icons.text_fields),
                      label: const Text('Scaling'),
                    ),
                    NavigationRailDestination(
                      icon: const Icon(Icons.grid_3x3),
                      label: const Text('Grid'),
                    ),
                    NavigationRailDestination(
                      icon: const Icon(Icons.stars),
                      label: const Text('Advanced'),
                    ),
                  ],
                ),
              )
              : null,
    );
  }
}
