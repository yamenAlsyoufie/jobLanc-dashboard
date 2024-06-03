import 'package:flutter/material.dart';
import 'package:get/get.dart';

class localization extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static const fallbackLocale = Locale('en', 'US');
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          //choose language page in english
          '1': 'Choose your language',
          '2': 'Arabic',
          '3': 'English',
          '4': 'Continue',
          //_________________________________________________________________________________
          //intro pages
          //A.home page
          '5': 'Home Page',
          '6':
              'Display an overview of the application and view the job offers available on the app with the possibility of deleting any job offer',
          //B.statistics page
          '7': 'Statistics page',
          '8':
              'display flow chart diagram about best companies in the app and the most people add tasks in the app and display number of user in the app in every month',
          //C.Wallet page
          '9': 'Wallet Page',
          '10':
              'display all users and their wallet, and you can add the balance to any users in this page',
          //D.add category
          '11': 'Add Category page',
          '12': 'Adding category or skills and display it in user app',
          //E.settings
          '13': 'Settings page',
          '14':
              'restart password if you forget it,controller in dark or light mode and managing and administration the reports',
          //Login Page
          '15': 'Welcom to admin app',
          '16': 'Email',
          '17': 'Password',
          '18': 'Login',
          '19': 'Number of User in your app is:',
          //Home Page
          '20': 'Number of Company in your app is:',
          '21': 'Number of tasks in your app is:',
          '22':'Company Jobs',
          '23':'Tasks'
        },
        'ar': {
          //choose language page in arabic
          '1': 'اختر لغتك',
          '2': 'العربية',
          '3': 'الإنجليزية',
          '4': 'استمر',
          //_________________________________________________________________________________
          //intro pages
          //A.home page
          '5': 'الصفحة الرئيسية',
          '6':
              'عرض ملخص عن التطبيق و عرض عروض العمل الموجودة على التطبيق مع امكانية حذف أي عرض عمل',
          //B.statistics page
          '7': 'صفحة الأحصائيات',
          '8':
              'عرض رسم تخطيطي حول أفضل الشركات في التطبيق وأكثر الأشخاص إضافة مهام في التطبيق وعرض عدد المستخدمين في التطبيق في كل شهر',
          //C.Wallet page
          '9': 'صفحة المحفظة',
          '10':
              'عرض جميع المستخدمين ومحفظتهم، ويمكنك إضافة الرصيد لأي مستخدم في هذه الصفحة',
          //D.add category
          '11': 'اضافة فئة',
          '12': 'إضافة فئة أو مهارات وعرضها في تطبيق المستخدم',
          //E.settings
          '13': 'صفحة الاعدادات',
          '14':'إعادة تعيين كلمة المرور إذا نسيتها، وتحكم في الوضع المظلم أو الفاتح وإدارة التقارير وإدارتها',
          //Login Page
          '15': 'مرحبا في تطبيق المشرف',
          '16': 'البريد الإلكتروني',
          '17': 'كلمة السر',
          '18': 'تسجيل الدخول',
          //Home Page
          '19': ':عدد المستخدمين في تطبيقك هو',
          '20': ':عدد الشركات في تطبيقك هو',
          '21': ':عدد المهام في تطبيقك هو',
          '22':'فرص عمل الشركات',
          '23':'المهمات',
        },
      };
}