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

List optionsList = [
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
      image: ImageResource.new_all_service_pay_to_contacts),
  allServiceListClass(
      newBool: false,
      title: 'Fund Transfer',
      image: ImageResource.new_all_service_fund_transfer),
  allServiceListClass(
      newBool: true, title: 'UPI', image: ImageResource.new_all_service_upi),
  allServiceListClass(
      newBool: false,
      title: 'Add Funds',
      image: ImageResource.new_all_service_add_funds),
  allServiceListClass(
      newBool: true,
      title: 'Request Money',
      image: ImageResource.new_all_service_request_money),
  allServiceListClass(
      newBool: false,
      title: 'Bill Pay',
      image: ImageResource.new_all_service_bill_pay),
  allServiceListClass(
      newBool: false,
      title: 'Recharge',
      image: ImageResource.new_all_service_recharge),
  allServiceListClass(
      newBool: false,
      title: 'FASTag',
      image: ImageResource.new_all_service_fastag),
  allServiceListClass(
      newBool: false,
      title: 'Offers',
      image: ImageResource.new_all_service_offers),
];

class AllServiceMainModel {
  String? titleName;
  int? noOfRow;
  List<AllServiceChildModel>? listOfIcons;

  AllServiceMainModel(
    String s, {
    this.titleName,
    this.noOfRow,
    this.listOfIcons,
  });
}

class AllServiceChildModel {
  String? name;
  String? icon;
  String? title; // if it new or some update timely

  AllServiceChildModel({
    this.name,
    this.icon,
    this.title,
  });
}

List newAllServiceList = [
  AllServiceMainModel('Payments',
      titleName: 'Payments',
      noOfRow: 2,
      listOfIcons: [
        AllServiceChildModel(
            icon: ImageResource.new_all_service_pay_to_contacts,
            name: 'Pay to \nContacts',
            title: 'Payments'),
        AllServiceChildModel(
            icon: ImageResource.new_all_service_fund_transfer,
            name: 'Fund \nTransfer',
            title: 'Payments'),
        AllServiceChildModel(
            icon: ImageResource.new_all_service_upi,
            name: 'UPI',
            title: 'Payments'),
        AllServiceChildModel(
            icon: ImageResource.new_all_service_add_funds,
            name: 'Add \nFunds',
            title: 'Payments'),
        AllServiceChildModel(
            icon: ImageResource.new_all_service_request_money,
            name: 'Request \nMoney',
            title: 'Payments'),
        AllServiceChildModel(
            icon: ImageResource.new_all_service_apply_for_pockets_card,
            name: 'Apply for \nPockets Card',
            title: 'Payments'),
        AllServiceChildModel(
            icon: ImageResource.new_all_service_scan_to_pay,
            name: 'Scan to \nPay',
            title: 'Payments'),
      ]),
  AllServiceMainModel('Recharge, Bills & Offers',
      titleName: 'Recharge, Bills & Offers',
      noOfRow: 2,
      listOfIcons: [
        AllServiceChildModel(
            icon: ImageResource.new_all_service_bill_pay,
            name: 'Bill Pay',
            title: 'Recharge, Bills & Offers'),
        AllServiceChildModel(
            icon: ImageResource.new_all_service_recharge,
            name: 'Recharge',
            title: 'Recharge, Bills & Offers'),
        AllServiceChildModel(
            icon: ImageResource.new_all_service_fastag,
            name: 'FASTag',
            title: 'Recharge, Bills & Offers'),
        AllServiceChildModel(
            icon: ImageResource.new_all_service_paypal,
            name: 'PayPal',
            title: 'Recharge, Bills & Offers'),
        AllServiceChildModel(
            icon: ImageResource.new_all_service_apply_for_pockets_card,
            name: 'Offers',
            title: 'Recharge, Bills & Offers'),
        AllServiceChildModel(
            icon: ImageResource.new_all_service_scan_to_pay,
            name: 'CashKaro \nEarnings',
            title: 'Recharge, Bills & Offers'),
      ]),
  AllServiceMainModel('Bank', titleName: 'Bank', noOfRow: 1, listOfIcons: [
    AllServiceChildModel(
        icon: ImageResource.new_all_service_pay_to_contacts,
        name: 'Split \nBills',
        title: 'Bank'),
    AllServiceChildModel(
        icon: ImageResource.new_all_service_fund_transfer,
        name: 'Savings \nAccount',
        title: 'Bank'),
    AllServiceChildModel(
        icon: ImageResource.new_all_service_upi,
        name: 'Prepaid \nCard',
        title: 'Bank'),
    AllServiceChildModel(
        icon: ImageResource.new_all_service_upi,
        name: 'Personal \nLoan',
        title: 'Bank'),
    AllServiceChildModel(
        icon: ImageResource.new_all_service_add_funds,
        name: 'Two \nWheeler \nLoan',
        title: 'Bank'),
    AllServiceChildModel(
        icon: ImageResource.new_all_service_pay_to_contacts,
        name: 'Wallet \nProtection \nPlan',
        title: 'Bank'),
    AllServiceChildModel(
        icon: ImageResource.new_all_service_fund_transfer,
        name: 'Card \nProtection \nPlan',
        title: 'Bank'),
    AllServiceChildModel(
        icon: ImageResource.new_all_service_upi,
        name: 'Mutual \nFunds',
        title: 'Bank'),
    AllServiceChildModel(
        icon: ImageResource.new_all_service_add_funds,
        name: 'FD/RD',
        title: 'Bank'),
    AllServiceChildModel(
        icon: ImageResource.new_all_service_request_money,
        name: 'iWish',
        title: 'Bank'),
    AllServiceChildModel(
        icon: ImageResource.new_all_service_apply_for_pockets_card,
        name: 'Paylater',
        title: 'Bank'),
    AllServiceChildModel(
        icon: ImageResource.new_all_service_scan_to_pay,
        name: 'KYC',
        title: 'Bank'),
  ]),
];

List allServiceList = [
  {
    'name': 'Payments',
    'listItem': [
      allServiceListClass(
          newBool: true,
          title: 'Pay to Contacts',
          image: ImageResource.new_all_service_pay_to_contacts),
      allServiceListClass(
          newBool: true,
          title: 'Fund Transfer',
          image: ImageResource.new_all_service_fund_transfer),
      allServiceListClass(
          newBool: true,
          title: 'UPI',
          image: ImageResource.new_all_service_upi),
      allServiceListClass(
          newBool: true,
          title: 'Add Funds',
          image: ImageResource.new_all_service_add_funds),
      allServiceListClass(
          newBool: true,
          title: 'Request Money',
          image: ImageResource.new_all_service_request_money),
      allServiceListClass(
          newBool: true,
          title: 'Apply for Pockets Card',
          image: ImageResource.new_all_service_apply_for_pockets_card),
      allServiceListClass(
          newBool: true,
          title: 'Scan to Pay',
          image: ImageResource.new_all_service_scan_to_pay),
    ]
  },
  {
    'name': 'Recharge, Bills & Offers',
    'listItem': [
      allServiceListClass(
          newBool: true,
          title: 'Bill Pay',
          image: ImageResource.new_all_service_bill_pay),
      allServiceListClass(
          newBool: true,
          title: 'Recharge',
          image: ImageResource.new_all_service_recharge),
      allServiceListClass(
          newBool: true,
          title: 'FASTag',
          image: ImageResource.new_all_service_fastag),
      allServiceListClass(
          newBool: true,
          title: 'PayPal',
          image: ImageResource.new_all_service_paypal),
      allServiceListClass(
          newBool: true,
          title: 'Offers',
          image: ImageResource.new_all_service_offers),
      allServiceListClass(
          newBool: true,
          title: 'Cash Karo Earnings',
          image: ImageResource.new_all_service_cash_karo_earning),
    ]
  },
  {
    'name': 'Bank',
    'listItem': [
      allServiceListClass(
          newBool: true,
          title: 'Split Bills',
          image: ImageResource.new_all_service_split_bills),
      allServiceListClass(
          newBool: true,
          title: 'Savings Account',
          image: ImageResource.new_all_service_savings_account),
      allServiceListClass(
          newBool: true,
          title: 'Prepaid Card',
          image: ImageResource.new_all_service_prepaid_card),
      allServiceListClass(
          newBool: true,
          title: 'Personal Loan',
          image: ImageResource.new_all_service_personal_loan),
      allServiceListClass(
          newBool: true,
          title: 'Two Wheeler Loan',
          image: ImageResource.new_all_service_two_wheeler_loan),
      allServiceListClass(
          newBool: true,
          title: 'Wallet Protection Plan',
          image: ImageResource.new_all_service_wallet_protection_plan),
      allServiceListClass(
          newBool: true,
          title: 'Card Protection Plan',
          image: ImageResource.new_all_service_card_protection_plan),
      allServiceListClass(
          newBool: true,
          title: 'Mutual Funds',
          image: ImageResource.new_all_service_mutual_funds),
      allServiceListClass(
          newBool: true,
          title: 'FD/RD',
          image: ImageResource.new_all_service_fdrd),
      allServiceListClass(
          newBool: true,
          title: 'iWish',
          image: ImageResource.new_all_service_i_wish),
      allServiceListClass(
          newBool: true,
          title: 'Paylater',
          image: ImageResource.new_all_service_pay_later),
      allServiceListClass(
          newBool: true,
          title: 'KYC',
          image: ImageResource.new_all_service_kyc),
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
