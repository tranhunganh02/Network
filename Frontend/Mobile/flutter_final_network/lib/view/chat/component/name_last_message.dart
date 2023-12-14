import 'package:flutter/material.dart';

Container NameAndLastMsg(BuildContext context) {
    return Container(
                        height: double.infinity,
                        width: MediaQuery.sizeOf(context).width * 0.6,
                        margin:const EdgeInsets.only(left: 10),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                          Text(
                            "Huwng",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "dashdasd dccdkcml afdsjf asndk jask nkj jnaj ",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontStyle: FontStyle.italic,
                              
                            ),
                          ),
                        ]),
                      );
  }