import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PRAKTIKUM',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> dynamicItems = [
      'Indo',
      'Jawa',
      'Sunda',
      'Batak',
      'Ngawi',
      'Ci',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Galih Trisna',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 6. STACK: Menampilkan widget bertumpuk (Container & CircleAvatar)
              _buildHeaderStack(context),
              const SizedBox(height: 24),

              const SectionHeader(title: 'GridView'),
              // 2. GRIDVIEW: Menampilkan 6 item dalam bentuk grid (3 kolom)
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: List.generate(6, (index) {
                  // 1. CONTAINER: Kotak berwarna sebagai item grid
                  return Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.widgets, color: Theme.of(context).colorScheme.onSecondaryContainer),
                          Text('Card ${index + 1}'),
                        ],
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 24),

              const SectionHeader(title: 'ListView'),
              // 3. LISTVIEW: Menampilkan 3 item statis (A, B, C)
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  ListTile(
                    leading: CircleAvatar(child: Text('A')),
                    title: Text('Item A'),
                  ),
                  ListTile(
                    leading: CircleAvatar(child: Text('B')),
                    title: Text('Item B'),
                  ),
                  ListTile(
                    leading: CircleAvatar(child: Text('C')),
                    title: Text('Item C'),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              const SectionHeader(title: 'ListView.builder'),
              // 4. LISTVIEW.BUILDER: Membuat list dari data array (dynamicItems)
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: dynamicItems.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.bolt),
                      title: Text(dynamicItems[index]),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),

              const SectionHeader(title: 'ListView.separated'),
              // 5. LISTVIEW.SEPARATED: List dengan garis pembatas (Divider)
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.label_important),
                    title: Text('item #${index + 1}'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 1. CONTAINER & 6. STACK (Helper Widget)
  Widget _buildHeaderStack(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Container sebagai background berwarna
        Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.primary.withOpacity(0.7),
              ],
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(20),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Pertemuan 7', style: TextStyle(color: Colors.white, fontSize: 16)),
              Text('Praktikum', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Positioned(
          bottom: -20,
          right: 20,
          child: CircleAvatar(
            radius: 40,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            child: const Icon(Icons.person, size: 50, color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold));
  }
}
