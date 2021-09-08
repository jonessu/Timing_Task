import 'package:assessment/screens/refer_earn_screen/refer_earn_screen.dart';
import 'package:assessment/utils/image_resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List cardThemeList = [
  {
    'image': 'images/card1.png',
  },
  {
    'image': 'images/card2.png',
  },
  {
    'image': 'images/card1.png',
  },
];

List list = [
  {
    'name': 'Security',
    'listItem': [
      {
        'image': 'images/face_auth.png',
        'text': 'Secure with Face ID',
        'colour': Color(0xff222222),
        'onClicked': () {}
      },
      {
        'image': 'images/change_passcode.png',
        'text': 'Change Passcode',
        'icon': FontAwesomeIcons.chevronRight,
        'colour': Color(0xff222222),
        'onClicked': () {}
      },
    ]
  },
  {
    'name': 'Support',
    'listItem': [
      {
        'image': 'images/faq.png',
        'text': 'FAQ',
        'icon': FontAwesomeIcons.chevronRight,
        'colour': Color(0xff222222),
        'onClicked': () {}
      },
      {
        'image': 'images/support.png',
        'text': 'Support',
        'icon': FontAwesomeIcons.chevronRight,
        'colour': Color(0xff222222),
        'onClicked': () {}
      },
    ]
  },
  {
    'name': 'More Options',
    'listItem': [
      {
        'image': 'images/refer.png',
        'text': 'Refer & Earn',
        'icon': FontAwesomeIcons.chevronRight,
        'colour': Color(0xff222222),
        'onClicked': () {}
      },
      {
        'image': 'images/rateus.png',
        'text': 'Rate us',
        'icon': FontAwesomeIcons.chevronRight,
        'colour': Color(0xff222222),
        'onClicked': () {}
      },
      {
        'image': 'images/manage.png',
        'text': 'Manage Notifications',
        'icon': FontAwesomeIcons.chevronRight,
        'colour': Color(0xff222222),
        'onClicked': () {}
      },
      {
        'image': 'images/terms.png',
        'text': 'Terms & Contidions',
        'icon': FontAwesomeIcons.chevronRight,
        'colour': Color(0xff222222),
        'onClicked': () {}
      },
      {
        'image': 'images/useragree.png',
        'text': 'User Agreement',
        'icon': FontAwesomeIcons.chevronRight,
        'colour': Color(0xff222222),
        'onClicked': () {}
      },
      {
        'image': 'images/logout.png',
        'text': 'Logout',
        'icon': null,
        'colour': Color(0xffF92538),
        'onClicked': () {}
      }
    ]
  },
];

List trendServiceList = [
  allServiceListClass(
      newBool: true,
      title: 'Pay to Contacts',
      image: ImageResource.all_service_pay_to_contacts),
  allServiceListClass(
      newBool: false,
      title: 'Fund Transfer',
      image: ImageResource.all_service_fund_transfer),
  allServiceListClass(
      newBool: true, title: 'UPI', image: ImageResource.all_service_upi),
  allServiceListClass(
      newBool: false,
      title: 'Add Funds',
      image: ImageResource.all_service_add_funds),
  allServiceListClass(
      newBool: true,
      title: 'Request Money',
      image: ImageResource.all_service_request_money),
  allServiceListClass(
      newBool: false,
      title: 'Bill Pay',
      image: ImageResource.all_service_bill_pay),
  allServiceListClass(
      newBool: false,
      title: 'Recharge',
      image: ImageResource.all_service_recharge),
  allServiceListClass(
      newBool: false, title: 'FASTag', image: ImageResource.all_service_fastag),
  allServiceListClass(
      newBool: false, title: 'Offers', image: ImageResource.all_service_offers),
];

List allServiceList = [
  {
    'name': 'Payments',
    'listItem': [
      allServiceListClass(
          newBool: true,
          title: 'Pay to Contacts',
          image: ImageResource.all_service_pay_to_contacts),
      allServiceListClass(
          newBool: true,
          title: 'Fund Transfer',
          image: ImageResource.all_service_fund_transfer),
      allServiceListClass(
          newBool: true, title: 'UPI', image: ImageResource.all_service_upi),
      allServiceListClass(
          newBool: true,
          title: 'Add Funds',
          image: ImageResource.all_service_add_funds),
      allServiceListClass(
          newBool: true,
          title: 'Request Money',
          image: ImageResource.all_service_request_money),
      allServiceListClass(
          newBool: true,
          title: 'Apply for Pockets Card',
          image: ImageResource.all_service_apply_for_pockets_card),
      allServiceListClass(
          newBool: true,
          title: 'Scan to Pay',
          image: ImageResource.all_service_scan_to_pay),
    ]
  },
  {
    'name': 'Recharge, Bills & Offers',
    'listItem': [
      allServiceListClass(
          newBool: true,
          title: 'Bill Pay',
          image: ImageResource.all_service_bill_pay),
      allServiceListClass(
          newBool: true,
          title: 'Recharge',
          image: ImageResource.all_service_recharge),
      allServiceListClass(
          newBool: true,
          title: 'FASTag',
          image: ImageResource.all_service_fastag),
      allServiceListClass(
          newBool: true,
          title: 'PayPal',
          image: ImageResource.all_service_paypal),
      allServiceListClass(
          newBool: true,
          title: 'Offers',
          image: ImageResource.all_service_offers),
      allServiceListClass(
          newBool: true,
          title: 'Cash Karo Earnings',
          image: ImageResource.all_service_cash_karo_earning),
    ]
  },
  {
    'name': 'Bank',
    'listItem': [
      allServiceListClass(
          newBool: true,
          title: 'Split Bills',
          image: ImageResource.all_service_split_bills),
      allServiceListClass(
          newBool: true,
          title: 'Savings Account',
          image: ImageResource.all_service_savings_account),
      allServiceListClass(
          newBool: true,
          title: 'Prepaid Card',
          image: ImageResource.all_service_prepaid_card),
      allServiceListClass(
          newBool: true,
          title: 'Personal Loan',
          image: ImageResource.all_service_personal_loan),
      allServiceListClass(
          newBool: true,
          title: 'Two Wheeler Loan',
          image: ImageResource.all_service_two_wheeler_loan),
      allServiceListClass(
          newBool: true,
          title: 'Wallet Protection Plan',
          image: ImageResource.all_service_wallet_protection_plan),
      allServiceListClass(
          newBool: true,
          title: 'Card Protection Plan',
          image: ImageResource.all_service_card_protection_plan),
      allServiceListClass(
          newBool: true,
          title: 'Mutual Funds',
          image: ImageResource.all_service_mutual_funds),
      allServiceListClass(
          newBool: true, title: 'FD/RD', image: ImageResource.all_service_fdrd),
      allServiceListClass(
          newBool: true,
          title: 'iWish',
          image: ImageResource.all_service_i_wish),
      allServiceListClass(
          newBool: true,
          title: 'Paylater',
          image: ImageResource.all_service_pay_later),
      allServiceListClass(
          newBool: true, title: 'KYC', image: ImageResource.all_service_kyc),
    ]
  }
];

class allServiceListClass {
  const allServiceListClass(
      {required this.newBool, required this.title, required this.image});
  final bool newBool;
  final String title;
  final String image;
}

const List<allServiceListClass> choices = const <allServiceListClass>[
  allServiceListClass(
      newBool: true,
      title: 'Pay to Contacts',
      image: ImageResource.PaytoContactsIcon),
  allServiceListClass(
      newBool: true,
      title: 'Fund Transfer',
      image: ImageResource.FundTransferIcon),
  allServiceListClass(
      newBool: true, title: 'UPI', image: ImageResource.UpiIcon),
  allServiceListClass(
      newBool: true, title: 'Add Funds', image: ImageResource.AddFundsIcon),
  allServiceListClass(
      newBool: true,
      title: 'Request Money',
      image: ImageResource.RequestMoneyIcon),
  allServiceListClass(
      newBool: true,
      title: 'Fund Transfer',
      image: ImageResource.FundTransferIcon),
  allServiceListClass(
      newBool: true, title: 'UPI', image: ImageResource.UpiIcon),
  allServiceListClass(
      newBool: true, title: 'Add Funds', image: ImageResource.AddFundsIcon),
  allServiceListClass(
      newBool: true,
      title: 'Request Money',
      image: ImageResource.RequestMoneyIcon),
];
