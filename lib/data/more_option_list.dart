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
      image: ImageResource.PaytoContactsImg),
  allServiceListClass(
      newBool: false,
      title: 'Fund Transfer',
      image: ImageResource.FundTransferImg),
  allServiceListClass(newBool: true, title: 'UPI', image: ImageResource.UPIImg),
  allServiceListClass(
      newBool: false, title: 'Add Funds', image: ImageResource.AddFundsImg),
  allServiceListClass(
      newBool: true,
      title: 'Request Money',
      image: ImageResource.RequestMoneyImg),
  allServiceListClass(
      newBool: false, title: 'Bill Pay', image: ImageResource.BillPayImg),
  allServiceListClass(
      newBool: false, title: 'Recharge', image: ImageResource.RechargeImg),
  allServiceListClass(
      newBool: false, title: 'FASTag', image: ImageResource.FASTagImg),
  allServiceListClass(
      newBool: false, title: 'Offers', image: ImageResource.OffersImg),
];

List allServiceList = [
  {
    'name': 'Payments',
    'listItem': [
      allServiceListClass(
          newBool: true,
          title: 'Pay to Contacts',
          image: ImageResource.PaytoContactsImg),
      allServiceListClass(
          newBool: true,
          title: 'Fund Transfer',
          image: ImageResource.FundTransferImg),
      allServiceListClass(
          newBool: true, title: 'UPI', image: ImageResource.UPIImg),
      allServiceListClass(
          newBool: true, title: 'Add Funds', image: ImageResource.AddFundsImg),
      allServiceListClass(
          newBool: true,
          title: 'Request Money',
          image: ImageResource.RequestMoneyImg),
      allServiceListClass(
          newBool: true,
          title: 'Apply for Pockets Card',
          image: ImageResource.ApplyforPocketsCardImg),
      allServiceListClass(
          newBool: true,
          title: 'Scan to Pay',
          image: ImageResource.ScantoPayImg),
    ]
  },
  {
    'name': 'Recharge, Bills & Offers',
    'listItem': [
      allServiceListClass(
          newBool: true, title: 'Bill Pay', image: ImageResource.BillPayImg),
      allServiceListClass(
          newBool: true, title: 'Recharge', image: ImageResource.RechargeImg),
      allServiceListClass(
          newBool: true, title: 'FASTag', image: ImageResource.FASTagImg),
      allServiceListClass(
          newBool: true, title: 'PayPal', image: ImageResource.PayPalImg),
      allServiceListClass(
          newBool: true, title: 'Offers', image: ImageResource.OffersImg),
      allServiceListClass(
          newBool: true,
          title: 'Cash Karo Earnings',
          image: ImageResource.CashKaroEarningsImg),
    ]
  },
  {
    'name': 'Bank',
    'listItem': [
      allServiceListClass(
          newBool: true,
          title: 'Split Bills',
          image: ImageResource.SplitBillsImg),
      allServiceListClass(
          newBool: true,
          title: 'Savings Account',
          image: ImageResource.SavingsAccountImg),
      allServiceListClass(
          newBool: true,
          title: 'Prepaid Card',
          image: ImageResource.PrepaidCardImg),
      allServiceListClass(
          newBool: true,
          title: 'Personal Loan',
          image: ImageResource.PersonalLoanImg),
      allServiceListClass(
          newBool: true,
          title: 'Two Wheeler Loan',
          image: ImageResource.TwoWheelerLoanImg),
      allServiceListClass(
          newBool: true,
          title: 'Wallet Protection Plan',
          image: ImageResource.WalletProtectionPlanImg),
      allServiceListClass(
          newBool: true,
          title: 'Card Protection Plan',
          image: ImageResource.CardProtectionPlanImg),
      allServiceListClass(
          newBool: true,
          title: 'Mutual Funds',
          image: ImageResource.MutualFundsImg),
      allServiceListClass(
          newBool: true, title: 'FD/RD', image: ImageResource.FDRDImg),
      allServiceListClass(
          newBool: true, title: 'iWish', image: ImageResource.iWishImg),
      allServiceListClass(
          newBool: true, title: 'Paylater', image: ImageResource.PaylaterImg),
      allServiceListClass(
          newBool: true, title: 'KYC', image: ImageResource.KYCImg),
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
