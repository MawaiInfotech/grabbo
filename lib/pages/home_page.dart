import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grabbo/bloc/cat_tabs_bloc.dart';
import 'package:grabbo/model/cat_tabs_model.dart';
import 'package:grabbo/services/homepage_service.dart';
import 'package:provider/provider.dart';

import '../routes/app_routes.dart';
import '../state/cat_tabs_state.dart';
import '../utils/category_icons.dart';
import '../widgets/grocer_loader.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  late HomepageService homepageService;
  late CatTabsBloc catTabsBloc;
  int selectedCategoryIndex = 0;

  @override
  void initState() {
    homepageService = Provider.of<HomepageService>(context, listen: false);
    catTabsBloc = CatTabsBloc(homepageService);
    catTabsBloc.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7, // number of tabs
      child: Scaffold(
        body: _buildBody()
      ),
    );
  }

  _buildBody() {
    return BlocConsumer<CatTabsBloc, CatTabsState>(
      bloc: catTabsBloc,
      listener: (_, state) {},
      builder: (_, state) {
        return state.when(
            loading: _buildLoading,
            content: _buildContent,
            success: _buildContent,
            failed: (form, __) => _buildContent(form));
      },
    );
  }

  Widget _buildLoading(List<CatTabsModel> model) {
    return Center(child: GroceryLoader.initial());
  }

  Widget _buildContent(List<CatTabsModel> model) {
    print(model.length);
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xffffda73),
            Colors.white,
            Colors.white,
          ],
        ),
      ),
      child: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              // 🔹 Logo + Address
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.flash_on,
                                  color: Colors.purple, size: 28),
                              SizedBox(width: 6),
                              Text(
                                "Grabbo",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.purple,
                                ),
                              ),
                            ],
                          ),
                          CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.person, color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined),
                          SizedBox(width: 4),
                          Text("A Block, Sector 63, Noida"),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // 🔹 Search + Category Buttons
              SliverAppBar(
                pinned: true,
                elevation: 2,
                backgroundColor: const Color(0xfffdefc6),
                automaticallyImplyLeading: false,
                toolbarHeight: 130,

                flexibleSpace: Column(
                  children: [
                    // 🔍 Search Bar
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 10, 16, 8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            )
                          ],
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.search, color: Colors.black54),
                            SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText:
                                  'Search "20000 mah powerbank..."',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Icon(Icons.mic, color: Colors.black54),
                          ],
                        ),
                      ),
                    ),

                    // 🔘 CATEGORY BUTTONS (API DRIVEN)
                    SizedBox(
                      height: 60,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        padding:
                        const EdgeInsets.symmetric(horizontal: 12),
                        itemCount: model.length,
                        itemBuilder: (context, index) {

                          final item = model[index];
                          final isSelected =
                              selectedCategoryIndex == index;

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCategoryIndex = index;
                              });

                              // 🔥 Reload data here
                              // catTabsBloc.loadCategory(
                              //   item.categoryName,
                              // );
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 12),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Colors.white
                                    : Colors.transparent,
                                borderRadius:
                                BorderRadius.circular(10),
                                boxShadow: isSelected
                                    ? const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  )
                                ]
                                    : [],
                              ),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    CategoryIcons.getIcon(item.name),
                                    width: 25,
                                    height: 25,
                                  )
                                  ,
                                  const SizedBox(height: 4),
                                  Text(
                                    item.name,
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: isSelected
                                          ? FontWeight.w600
                                          : FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ];
          },

          // 🔻 BODY RELOADS BASED ON CATEGORY
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔹 Banner
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, AppRoutes.productDetailPage);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/slider_image.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                // 🔹 Top Categories
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    "Top Categories",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),

                SizedBox(
                  height: 90,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    children: [
                      _circleCategory("Watch", "assets/images/watch.png"),
                      _circleCategory("Shirt", "assets/images/watch.png"),
                      _circleCategory("Sports", "assets/images/watch.png"),
                      _circleCategory("Trackpants", "assets/images/watch.png"),
                      _circleCategory("New Trend", "assets/images/watch.png"),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // 🔹 Bestseller
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    "Bestseller",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 4/5,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _gridCategory(
                          "Vegetables & Fruits", [
                        "assets/images/ginger.png",
                        "assets/images/banana.jpeg",
                        "assets/images/onion.jpg",
                        "assets/images/ginger.png",
                      ], "+172 more"),
                      _gridCategory(
                          "Dairy, Bread & Eggs", [
                        "assets/images/amul.webp",
                        "assets/images/bun.jpg",
                        "assets/images/milk.webp",
                        "assets/images/protien.png",
                      ], "+33 more"),
                      _gridCategory(
                          "Oil, Ghee & Masala", [
                        "assets/images/oil.jpg",
                        "assets/images/fortune.jpg",
                        "assets/images/aata.webp",
                        "assets/images/protien.png",
                      ], "+226 more"),
                      _gridCategory(
                          "Vegetables & Fruits", [
                        "assets/images/protien.png",
                        "assets/images/biscut.webp",
                        "assets/images/onion.jpg",
                        "assets/images/ginger.png",
                      ], "+172 more"),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    "Grocery & Kitchen",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: GridView.count(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1/1.2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _categoryTile("Vegetables & Fruits", "assets/images/veget.png"),
                      _categoryTile("Atta, Rice & Dal", "assets/images/aata.webp"),
                      _categoryTile("Oil, Ghee & Masala", "assets/images/oil.jpg"),
                      _categoryTile("Dairy, Bread & Eggs", "assets/images/protien.png"),
                      _categoryTile("Dry Fruits & Cereals", "assets/images/ginger.png"),
                      _categoryTile("Bekery & Biscuits", "assets/images/biscut.webp"),
                      _categoryTile("Kitchen Bottle", "assets/images/fortune.jpg"),
                      _categoryTile("Dairy Milk & Milk", "assets/images/amul.webp"),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    "Snacks & Drinks",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: GridView.count(
                    crossAxisCount: 4,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    shrinkWrap: true,
                    childAspectRatio: 1/1.2,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _categoryTile("Chips & Namkeen", "assets/images/chips.webp"),
                      _categoryTile("Drinks & Juices", "assets/images/protien.png"),
                      _categoryTile("Tea, Coffee & Milk", "assets/images/milk.webp"),
                      _categoryTile("Sweets & Chocolates", "assets/images/biscut.webp"),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

              ],
            ),
          )
        ),
      ),

    );
  }


  _circleCategory(String title, String imagePath) {
    return Container(
      margin: const EdgeInsets.only(right: 14),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imagePath),
            backgroundColor: Colors.grey.shade100,
          ),
          const SizedBox(height: 5),
          Text(title, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  _categoryTile(String title, String imagePath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: const Color(0xfff1f6ff),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(imagePath, fit: BoxFit.contain),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  _gridCategory(String title, List<String> imagePaths, String more) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 140,
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 5/4, // perfect square images
              physics: const NeverScrollableScrollPhysics(),
              children: imagePaths
                  .map(
                    (path) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[100],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      path,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ).toList(),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(6),
            decoration:  BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(30)
            ),
            child: Text(
              more,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: null, // allow wrapping
              ),
            ),
          ),
        ],
      ),
    );
  }
}
