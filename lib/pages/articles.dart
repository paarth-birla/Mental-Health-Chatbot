import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:url_launcher/url_launcher.dart';

class Articles extends StatefulWidget {
  const Articles({Key? key}) : super(key: key);

  @override
  _ArticlesState createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  TextEditingController _textController = TextEditingController();

  static List<String> mainDataList = [
    "Why stress happens and how to manage it",
    "Stress at Work",
    "Overcoming Drug Addiction",
    "Long-Term Strategies for Overcoming Addiction",
    "What are the signs of a nervous breakdown?",
    "Linking sleep disturbance with depression, anxiety, bipolar disorder, schizophrenia",
    "How to Sleep Better",
    "Narcolepsy",
    "Coping with Depression",
    "Antidepressant Medication",
    "Depression Symptoms and Warning Signs",
    "Emotional Eating and How to Stop It",
    "Relaxation Techniques for Stress Relief",
    "Are You Feeling Suicidal?",
    "How to cope with bipolar disorder",
    "Post-Traumatic Stress Disorder (PTSD)",
    "Anxiety Disorders and Anxiety Attacks",
  ];

  static Map<String, String> links = {
    "Why stress happens and how to manage it":
        "https://www.medicalnewstoday.com/articles/145855",
    "Stress at Work":
        "https://www.helpguide.org/articles/stress/stress-in-the-workplace.htm",
    "Overcoming Drug Addiction":
        "https://www.helpguide.org/articles/addictions/overcoming-drug-addiction.htm",
    "Long-Term Strategies for Overcoming Addiction":
        "https://www.verywellmind.com/overcoming-addiction-4157285",
    "What are the signs of a nervous breakdown?":
        "https://www.medicalnewstoday.com/articles/321018",
    "Linking sleep disturbance with depression, anxiety, bipolar disorder, schizophrenia":
        "https://www.medicalnewstoday.com/articles/linking-sleep-disturbance-with-depression-anxiety-bipolar-schizophrenia",
    "How to Sleep Better":
        "https://www.helpguide.org/articles/sleep/getting-better-sleep.htm",
    "Narcolepsy": "https://www.helpguide.org/articles/sleep/narcolepsy.htm",
    "Coping with Depression":
        "https://www.helpguide.org/articles/depression/coping-with-depression.htm",
    "Antidepressant Medication":
        "https://www.helpguide.org/articles/depression/antidepressant-medication.htm",
    "Depression Symptoms and Warning Signs":
        "https://www.helpguide.org/articles/depression/depression-symptoms-and-warning-signs.htm",
    "Emotional Eating and How to Stop It":
        "https://www.helpguide.org/articles/diets/emotional-eating.htm",
    "Relaxation Techniques for Stress Relief":
        "https://www.helpguide.org/articles/stress/relaxation-techniques-for-stress-relief.htm",
    "Are You Feeling Suicidal?":
        "https://www.helpguide.org/articles/suicide-prevention/are-you-feeling-suicidal.htm",
    "How to cope with bipolar disorder":
        "https://www.helpguide.org/articles/bipolar-disorder/living-with-bipolar-disorder.htm",
    "Post-Traumatic Stress Disorder (PTSD)":
        "https://www.helpguide.org/articles/ptsd-trauma/ptsd-symptoms-self-help-treatment.htm",
    "Anxiety Disorders and Anxiety Attacks":
        "https://www.helpguide.org/articles/anxiety/anxiety-disorders-and-anxiety-attacks.htm"
  };

  // Copy Main List into New List.
  List<String> newDataList = List.from(mainDataList);

  onItemChanged(String value) {
    setState(() {
      newDataList = mainDataList
          .where((string) => string.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  openUrl(data) async {
    String? url = links[data];
    launch(url!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // App bar of the page
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text(
          'Articles',
          style: GoogleFonts.andada(
            fontSize: 34.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Search Here...',
                hintStyle: GoogleFonts.andada(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              onChanged: onItemChanged,
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(8.0),
              children: newDataList.map((data) {
                return ListTile(
                  title: Text(
                    data,
                    style: GoogleFonts.andada(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onTap: () => openUrl(data),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// CheckPoint