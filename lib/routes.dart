import 'package:flutter/widgets.dart';
import 'package:JDPoolsApplication/screens/cart/cart_screen.dart';
import 'package:JDPoolsApplication/screens/complete_profile/complete_profile_screen.dart';
import 'package:JDPoolsApplication/screens/profile/complete_profile/complete_profile_screen.dart';
import 'package:JDPoolsApplication/screens/details/details_screen.dart';
import 'package:JDPoolsApplication/screens/cart/details/details_screen.dart';
import 'package:JDPoolsApplication/screens/forgot_password/forgot_password_screen.dart';
import 'package:JDPoolsApplication/screens/home/home_screen.dart';
import 'package:JDPoolsApplication/screens/login_success/login_success_screen.dart';
import 'package:JDPoolsApplication/screens/otp/otp_screen.dart';
import 'package:JDPoolsApplication/screens/profile/profile_screen.dart';
import 'package:JDPoolsApplication/screens/sign_in/sign_in_screen.dart';
import 'package:JDPoolsApplication/screens/splash/splash_screen.dart';
import 'package:JDPoolsApplication/screens/home.dart';
import 'package:JDPoolsApplication/screens/homepage_poolman.dart';
import 'package:JDPoolsApplication/screens/history/history_screen.dart';

import 'package:JDPoolsApplication/screens/job/job_screen.dart';
import 'package:JDPoolsApplication/screens/job_list/job_list_screen.dart';

import 'package:JDPoolsApplication/screens/job_detail/job_detail_screen.dart';
import 'package:JDPoolsApplication/screens/check_list/check_list_screen.dart';
import 'package:JDPoolsApplication/screens/check_list_result/check_list_result_screen.dart';

import 'package:JDPoolsApplication/screens/history_payment/history_payment_screen.dart';
import 'package:JDPoolsApplication/screens/mail/mail_screen.dart';
import 'package:JDPoolsApplication/screens/pool_information/pool_information_screen.dart';
import 'package:JDPoolsApplication/screens/quality_page/quality_page_screen.dart';
import 'package:JDPoolsApplication/screens/edit_profile/edit_profile_screen.dart';
import 'package:JDPoolsApplication/screens/voucher/voucher_screen.dart';
import 'package:JDPoolsApplication/screens/my_voucher/my_voucher_screen.dart';
import 'package:JDPoolsApplication/screens/agree_page/agree_page_screen.dart';
import 'package:JDPoolsApplication/screens/payment/credit_card_page.dart';
import 'package:JDPoolsApplication/screens/payment/payment_success_page.dart';

import 'package:JDPoolsApplication/screens/edit_address/edit_address_screen.dart';
import 'package:JDPoolsApplication/screens/cart/otp/otp_screen.dart';
import 'package:JDPoolsApplication/screens/cart/complete_profile/complete_profile_screen.dart';
import 'package:JDPoolsApplication/screens/cart/sign_up/sign_up_screen.dart';
import 'package:JDPoolsApplication/screens/cart/sign_in/sign_in_screen.dart';
import 'package:JDPoolsApplication/screens/pool_list/pool_list_screen.dart';

import 'package:JDPoolsApplication/screens/notice/notice_screen.dart';
import 'package:JDPoolsApplication/screens/shop/shop_screen.dart';
import 'package:JDPoolsApplication/screens/step.dart';
import 'screens/sign_up/sign_up_screen.dart';
import 'screens/bloc/bloc.dart';
import 'screens/page/Gmap_page.dart';
import 'screens/page/main_gmap.dart';
// import 'package:JDPoolsApplication/splash_screen.dart';
// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SignInCartScreen.routeName: (context) => SignInCartScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  SignUpCartScreen.routeName: (context) => SignUpCartScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  CompleteProfileEditScreen.routeName: (context) => CompleteProfileEditScreen(),
  CompleteProfileCartScreen.routeName: (context) => CompleteProfileCartScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  OtpCartScreen.routeName: (context) => OtpCartScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  DetailsCartScreen.routeName: (context) => DetailsCartScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  historyScreen.routeName: (context) => historyScreen(),
  jobScreen.routeName: (context) => jobScreen(),
  jobListScreen.routeName: (context) => jobListScreen(),

  jobDetailScreen.routeName: (context) => jobDetailScreen(),
  checkListScreen.routeName: (context) => checkListScreen(),
  checkListResultScreen.routeName: (context) => checkListResultScreen(),
  MyHomePageFirst.routeName: (context) => MyHomePageFirst(),
  MyHomePagePoolman.routeName: (context) => MyHomePagePoolman(),
  MyAppGmap.routeName: (context) => MyAppGmap(),
  MailScreen.routeName: (context) => MailScreen(),
  PoolInformationScreen.routeName: (context) => PoolInformationScreen(),
  QualityPageScreen.routeName: (context) => QualityPageScreen(),
  voucherScreen.routeName: (context) => voucherScreen(),
  myVoucherScreen.routeName: (context) => myVoucherScreen(),
  EditProfileScreen.routeName: (context) => EditProfileScreen(),
  EditAddressScreen.routeName: (context) => EditAddressScreen(),
  AgreePageScreen.routeName: (context) => AgreePageScreen(),
  PoolListScreen.routeName: (context) => PoolListScreen(),
  CreditCardPage.routeName: (context) => CreditCardPage(),
  PaymentSuccessPage.routeName: (context) => PaymentSuccessPage(),
  historyPaymentScreen.routeName: (context) => historyPaymentScreen(),
  NoticeScreen.routeName: (context) => NoticeScreen(),

  shopScreen.routeName: (context) => shopScreen(),
  StepperDemo.routeName: (context) => StepperDemo(product: null),
};
