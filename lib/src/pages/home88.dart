import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;

  @override
  void initState() {
    isLoading = false;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.height * 0.045,
                MediaQuery.of(context).size.height * 0.1,
                MediaQuery.of(context).size.height * 0.045,
                MediaQuery.of(context).size.height * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Take a pick!",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline
                      .copyWith(fontSize: 39, color: Colors.blueGrey[600]),
                ),
                // Text(
                //   "Let's play some games to put your memory to test. Go ahead and sign in to start!",
                //   style: Theme.of(context)
                //       .textTheme
                //       .title
                //       .copyWith(color: Colors.black54),
                // ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.044,
                ),
                Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            // builder: (context) => GameChoose(),
                          ),
                        );
                      },
                      child: Card(
                        color: Colors.lightBlueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(27.0),
                        ),
                        margin:
                            EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                        child: ListTile(
                          title: Text(
                            "Play mini gamesaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .body1
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            // builder: (context) => SimonGame(),
                          ),
                        );
                      },
                      child: Card(
                        color: Colors.lightBlueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(27.0),
                        ),
                        margin:
                            EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                        child: ListTile(
                          title: Text(
                            "Take the full test",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .body1
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/gamer.gif'), fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.037,
                ),
                GestureDetector(
                  // onTap: () => handleSignOut(),
                  child: Text('holanda')
                     
            )
          ],
        ), 
      ),
    );
  }
}