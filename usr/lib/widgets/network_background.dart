import 'dart:math';
import 'package:flutter/material.dart';

class NetworkBackground extends StatefulWidget {
  const NetworkBackground({super.key});

  @override
  State<NetworkBackground> createState() => _NetworkBackgroundState();
}

class _NetworkBackgroundState extends State<NetworkBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Particle> _particles = [];
  final Random _random = Random();
  final int _numberOfParticles = 50;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _initParticles(Size size) {
    if (_particles.isEmpty) {
      for (int i = 0; i < _numberOfParticles; i++) {
        _particles.add(Particle(
          x: _random.nextDouble() * size.width,
          y: _random.nextDouble() * size.height,
          vx: _random.nextDouble() * 1.5 - 0.75, // Random velocity X
          vy: _random.nextDouble() * 1.5 - 0.75, // Random velocity Y
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        _initParticles(Size(constraints.maxWidth, constraints.maxHeight));
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            _updateParticles(Size(constraints.maxWidth, constraints.maxHeight));
            return CustomPaint(
              painter: NetworkPainter(_particles),
              size: Size(constraints.maxWidth, constraints.maxHeight),
            );
          },
        );
      },
    );
  }

  void _updateParticles(Size size) {
    for (var particle in _particles) {
      particle.x += particle.vx;
      particle.y += particle.vy;

      // Bounce off edges
      if (particle.x < 0 || particle.x > size.width) particle.vx *= -1;
      if (particle.y < 0 || particle.y > size.height) particle.vy *= -1;
    }
  }
}

class Particle {
  double x;
  double y;
  double vx;
  double vy;

  Particle({required this.x, required this.y, required this.vx, required this.vy});
}

class NetworkPainter extends CustomPainter {
  final List<Particle> particles;
  final double connectionDistance = 100.0;

  NetworkPainter(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint dotPaint = Paint()
      ..color = const Color(0xFF00E5FF).withOpacity(0.6)
      ..style = PaintingStyle.fill;

    final Paint linePaint = Paint()
      ..color = const Color(0xFF00E5FF).withOpacity(0.2)
      ..strokeWidth = 1.0;

    for (int i = 0; i < particles.length; i++) {
      // Draw particle
      canvas.drawCircle(Offset(particles[i].x, particles[i].y), 2.5, dotPaint);

      // Draw connections
      for (int j = i + 1; j < particles.length; j++) {
        double dx = particles[i].x - particles[j].x;
        double dy = particles[i].y - particles[j].y;
        double distance = sqrt(dx * dx + dy * dy);

        if (distance < connectionDistance) {
          // Fade line based on distance
          linePaint.color = const Color(0xFF00E5FF)
              .withOpacity(0.2 * (1 - distance / connectionDistance));
          canvas.drawLine(
            Offset(particles[i].x, particles[i].y),
            Offset(particles[j].x, particles[j].y),
            linePaint,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
