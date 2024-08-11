// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:mf_part1_lagu_daerah/models/province.dart';

import 'detail_page.dart';

class HomePages extends StatefulWidget {
  const HomePages({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: SafeArea(
        child: Column(
          children: [
            const Text(
              'Kumpulan Lagu - Lagu Daerah',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CarouselSlider.builder(
              itemCount: laguDaerahList.length,
              itemBuilder: (context, index, realIndex) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailPage(
                            province: laguDaerahList[index],
                          );
                        },
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Text(
                        '${laguDaerahList[index].nama} - ${laguDaerahList[index].ibuKota}',
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      Stack(
                        children: [
                          Container(
                            width: 450,
                            height: 500,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              image: const DecorationImage(
                                  image: NetworkImage(
                                      'https://plus.unsplash.com/premium_photo-1673197406959-bb0df6c758f1?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                width: 260,
                                height: 470,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          laguDaerahList[index].photo),
                                      fit: BoxFit.cover),
                                ),
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    laguDaerahList[index].laguDaerah,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.deepPurple[100]),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              options: CarouselOptions(
                height: 650,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
