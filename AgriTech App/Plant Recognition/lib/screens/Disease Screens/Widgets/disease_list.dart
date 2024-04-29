import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Models/disease_model.dart';
import '../disease_detail_screen.dart';

class DiseaseList extends StatelessWidget {
  final List<Disease> diseases;

  DiseaseList({required this.diseases});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      itemCount: diseases.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DiseaseDetailScreen(
                  disease: diseases[index],
                  image: diseases[index].image,
                ),
              ),
            );
          },
          child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.6),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                    child: Image.asset(
                      diseases[index].image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RichText(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                              text: 'Name: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade300),
                              children: <TextSpan>[
                                TextSpan(
                                  text: diseases[index].name,
                                  style: TextStyle(
                                      color: Colors.grey.shade50,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                              text: 'Cause: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade300),
                              children: <TextSpan>[
                                TextSpan(
                                  text: diseases[index].cause,
                                  style: TextStyle(
                                      color: Colors.grey.shade50,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                              text: 'Solution: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade300),
                              children: <TextSpan>[
                                TextSpan(
                                  text: diseases[index].solution,
                                  style: TextStyle(
                                      color: Colors.grey.shade50,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )),
        );
      },
    );
  }
}
