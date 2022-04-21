import 'package:flutter/material.dart';
import 'package:flutter_desktop_2/constants.dart';
import 'package:flutter_desktop_2/models/note.dart';
import 'package:flutter_desktop_2/utils/text_styles.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:tinycolor2/tinycolor2.dart';

import 'note_card.dart';

List<Note> notes = [
  Note(
    'Please close the doors 🚪',
    '''I wanted to point out to you that in 
the future please make sure to keep the doors 
wanted to point out to you that all bout 
closed''',
    'Laura Schellen',
    '31.jpg',
    '8/24/2020 . 4:09 pm',
  ),
  Note(
    'Focus Time 🎧',
    '''Hi guys, I would like to suggest that 
we set a fixed focus time within the company, wanted to point out to you that and refer it to 
where you can''',
    'Chris Kruger',
    '54.jpg',
    '8/22/2020 . 4:43 pm',
  ),
  Note(
    'QA Testing Devices',
    '''Next week I will bring my dog Barker to the office.
I've packed some treats wanted to point out to you that in case you want to make friends''',
    'Julian Herbat',
    '98.jpg',
    '8/22/2020 . 4:43 pm',
  ),
  Note(
    'Please register your machine',
    '''Next week I will bring my dog Barker to the office. 
I've packed some treats wanted to point out to you that to me wanted to point out to you that  and point out how to in case you want to make friends''',
    'Diana Helena',
    '31.jpg',
    '8/22/2020 . 4:43 pm',
  ),
  Note(
    'Apple Event Watching',
    '''Next week I will bring my dog Barker 
to the office. I've packed some treats in case you want wanted to point out to you that displace and disgrace to me
to make friends''',
    'Max Schmidt',
    'me.jpg',
    '8/22/2020 . 4:43 pm',
  ),
  Note(
    'Coffee machine instructions ☕️',
    '''Next week I will bring my dog Barker 
to the office. I've packed some treats in wanted to point out to you that hello to use
case you want to make friends''',
    'Julian Herbat',
    '11.jpg',
    '8/22/2020 . 4:43 pm',
  ),
  Note(
    'Focus Time 🎧',
    '''Hi guys, I would like to suggest that 
we set a fixed focus time within the company, wanted to point out to you that and refer it to 
where you can''',
    'Chris Kruger',
    '54.jpg',
    '8/22/2020 . 4:43 pm',
  ),
  Note(
    'Apple Event Watching',
    '''Next week I will bring my dog Barker 
to the office. I've packed some treats in case you want wanted to point out to you that displace and disgrace to me
to make friends''',
    'Max Schmidt',
    'me.jpg',
    '8/22/2020 . 4:43 pm',
  ),
  Note(
    'QA Testing Devices',
    '''Next week I will bring my dog Barker to the office.
I've packed some treats wanted to point out to you that in case you want to make friends''',
    'Julian Herbat',
    '98.jpg',
    '8/22/2020 . 4:43 pm',
  )
];

class MainContent extends StatelessWidget {
  const MainContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    final bool _isSm = _size.width <= screenSm;
    final bool _isLg = _size.width <= screenLg;
    final bool _isXl = _size.width >= screenXl;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Notes",
              style: TextStyles.secondary.apply(
                color: TinyColor(darkColor).darken().color,
                fontSizeDelta: 12,
                fontWeightDelta: 5,
              ),
            ),
            Icon(
              AntDesign.pluscircle,
              color: TinyColor(darkColor).darken().color,
              size: 32,
            )
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: notes.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _isSm ? 1 : (_isLg ? 2 : (_isXl ? 4 : 3)),
            childAspectRatio: 3.9 / 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, index) => NoteCard(
            note: notes[index],
          ),
        ),
      ],
    );
  }
}
