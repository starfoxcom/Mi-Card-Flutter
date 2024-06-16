import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mi_card_flutter/career_timeline/career_timeline_data.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:visibility_detector/visibility_detector.dart';

class CareerTimelineListView extends StatefulWidget {
  const CareerTimelineListView(this.careerTimelineData, {Key? key})
      : super(key: key);

  final List<CareerTimelineData> careerTimelineData;

  @override
  State<CareerTimelineListView> createState() => _CareerTimelineListViewState();
}

class _CareerTimelineListViewState extends State<CareerTimelineListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.careerTimelineData.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              VisibilityDetector(
                key: Key(
                  widget.careerTimelineData[index].companyName,
                ),
                onVisibilityChanged: (info) {
                  if (info.visibleFraction >= .2) {
                    setState(() {
                      widget.careerTimelineData[index].isVisible = true;
                    });
                  } else {
                    setState(() {
                      widget.careerTimelineData[index].isVisible = false;
                    });
                  }
                },
                child: AnimatedOpacity(
                  opacity: widget.careerTimelineData[index].isVisible ? 1 : 0,
                  duration: const Duration(milliseconds: 500),
                  child: TimelineTile(
                    indicatorStyle: IndicatorStyle(
                      width: 30,
                      height: 30,
                      indicator: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                        child: widget.careerTimelineData[index].fontAwesomeIcon
                            ? FaIcon(
                                widget.careerTimelineData[index].icon,
                              )
                            : Icon(
                                widget.careerTimelineData[index].icon,
                              ),
                      ),
                    ),
                    isFirst: index == 0,
                    isLast: index == widget.careerTimelineData.length - 1,
                    alignment: TimelineAlign.manual,
                    lineXY: index % 2 == 0 ? .9 : .1,
                    startChild: //if cardData is even, else null
                        index % 2 == 0
                            ? _CardData(widget.careerTimelineData[index],
                                RotateSide.left)
                            : null,
                    endChild: //if cardData is odd, else null
                        index % 2 != 0
                            ? _CardData(widget.careerTimelineData[index],
                                RotateSide.right)
                            : null,
                  ),
                ),
              ),
              if (index != widget.careerTimelineData.length - 1)
                AnimatedOpacity(
                    opacity: widget.careerTimelineData[index].isVisible ? 1 : 0,
                    duration: const Duration(milliseconds: 500),
                    child: const TimelineDivider(
                      begin: .1,
                      end: .9,
                      thickness: 4,
                    ))
            ],
          );
        });
  }
}

class _CardData extends StatefulWidget {
  const _CardData(this.cardData, this.rotateSide, {Key? key}) : super(key: key);

  final CareerTimelineData cardData;
  final RotateSide rotateSide;

  @override
  State<_CardData> createState() => _CardDataState();
}

class _CardDataState extends State<_CardData> {
  @override
  Widget build(BuildContext context) {
    final flipController = FlipCardController();
    final size = MediaQuery.sizeOf(context);

    return Padding(
      padding: const EdgeInsets.all(10),
      child: FlipCard(
        controller: flipController,
        onTapFlipping: widget.cardData.roleDescription != null,
        rotateSide: widget.rotateSide,
        frontWidget: FocusableActionDetector(
          onShowHoverHighlight: (value) {
            setState(() {
              widget.cardData.onHover = value;
            });
          },
          child: Card(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.cardData.companyPosition,
                          style: const TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          widget.cardData.companyName,
                          style: const TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 15,
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 2.5),
                        Text(
                          widget.cardData.endDate != null
                              ? '${DateFormat('MMMM yyyy').format(widget.cardData.startDate)} - ${DateFormat('MMMM yyyy').format(widget.cardData.endDate!)}'
                              : '${DateFormat('MMMM yyyy').format(widget.cardData.startDate)} - Present',
                          style: const TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 12,
                            color: Colors.white30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (widget.cardData.roleDescription != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: AnimatedOpacity(
                        opacity: size.width > 1550
                            ? widget.cardData.onHover
                                ? 1
                                : 0
                            : 1,
                        duration: const Duration(milliseconds: 250),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.flip_to_back,
                              color: Colors.white30,
                            ),
                            Text(
                              'Tap for\ndescription',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'SourceSansPro',
                                fontSize: 12,
                                color: Colors.white30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
        backWidget: FocusableActionDetector(
          onShowHoverHighlight: (value) {
            setState(() {
              widget.cardData.onHover = value;
            });
          },
          child: Card(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.cardData.roleDescription ??
                              'No description provided',
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 15,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: AnimatedOpacity(
                      opacity: size.width > 1550
                          ? widget.cardData.onHover
                              ? 1
                              : 0
                          : 1,
                      duration: const Duration(milliseconds: 250),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.flip_to_front,
                            color: Colors.white30,
                          ),
                          Text(
                            'Tap for\nposition',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 12,
                              color: Colors.white30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
