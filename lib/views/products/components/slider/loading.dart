
part of 'view.dart';
class _Loading extends StatelessWidget {
  const _Loading({super.key});
  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Container(
        height: 232,
        child: Column(
          children: [
            Expanded(
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                    (index) => Padding(
                  padding: EdgeInsetsDirectional.only(
                      end: index != 4  ? 8 : 0),
                  child: CircleAvatar(
                    radius: 6,
                    backgroundColor: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(horizontal: 16).copyWith(top: 16),
      ),
    );
  }
}