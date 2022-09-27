import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ritika/utilities/constants.dart';

import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(
    ritika(),
  );
}

class ritika extends StatelessWidget {
  const ritika({Key? key}) : super(key: key);

  Future<void> _openUrl(String url) async {
    final isLaunchable = await canLaunch(url);
    if (isLaunchable) {
      launch(url);
    }
  }

  Widget _header() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(height: 32),
          CircleAvatar(
            backgroundImage: AssetImage('assets/ritikap.png'),
            radius: 100,
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              " I'm Ritika Sinha\n"
              "Phone no.- 8700747618\n"
              "Email- ritisinha272@gmail.com\n"
              "DoB- 27/04/2003\n"
              "Address- Shree Krishna Apartment, sector- 16, Rohini, New Delhi \n",
              style: TextStyle(
                // color: kDarkGrey,
                color: kDarkGrey,
                fontSize: kIsWeb ? 22.0 : 18.0,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "A software Engineer passionate about building web and mobile applications\n"
              "Education- "
              "I am pursuing BTech. in Information Technology from Panipat Institute Of Engineering and Technology.    (2019-2023)\n"
              " I did my 12th form Himalaya Public School (Delhi)          (2019)\n"
              "  I did my 10th form Merry International School(Delhi)      (2017) \n",
              style: TextStyle(
                color: kDarkGrey,
                fontWeight: FontWeight.bold,
                fontSize: kIsWeb ? 28.0 : 22.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16.0),
          Wrap(
            spacing: 16.0,
            runSpacing: 16.0,
            alignment: WrapAlignment.center,
            children: [
              IconButton(
                onPressed: () => _openUrl(
                    "https://www.linkedin.com/in/ritika-sinha-522351218/"),
                icon: const FaIcon(
                  FontAwesomeIcons.linkedin,
                  color: kBlueColor,
                ),
              ),
              IconButton(
                onPressed: () => _openUrl("https://github.com/Ritika2704"),
                icon: const FaIcon(
                  FontAwesomeIcons.github,
                  color: kBlueColor,
                ),
              ),
              IconButton(
                onPressed: () =>
                    _openUrl("https://www.instagram.com/riti_sinha27_/"),
                icon: const FaIcon(
                  FontAwesomeIcons.instagram,
                  color: kBlueColor,
                ),
              ),
              IconButton(
                onPressed: () => _openUrl(
                    "https://www.facebook.com/profile.php?id=100009226526297"),
                icon: const FaIcon(
                  FontAwesomeIcons.facebook,
                  color: kBlueColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _badges() {
    const technologies = [
      'javascript',
      'react',
      'flutter',
      'java',
      'csharp',
      'css',
      'html',
      'php',
      'mongo',
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: technologies
            .map(
              (technology) => Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/badges/$technology.png',
                        width: 48.0,
                      ),
                      const SizedBox(height: 4.0),
                      Text(technology),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _renderProjectCard({
    required String imageUrl,
    required String title,
    required String description,
    String? visitLink,
  }) {
    return Container(
      constraints: BoxConstraints(maxWidth: 350),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: const BorderSide(
            color: kDarkGrey,
          ),
        ),
        elevation: 2,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          children: [
            Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              height: 200,
              width: 350,
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: kDarkGrey,
                        fontWeight: FontWeight.w800,
                        fontSize: 20.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ),
            if (visitLink != null)
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, bottom: 16.0, right: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                ),
              )
          ],
        ),
      ),
    );
  }

  Widget _projects() {
    return Container(
      color: kLightGrey,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 52.0, horizontal: 16.0),
      child: Column(
        children: [
          const Text(
            'Projects',
            style: TextStyle(
              color: kDarkGrey,
              fontSize: 28.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Wrap(
            spacing: 16.0,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              _renderProjectCard(
                imageUrl: 'assets/projects/hpage.png',
                title: 'Chat App',
                description: 'UX/UI design of a Chat App',
              ),
              _renderProjectCard(
                imageUrl: 'assets/projects/project.png',
                title: 'Gymplex',
                description: 'UX/UI design of gym app by Figma',
              ),
              _renderProjectCard(
                imageUrl: 'assets/projects/projectEv.png',
                title: 'Online Voting System',
                description:
                    'This is the online voting system for small organisation. This is my B.Tech 3rd year project.\n'
                    'In this project we consist 3 members.\n This project is mainly to conduct voting online and hassle free conduction of votin in an organisation. ',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _Internship() {
    return Container(
      color: kBlackColor,
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          Text(
            'I did my Internship from Summit Technology pvt.Ltd. on a profile of Web Developer.\n '
            'I learn so many new things there as C# , .net Framework and many other things \n',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _Hobbies() {
    return Container(
      color: kBlackColor,
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          Text(
            'My Hobby is read Books, Novels and favourite genre is Self Help because I love learn new things about personality or about in general humans. \n',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _footer() {
    return Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          Text(
            ' Ritika Sinha',
            style: TextStyle(
              color: Colors.brown,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'FiraCode',
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: 800),
                child: Column(
                  children: [
                    _header(),
                    const SizedBox(height: 24.0),
                    _badges(),
                  ],
                ),
              ),
              const SizedBox(height: 32.0),
              _projects(),
              const SizedBox(height: 24.0),
              _Internship(),
              const SizedBox(height: 24.0),
              _Hobbies(),
              _footer(),
            ],
          ),
        ),
      ),
    );
  }
}
