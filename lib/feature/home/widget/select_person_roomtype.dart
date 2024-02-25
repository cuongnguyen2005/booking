// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:booking/components/bottom_sheet/bottom_sheet_secondary.dart';
import 'package:flutter/material.dart';
import 'package:booking/components/btn/button_primary.dart';
import 'package:booking/source/colors.dart';
import 'package:booking/source/typo.dart';

class SelectPersonAndRoomType extends StatefulWidget {
  SelectPersonAndRoomType({
    Key? key,
    required this.people,
    required this.room,
    required this.changePeople,
    required this.changeRoom,
  }) : super(key: key);
  int people;
  int room;
  final Function(int valuePeople) changePeople;
  final Function(int valueRoom) changeRoom;

  @override
  State<SelectPersonAndRoomType> createState() =>
      _SelectPersonAndRoomTypeState();
}

class _SelectPersonAndRoomTypeState extends State<SelectPersonAndRoomType> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height * 3 / 4,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const BottomSheetSecondary(text: 'Chọn số phòng và khách'),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.person, color: AppColors.grey),
                      const SizedBox(width: 10),
                      Text(
                        'Số lượng phòng',
                        style: tStyle.BaseBoldBlack(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (widget.room > 1) {
                            setState(() {
                              widget.room -= 1;
                            });
                          }
                        },
                        child: const Icon(Icons.remove),
                      ),
                      const SizedBox(width: 5),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('${widget.room}'),
                      ),
                      const SizedBox(width: 5),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            widget.room += 1;
                          });
                        },
                        child: const Icon(Icons.add),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.person, color: AppColors.grey),
                      const SizedBox(width: 10),
                      Text(
                        'Người',
                        style: tStyle.BaseBoldBlack(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (widget.people > 1) {
                            setState(() {
                              widget.people -= 1;
                            });
                          }
                        },
                        child: const Icon(Icons.remove),
                      ),
                      const SizedBox(width: 5),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('${widget.people}'),
                      ),
                      const SizedBox(width: 5),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            widget.people += 1;
                          });
                        },
                        child: const Icon(Icons.add),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
          ButtonPrimary(
            text: 'Hoàn tất',
            onTap: () {
              setState(() {
                widget.changePeople(widget.people);
                widget.changeRoom(widget.room);
              });
              onTapBack();
            },
          )
        ],
      ),
    );
  }

  void onTapBack() {
    Navigator.pop(context);
  }
}
