import 'package:flutter/material.dart';


class MyHomePage extends StatelessWidget 
{
      MyHomePage({super.key});

      final String npm = "2406000001";
      final String nama = "Burhan";
      final String kelas = "PBP A";

      @override
      Widget build(BuildContext context) 
      {
        return Scaffold
        (
          appBar: AppBar
          (
            title: const Text('MyPortfolio'),
          ),
          body: const Center
          (
            child: Text('Halo dari MyPortfolio!'),
          ),
        );
      }
}
