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
    required this.roomTypeNumber,
    required this.roomType,
    required this.room,
    required this.changePeople,
    required this.changeRoomTypeNumber,
    required this.changeRoomType,
    required this.changeRoom,
  }) : super(key: key);
  int people;
  int roomTypeNumber;
  String roomType;
  int room;
  final Function(int valuePeople) changePeople;
  final Function(int valueRoomTypeNumber) changeRoomTypeNumber;
  final Function(String valueRoomType) changeRoomType;
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
              const BottomSheetSecondary(text: 'Chọn loại phòng và khách'),
              const SizedBox(height: 16),
              Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.door_sliding, color: AppColors.grey),
                      const SizedBox(width: 10),
                      Text(
                        'Loại phòng',
                        style: tStyle.BaseBoldBlack(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: RadioListTile(
                          value: 2,
                          groupValue: widget.roomTypeNumber,
                          title: const Text('Đôi'),
                          onChanged: (value) {
                            setState(() {
                              widget.roomTypeNumber =
                                  int.parse(value.toString());
                              widget.roomType = 'đôi';
                            });
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: RadioListTile(
                          value: 1,
                          groupValue: widget.roomTypeNumber,
                          title: const Text('Đơn'),
                          onChanged: (value) {
                            setState(() {
                              widget.roomTypeNumber =
                                  int.parse(value.toString());
                              widget.roomType = 'đơn';
                            });
                          },
                        ),
                      )
                    ],
                  ),
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
                        'Số lượng phòng',
                        style: tStyle.BaseBoldBlack(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (widget.room > 0) {
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
                          if (widget.people > 0) {
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
                widget.changeRoomType(widget.roomType);
                widget.changeRoomTypeNumber(widget.roomTypeNumber);
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
