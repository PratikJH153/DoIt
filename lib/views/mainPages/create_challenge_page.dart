import 'package:challengeapp/widgets/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateChallengePage extends StatefulWidget {
  const CreateChallengePage({Key? key}) : super(key: key);

  @override
  _CreateChallengePageState createState() => _CreateChallengePageState();
}

class _CreateChallengePageState extends State<CreateChallengePage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: isLoading
            ? CircularProgressIndicator()
            : FloatingActionButton.extended(
                backgroundColor: const Color(0xFF52bf92),
                onPressed: () {},
                label: Row(
                  children: const [
                    Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                    ),
                    Text(
                      "Create Challenge",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
      ),
      body: Container(
        padding: const EdgeInsets.only(
          top: 50,
          left: 20,
          right: 20,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create a Challenge 🚀",
                      style: kAppTitleTextStyle.copyWith(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      "Let's grow with others!",
                      style: kIntroTextStyle.copyWith(
                        color: Colors.grey[500],
                        fontSize: 15,
                        wordSpacing: 2,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF292929),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.checkmark_alt,
                    ),
                  ),
                )
              ],
            ),
            Container(
              // padding: const EdgeInsets.symmetric(vertical: 10),
              margin: const EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                color: const Color(0xFF292929),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                autofocus: false,
                validator: (val) {},
                cursorColor: const Color(0xFFf2f4f9),
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: "Title",
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    CupertinoIcons.textformat,
                    size: 20,
                    color: Color(0xFFf2f4f9),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                ),
              ),
            ),
            Container(
              // padding: const EdgeInsets.symmetric(vertical: 10),
              margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: const Color(0xFF292929),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                autofocus: false,
                validator: (val) {},
                cursorColor: const Color(0xFFf2f4f9),
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: "Description",
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    CupertinoIcons.pencil,
                    size: 20,
                    color: Color(0xFFf2f4f9),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                ),
              ),
            ),
            Container(
              // padding: const EdgeInsets.symmetric(vertical: 10),
              margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: const Color(0xFF292929),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                autofocus: false,
                validator: (val) {},
                cursorColor: const Color(0xFFf2f4f9),
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: "Tags",
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    CupertinoIcons.tags,
                    size: 20,
                    color: Color(0xFFf2f4f9),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
