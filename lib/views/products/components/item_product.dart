
part of 'products/view.dart';

class _Item extends StatefulWidget {
  final ProductModel model ;
  const _Item({Key? key, required this.model}) : super(key: key);
  @override
  State<_Item> createState() => _ItemState();
}
class _ItemState extends State<_Item> {
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        children: [
          Image.network(
            widget.model.image,
            height: 135.h,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 6.h),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 6.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.model.title, style:
                    TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700)),
                    GestureDetector(
                      onTap: () {
                        print("hello");
                        widget.model.toggle();
                        setState(() {

                        });
                      },
                      child: Icon(widget.model.isFavorite?Icons.favorite:
                      Icons.favorite_border_rounded,
                        color:widget.model.isFavorite?Colors.green:null ,),
                    ),
                  ],
                ),
                SizedBox(height: 6.h),
                Text(
                  widget.model.description,
                  maxLines: 3,
                  style: TextStyle(fontSize: 10.sp, color: Colors.black.
                  withOpacity(0.37)),
                ),
                Row(
                  children: [
                    Text(
                      "${widget.model.priceAfter}\$",
                      style: TextStyle(fontSize: 18.sp, fontWeight:
                      FontWeight.w700),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      "${widget.model.priceBefore}\$",
                      style: TextStyle(fontSize: 14.sp, decoration:
                      TextDecoration.lineThrough, color:
                      Colors.black.withOpacity(0.27), fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: CircleAvatar(
                    radius: 15,
                    child: Icon(Icons.shopping_cart, color: Colors.white, size: 16),
                    backgroundColor: Colors.green,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}