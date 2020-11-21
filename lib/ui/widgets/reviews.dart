part of 'widgets.dart';

class CardReviews extends StatelessWidget {
  final List<CustomerReview> reviews;

  CardReviews(this.reviews);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              "Reviews",
              style: infoStyle,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: SizeConfig.screenHeight * 0.3,
            child: reviews.length != 0
                ? ListView(
                    children: reviews.map((e) => _reviewItem(e)).toList(),
                  )
                : Center(
                    child: Text(
                      "Don't have review",
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _reviewItem(CustomerReview customerReview) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 8,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: lightColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                child: Icon(
                  EvaIcons.personOutline,
                  color: mainColorDark,
                ),
              ),
              Expanded(
                child: Text(
                  customerReview.name ?? "null",
                  style: infoStyle.copyWith(
                    color: secondColorDark,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                customerReview.date,
                style: infoStyle.copyWith(
                  color: secondColorDark,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            customerReview.review ?? "null",
            style: infoStyle.copyWith(
              color: secondColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
