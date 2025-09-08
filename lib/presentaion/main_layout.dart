import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/colors_manager.dart';
import 'package:news_app/core/routes_manager.dart';
import 'package:news_app/providers/config_provider.dart';
import 'package:news_app/providers/tab_view_provider.dart';
import 'package:provider/provider.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  bool isDark = false;
  bool isEnglish = true;
  // ThemeMode themeMode =ThemeMode.light;
  @override
  Widget build(BuildContext context) {
    var tabViewProvider = Provider.of<TabViewProvider>(context);
    // var configProvider = Provider.of<ConfigProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(tabViewProvider.tabTitle),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RoutesManager.searchView);
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: ColorsManager.black,
        width: 269.w,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 166.h,
              width: 269.w,
              color: ColorsManager.white,
              child: Text(
                'News App',
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.black,
                ),
              ),
            ),
            Padding(
              padding: REdgeInsets.all(16),
              child: Column(
                children: [
                  TextButton(
                    style: ButtonStyle(
                      padding: WidgetStateProperty.all(EdgeInsets.zero),
                    ),
                    onPressed: () {
                      tabViewProvider.viewCategories();
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.home_outlined,
                          color: ColorsManager.white,
                          size: 34.sp,
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          'Go To Home',
                          style: GoogleFonts.inter(
                            color: ColorsManager.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Divider(
                    color: ColorsManager.white,
                    thickness: 1.sp,
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      const Icon(
                        Icons.imagesearch_roller_outlined,
                        color: ColorsManager.white,
                      ),
                      SizedBox(width: 12.w),
                      Text(
                        'Them',
                        style: GoogleFonts.inter(
                          color: ColorsManager.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Dark',
                        style: GoogleFonts.inter(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorsManager.white,
                        ),
                      ),
                      Consumer<ConfigProvider>(
                        builder: (context, configProvider, child) {
                          return Switch(
                            value: isDark,
                            onChanged: (value) {
                              configProvider.changeAppTheme(
                                  value == false ? ThemeMode.light : ThemeMode.dark);

                              setState(() {
                                isDark = !isDark;
                              });
                            },
                          );
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Divider(
                    color: ColorsManager.white,
                    thickness: 1.sp,
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      const Icon(
                        Icons.language_outlined,
                        color: ColorsManager.white,
                      ),
                      SizedBox(width: 12.w),
                      Text(
                        'Language',
                        style: GoogleFonts.inter(
                          color: ColorsManager.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'English',
                        style: GoogleFonts.inter(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorsManager.white,
                        ),
                      ),
                      Switch(
                        value: isEnglish,
                        onChanged: (value) {
                          setState(() {
                            isEnglish = !isEnglish;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: tabViewProvider.tabView,
    );
  }
}
