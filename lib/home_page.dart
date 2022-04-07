import 'package:api_call_with_provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Api Call With Provider"),
        ),
      ),
      body: ChangeNotifierProvider(
        create: (context) => SuperHeroProvider(),
        builder: (context, snapshot) {
          return const SuperHero();
        },
      ),
    );
  }
}

class SuperHero extends StatelessWidget {
  const SuperHero({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var courseDetailsModel =
        Provider.of<SuperHeroProvider>(context, listen: false);
    courseDetailsModel.getsuperHeroDetails();

    return Consumer<SuperHeroProvider>(
        builder: (context, courseDetailsRepo, _) {
      return courseDetailsRepo.loadingStatus
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: courseDetailsModel.superhero.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => DetailsPage()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Expanded(
                              flex: 2,
                              child: Center(
                                child: CircleAvatar(
                                  radius: 55,
                                  backgroundImage: NetworkImage(
                                      courseDetailsModel.superhero[index].url!),
                                ),
                              )),
                        ),
                        Container(
                          width: 10,
                        ),
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  courseDetailsModel.superhero[index].name!,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(
                                    courseDetailsModel.superhero[index].power!,
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.black54),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 4),
                                  child: Divider(
                                    color: Colors.black26,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
    });
  }
}
