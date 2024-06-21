import 'package:flutter/material.dart';
import 'package:food_preorder_app/Constants/Color.dart';
import 'package:food_preorder_app/Constants/Text.dart';
import 'package:food_preorder_app/Screens/Home/popUpCalendarSelector.dart';
import 'package:food_preorder_app/Screens/Login/LoginScreen.dart';
import 'package:food_preorder_app/Widgets/Button.dart';
import 'package:food_preorder_app/Widgets/HomeScreenCalendarView.dart';
import 'package:food_preorder_app/Widgets/OrdersWidget.dart';
import 'package:food_preorder_app/Widgets/Popups/SnackBarWidget.dart';
import 'package:food_preorder_app/Widgets/UserlogButton.dart';
import 'package:food_preorder_app/dates.dart';
int  no_of_orders= 0;
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   @override
   void initState(){
    super.initState();

    
   }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Image.asset(
            "assets/Icons/IVA_Logo.png",
            scale: 4,
          ),
          flexibleSpace: Stack(children: [
            Positioned(
                right: 0,
                bottom: 0,
                top: 0,
                child:
                    Image.asset("assets/Page_Assets/appbar_bananna_leaf.png"))
          ]),
          actions: [
            IconButton(
                onPressed: () {
                  // SnackbarHelper.showSnackbar(context,
                  // title: "Not implemented!!",
                  // message: "Logout function not yet implemented yet ",
                  // icon: Icons.dangerous_outlined,
                  // color: Colors.red);
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Loginscreen()), (route)=>false);
                  SnackbarHelper.showSnackbar(context, message: "Logged Out!", icon: Icons.check_box, color: Colors.green);
                },
                icon: Icon(Icons.logout_outlined, color: Kivawhite)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 19),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hello Techno!", style: Kmaintext),
                const SizedBox(height: 24),
                 NumberOfOrders(numberOfOrders: getFutureDates(dates).length),
                const SizedBox(height: 24),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Your orders:",
                          style: Ksecondarytext.copyWith(
                              fontWeight: FontWeight.w500)),
                      const UserLogButton(),
                      
                    ]),
                const SizedBox(height: 16),
                // Container(
                //  constraints: BoxConstraints(
                //       maxHeight: 400.0, // Adjust height as needed
                //       maxWidth: 400.0, // Adjust width as needed
                //     ),
                  
                //   child: StaticCalendarView()),
                Container(
                  
                  child: StaticCalendar(highlightedDates:dates,isInteractive: false,),
                ),
            
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Button(Navigation: (){
                     Navigator.pop(context);
                     ShowSelectorCalendar(context);
            
                    }, fontSize: 15, textColor: Kivawhite, textStyle: "Poppins", size:const Size(150,40), customWidget: Text("Order/Modify",style:Ksecondarytext.copyWith(color: Colors.white))),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
