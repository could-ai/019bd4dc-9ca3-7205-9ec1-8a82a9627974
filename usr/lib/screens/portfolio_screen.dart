import 'package:flutter/material.dart';
import 'package:couldai_user_app/widgets/network_background.dart';
import 'package:couldai_user_app/widgets/glass_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. Animated Background
          const Positioned.fill(child: NetworkBackground()),

          // 2. Scrollable Content
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 60),
                
                // --- Profile Section ---
                _buildProfileHeader(context),
                
                const SizedBox(height: 20),

                // --- About Section ---
                GlassCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "About Me",
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "I am a passionate developer who loves building scalable applications and interactive experiences. "
                        "With a strong background in Flutter and AI integration, I turn complex problems into elegant solutions.",
                        style: TextStyle(fontSize: 16, height: 1.5),
                      ),
                    ],
                  ),
                ),

                // --- Skills Section ---
                GlassCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Skills",
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          _buildSkillChip("Flutter"),
                          _buildSkillChip("Dart"),
                          _buildSkillChip("Firebase"),
                          _buildSkillChip("UI/UX Design"),
                          _buildSkillChip("Node.js"),
                          _buildSkillChip("Python"),
                          _buildSkillChip("Git"),
                        ],
                      ),
                    ],
                  ),
                ),

                // --- Projects Section ---
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Featured Projects",
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                _buildProjectCard(
                  context,
                  title: "E-Commerce App",
                  description: "A full-featured shopping app with payment integration and real-time tracking.",
                  icon: Icons.shopping_bag_outlined,
                ),
                _buildProjectCard(
                  context,
                  title: "AI Chat Assistant",
                  description: "Smart chat interface powered by LLMs for natural language processing.",
                  icon: Icons.chat_bubble_outline,
                ),
                _buildProjectCard(
                  context,
                  title: "Finance Tracker",
                  description: "Personal finance management tool with data visualization and budget planning.",
                  icon: Icons.pie_chart_outline,
                ),

                const SizedBox(height: 20),

                // --- Contact Section ---
                GlassCard(
                  child: Column(
                    children: [
                      Text(
                        "Get In Touch",
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildSocialButton(FontAwesomeIcons.github, "GitHub"),
                          _buildSocialButton(FontAwesomeIcons.linkedin, "LinkedIn"),
                          _buildSocialButton(FontAwesomeIcons.twitter, "Twitter"),
                          _buildSocialButton(Icons.email, "Email"),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),
                const Text(
                  "© 2024 My Portfolio. Built with Flutter.",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Column(
      children: [
        // Profile Picture with Glow Effect
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
          ),
          child: const CircleAvatar(
            radius: 60,
            backgroundColor: Colors.white,
            // Replace with your actual image asset: AssetImage('assets/profile.jpg')
            child: Icon(Icons.person, size: 60, color: Colors.grey), 
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "Hello, I'm [Your Name]",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Flutter Developer & UI Designer",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }

  Widget _buildSkillChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildProjectCard(BuildContext context, {required String title, required String description, required IconData icon}) {
    return GlassCard(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Theme.of(context).colorScheme.primary, size: 30),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[300],
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, color: Colors.white54, size: 16),
        ],
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.white.withOpacity(0.1),
          child: Icon(icon, color: Colors.white, size: 24),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.white70)),
      ],
    );
  }
}
