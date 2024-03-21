part of '../home_screen.dart';

class MockPokemon extends StatelessWidget {
  const MockPokemon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.shade100,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              bottom: 16,
              top: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    width: 30,
                    height: 20,
                    color: Colors.white,
                  ),
                ), // Dynamic pokemon ID
                const SizedBox(height: Shapes.gutter),
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    width: 250,
                    height: 25,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: Shapes.gutter),
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                      left: 6,
                      right: 8,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: 140,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.shade600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
