class AppUtils {
  static const List<Map<String, String>> menu = [
    {
      'title': "Món mới",
      'code': "new",
      'deactive_img': "New.regular.png",
      'active_img': "New.white.png",
    },
    {
      'title': "Pizza",
      'code': "pizza",
      'deactive_img': "Pizza.regular.png",
      'active_img': "Pizza.white.png",
    },
    {
      'title': "Burger",
      'code': "burger",
      'deactive_img': "Burger.regular.png",
      'active_img': "Burger.white.png",
    },
    {
      'title': "Mì cay",
      'code': "micay",
      'deactive_img': "Micay.regular.png",
      'active_img': "Micay.white.png",
    },
    {
      'title': "Mì ý",
      'code': "miy",
      'deactive_img': "Miy.regular.png",
      'active_img': "Miy.white.png",
    },
    {
      'title': "Cơm gà",
      'code': "comga",
      'deactive_img': "Comga.regular.png",
      'active_img': "Comga.white.png",
    },
    {
      'title': "Trà sữa",
      'code': "trasua",
      'deactive_img': "Trasua.regular.png",
      'active_img': "Trasua.white.png",
    },
    {
      'title': "Đồ ăn nhẹ",
      'code': "doannhe",
      'deactive_img': "DoAnNhe.regular.png",
      'active_img': "DoAnNhe.white.png",
    }
  ];
  static const Map<int, Map<String, String>> deliveries = {
    1: {
      'title': "Dùng Tại Chỗ",
      'code': "store",
      'deactive_img': "New.regular.png",
      'active_img': "New.white.png",
    },
    2: {
      'title': "Đặt Mang Đi",
      'code': "delivery",
      'deactive_img': "Pizza.regular.png",
      'active_img': "Pizza.white.png",
    },
  };
  static const List<String> categories = [
    'general',
    'technology',
    'business',
    'science',
    'health',
    'sports',
    'entertainment',
  ];

  static const List<String> tabsLabel = [
    'Top Stories',
    'Articles',
  ];
  static const List<String> stores = [
    'Top Stories',
    'Articles',
  ];
}
