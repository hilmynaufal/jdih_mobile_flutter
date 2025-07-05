// import 'package:beladiri_flutter/screens/buat_surat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AbstractMainDashboardPage extends StatelessWidget {
  const AbstractMainDashboardPage({
    super.key,
    required this.title,
  });

  final String title;

  Widget buildWidgetWithSliverAppBar(BuildContext context,
      {required Widget body,
      required double expandedAppBarHeight,
      required Widget appbarItem,
      FloatingActionButton? fab}) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Scaffold(
        floatingActionButton: fab,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: false,
                backgroundColor: theme.primaryColor,
                snap: false,
                expandedHeight: expandedAppBarHeight,
                foregroundColor: theme.colorScheme.onPrimary,
                toolbarHeight: 40,
                pinned: true,
                titleSpacing: 8,
                primary: true,
                // collapsedHeight: 40,
                centerTitle: true,
                title: Row(
                  children: [
                    Icon(Icons.mail),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    background: appbarItem),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(60),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: theme.scaffoldBackgroundColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(10)),
                        width: 60,
                        height: 8,
                      ),
                    ),
                  ),
                ),
              ),
              body
            ],
          ),
        ));
  }

  Widget buildWidgetWithAppbar(BuildContext context,
      {required Widget body, FloatingActionButton? fab}) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Scaffold(
      backgroundColor: theme.primaryColor,
      appBar: AppBar(
        title: Text(title),
        backgroundColor: theme.primaryColor,
        foregroundColor: theme.colorScheme.onPrimary,
      ),
      floatingActionButton: fab,
      body: SafeArea(child: LayoutBuilder(builder: (context, constraint) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: theme.colorScheme.onPrimary,
                    borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(20),
                        topEnd: Radius.circular(20))),
                child: body),
          ),
        );
      })),
    );
  }
}

class AppBarBoxItem extends StatelessWidget {
  const AppBarBoxItem({
    super.key,
    required this.theme,
    required this.textTheme,
    required this.title,
    required this.description,
    required this.buttonTitle,
    required this.onTap,
  });

  final ThemeData theme;
  final TextTheme textTheme;
  final String title, description, buttonTitle;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Card(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.fiber_new_rounded,
                    color: theme.primaryColor,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    title,
                    style: textTheme.titleSmall!
                        .copyWith(fontWeight: FontWeight.w600),
                  )
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                description,
                style:
                    textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w300),
              ),
              Spacer(),
              ElevatedButton(
                  onPressed: () {
                    // Get.to(() => BuatSuratScreen());
                    onTap();
                  },
                  style: ElevatedButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      minimumSize: Size(0, 0),
                      surfaceTintColor: theme.colorScheme.onPrimary,
                      backgroundColor: theme.primaryColor,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 4)),
                  child: Text(
                    buttonTitle,
                    style: textTheme.bodySmall!
                        .copyWith(color: theme.colorScheme.onPrimary),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
