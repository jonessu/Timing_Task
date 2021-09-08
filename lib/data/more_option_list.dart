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
  List<AllServiceChildModel>? ListOfIcons;

  AllServiceMainModel(
    String s, {
    this.titleName,
    this.noOfRow,
    this.ListOfIcons,
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
      ListOfIcons: [
        AllServiceChildModel(
            icon: ImageResource.new_all_service_pay_to_contacts,
            name: 'Pay to Contacts',
            title: 'Pay to Contacts'),
        AllServiceChildModel(
            icon: ImageResource.new_all_service_fund_transfer,
            name: 'Fund Transfer',
            title: 'Fund Transfer'),
        AllServiceChildModel(
            icon: ImageResource.new_all_service_upi, name: 'UPI', title: 'UPI'),
        AllServiceChildModel(
            icon: ImageResource.new_all_service_add_funds,
            name: 'Add Funds',
            title: 'Add Funds'),
        AllServiceChildModel(
            icon: ImageResource.new_all_service_request_money,
            name: 'Request Money',
            title: 'Request Money'),
        AllServiceChildModel(
            icon: ImageResource.new_all_service_apply_for_pockets_card,
            name: 'Apply for Pockets Card',
            title: 'Apply for Pockets Card'),
        AllServiceChildModel(
            icon: ImageResource.new_all_service_scan_to_pay,
            name: 'Scan to Pay',
            title: 'Scan to Pay'),
      ]),
  AllServiceMainModel('Recharge, Bills & Offers',
      titleName: 'Recharge, Bills & Offers',
      noOfRow: 2,
      ListOfIcons: [
        AllServiceChildModel(
            icon: ImageResource.new_all_service_bill_pay,
            name: 'Bill Pay',
            title: 'Bill Pay'),
        AllServiceChildModel(
            icon: ImageResource.new_all_service_recharge,
            name: 'Recharge',
            title: 'Recharge'),
        AllServiceChildModel(
            icon: ImageResource.new_all_service_fastag,
            name: 'FASTag',
            title: 'FASTag'),
        AllServiceChildModel(
            icon: ImageResource.new_all_service_paypal,
            name: 'PayPal',
            title: 'PayPal'),
        AllServiceChildModel(
            icon: ImageResource.new_all_service_apply_for_pockets_card,
            name: 'Offers',
            title: 'Offers'),
        AllServiceChildModel(
            icon: ImageResource.new_all_service_scan_to_pay,
            name: 'Cash Karo Earnings',
            title: 'Cash Karo Earnings'),
      ]),
  AllServiceMainModel('Payments', titleName: 'Bank', noOfRow: 1, ListOfIcons: [
    AllServiceChildModel(
        icon: ImageResource.new_all_service_pay_to_contacts,
        name: 'Split Bills',
        title: 'Split Bills'),
    AllServiceChildModel(
        icon: ImageResource.new_all_service_fund_transfer,
        name: 'Savings Account',
        title: 'Savings Account'),
    AllServiceChildModel(
        icon: ImageResource.new_all_service_upi,
        name: 'Prepaid Card',
        title: 'Prepaid Card'),
    AllServiceChildModel(
        icon: ImageResource.new_all_service_upi,
        name: 'Personal Loan',
        title: 'Personal Loan'),
    AllServiceChildModel(
        icon: ImageResource.new_all_service_add_funds,
        name: 'Two Wheeler Loan',
        title: 'Two Wheeler Loan'),
    AllServiceChildModel(
        icon: ImageResource.new_all_service_pay_to_contacts,
        name: 'Wallet Protection Plan',
        title: 'Wallet Protection Plan'),
    AllServiceChildModel(
        icon: ImageResource.new_all_service_fund_transfer,
        name: 'Card Protection Plan',
        title: 'Card Protection Plan'),
    AllServiceChildModel(
        icon: ImageResource.new_all_service_upi,
        name: 'Mutual Funds',
        title: 'Mutual Funds'),
    AllServiceChildModel(
        icon: ImageResource.new_all_service_add_funds,
        name: 'FD/RD',
        title: 'FD/RD'),
    AllServiceChildModel(
        icon: ImageResource.new_all_service_request_money,
        name: 'iWish',
        title: 'iWish'),
    AllServiceChildModel(
        icon: ImageResource.new_all_service_apply_for_pockets_card,
        name: 'Paylater',
        title: 'Paylater'),
    AllServiceChildModel(
        icon: ImageResource.new_all_service_scan_to_pay,
        name: 'KYC',
        title: 'KYC'),
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
