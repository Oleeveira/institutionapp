import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: 12,
              itemBuilder: (context, index) => const Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://imgs.search.brave.com/EH557LzfsHTfIMbszf0VhVSjTAxp2YIL1olc8zaL-ic/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9zdGF0/aWM2LmRlcG9zaXRw/aG90b3MuY29tLzEw/MzExNzQvNTk0L2kv/NDUwL2RlcG9zaXRw/aG90b3NfNTk0MjE0/MS1zdG9jay1waG90/by1ncm91cC1vZi1w/YXBlcmNoYWluLWhv/bGRpbmctaGFuZHMu/anBn",
                        ),
                      ),
                      title: Text("Lar dos idosos"),
                    ),
                    CardItem(),
                    SizedBox(
                      height: 12.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        height: 350.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          image: const DecorationImage(
            image: NetworkImage(
                "https://imgs.search.brave.com/IzCeCU8PrEZ9T52ad2djo7oiwnH7Oue-3x_MKTRFZek/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTM1/MzMzMjI1OC9waG90/by9kb25hdGlvbi1j/b25jZXB0LXRoZS12/b2x1bnRlZXItZ2l2/aW5nLWEtZG9uYXRl/LWJveC10by10aGUt/cmVjaXBpZW50LXN0/YW5kaW5nLWFnYWlu/c3QtdGhlLXdhbGwu/d2VicD9iPTEmcz0x/NzA2NjdhJnc9MCZr/PTIwJmM9RDUzZHk0/SFBsZkxpOXlDTzhv/dW93SW45SHFJV2Zr/akV4NC1DMDVCOFRZ/VT0"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}