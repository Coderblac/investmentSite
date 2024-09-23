import 'package:flutter/material.dart';
import 'package:investment/View/about/about_details.dart';
import 'package:investment/View/about/image_details.dart';
import 'package:investment/View/footer/footer.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return  ResponsiveBuilder(
      builder: (context, sizingInformation){
      return Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: sizingInformation.deviceScreenType == DeviceScreenType.desktop
            ? size.width * 0.5
            : sizingInformation.deviceScreenType == DeviceScreenType.tablet
            ? size.width * 0.7
            : size.width,
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               const SizedBox(height: 40,),
              const Text('About Quixel: Revolutionizing Investment Solutions',
                style: TextStyle(fontWeight:  FontWeight.bold),),
               const Text('Quixel is an innovative investment platform designed to empower individuals and businesses with strategic, forward-thinking financial opportunities. By offering a range of investment products and services, Quixel simplifies the complex world of finance, making it accessible to investors at all levels. Our platform is driven by a commitment to provide smart, secure, and efficient financial management tailored to meet the diverse needs of our clients.',
                style: TextStyle(fontWeight:  FontWeight.normal),),
            
              // for Professional Investment Management
               const Column(
                 children: [
                   ImageDetails(
                    heading: 'STRATEGIC\nINNVESTING',
                    subTitleHint: 'Deploying capital towards\nprojects and activities\nexpected to generate\nfinancial returns over time.',
                    imagePath: 'assets/2.png',),
                        // for Strategic Investing
               AboutDetails(heading: 'Strategic Investing',
               subTitle: 'At the core of Quixel\'s mission is the belief in smart investing—deploying capital towards projects and activities expected to generate financial returns over time. We offer investors a wide array of opportunities across sectors that show promise for growth, allowing users to diversify their portfolios and build long-term wealth. Whether you\'re looking to invest in startups, infrastructure projects, or emerging industries, Quixel provides the tools and insights necessary for making informed decisions.'),
                 ],
               ),
                  // for Unaffiliated Investments
               const Column(
                 children: [
                   ImageDetails(
                    heading: 'PROFESSIONAL\nINVESTMENT MANAGEMENT',
                    subTitleHint: 'Our team of experienced\nfinancial professionals ensures that\nyour assets are managed\nwith the utmost diligence.',
                    imagePath: 'assets/3.png',),
                    AboutDetails(heading: 'Professional Investment Management',
                    subTitle: 'Quixel stands apart by offering world-class investment management services. Our team of experienced financial professionals ensures that your assets are managed with the utmost diligence. We prioritize security and performance, applying sophisticated strategies and insights to maximize returns while safeguarding your investments. We understand the importance of protecting your financial future, and our platform utilizes cutting-edge technology to ensure that all transactions are secure and transparent.'),
                 ],
               ),
                       // for Primary Market Opportunities
               const Column(
                 children: [
                   ImageDetails(
                    heading: 'PRIMARY\nMARKET',
                    subTitleHint: 'where new\nstocks and bonds are\nsold to the public\nfor the first time.',
                    imagePath: 'assets/5.png',),
                    AboutDetails(heading: 'Primary Market Opportunities',
                    subTitle: 'Quixel also provides access to the primary market, where new stocks and bonds are sold to the public for the first time. For investors looking to get in on the ground floor of new ventures, this is an ideal space. Our platform enables you to participate in initial public offerings (IPOs) and other first-time sales of securities, ensuring that you can take advantage of growth opportunities as soon as they become available'),
                 ],
               ),
              const Column(
                 children: [
                   ImageDetails(
                    heading: 'UNAFFILIATED\nINVESTMENTS',
                    subTitleHint: ' investment holding of\nan insurance company that\nit neither controls\nnor shares joint ownership with.',
                    imagePath: 'assets/4.png',),
                    AboutDetails(heading: 'Unaffiliated Investments',
                    subTitle: 'One unique offering by Quixel is the option for unaffiliated investments. This category refers to investment holdings of an insurance company that are neither controlled nor jointly owned. For investors seeking independent options or those interested in less conventional opportunities, unaffiliated investments offer an avenue for unique growth without the ties of corporate ownership, providing greater flexibility and diversification in your portfolio.'),
                 ],
               ),
               const SizedBox(height: 40,),
               RichText(
                text:const TextSpan(
                  style: TextStyle(
                    color: Colors.black, // Default text color
                    fontSize: 16.0, // Default font size
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Why Choose Quixel?\n\n',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    TextSpan(
                      text: '• Comprehensive Investment Solutions: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text:
                          'From traditional stocks and bonds to alternative assets and unaffiliated investments, Quixel offers a wide range of options for every type of investor.\n\n',
                    ),
                    TextSpan(
                      text: '• Expert Management: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text:
                          'Our team of financial experts takes the complexity out of investment management, allowing you to focus on what matters most—growing your wealth.\n\n',
                    ),
                    TextSpan(
                      text: '• Secure and Transparent: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text:
                          'Security is our top priority, with advanced technologies in place to protect your investments and provide transparency throughout the process.\n\n',
                    ),
                    TextSpan(
                      text: '• Innovative Opportunities: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text:
                          'Gain access to the primary market and participate in exciting new ventures from the very start.',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40,),
              const Text('At Quixel, we are more than just an investment platform. We are your partner in financial growth, offering the resources, expertise, and security you need to succeed in the world of investing. Whether you’re a seasoned investor or just getting started, Quixel provides a seamless, user-friendly experience that makes it easy to take control of your financial future.',
              softWrap: true,),
              const SizedBox(height: 40,),
              const Footer()
              ],
            ),
          ),
        ),
      );
    });
  }
}