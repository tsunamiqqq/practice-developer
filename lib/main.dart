import 'package:flutter/material.dart';
import 'contact_card.dart';

void main() {
  runApp(const BusinessCardApp());
}

class BusinessCardApp extends StatefulWidget {
  const BusinessCardApp({super.key});

  @override
  State<BusinessCardApp> createState() => _BusinessCardAppState();
}

class _BusinessCardAppState extends State<BusinessCardApp> {
  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Візитівка розробника',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent, 
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent, 
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: BusinessCardScreen(
        isDarkMode: _isDarkMode,
        onToggleTheme: _toggleTheme,
      ),
    );
  }
}

class BusinessCardScreen extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const BusinessCardScreen({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('Мій профіль'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                child: Icon(
                  Icons.person,
                  size: 60,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Максим Кононенко',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Software Engineer',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                      letterSpacing: 1.5,
                    ),
              ),
              const SizedBox(height: 20),
              const Divider(indent: 50, endIndent: 50),
              const SizedBox(height: 10),
              const ContactCard(
                icon: Icons.phone,
                text: '+380 99 999 99 99',
              ),
              const ContactCard(
                icon: Icons.email,
                text: 'maks@gmail.com',
              ),
              const ContactCard(
                icon: Icons.code,
                text: 'github.com/tsunamiqqq',
              ),
              const SizedBox(height: 32),
              FilledButton.icon(
                onPressed: onToggleTheme,
                icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
                label: const Text('Змінити тему'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}