import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide.none,
);

class SearchForm extends StatefulWidget {
  const SearchForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  @override
  Widget build(BuildContext context) {
    int _selectedSize = 0;
    RangeValues _currentRangeValues = const RangeValues(0, 3000);
    return Form(
      child: TextFormField(
        onSaved: (value) {},
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: "Search items...",
          border: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          errorBorder: outlineInputBorder,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(14),
            child: SvgPicture.asset("assets/icons/Search.svg"),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding / 2),
            child: SizedBox(
              width: 48,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: primaryColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                ),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      builder: (BuildContext context) {
                        return BottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          clipBehavior: Clip.hardEdge,
                          onClosing: () {},
                          builder: (context) {
                            return StatefulBuilder(
                              builder: (BuildContext context, setState) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 36),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      //make button of size small and medium and large and change the color of the button
                                      const SizedBox(
                                        height: 40,
                                      ),
                                      const Text('Size',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                _selectedSize = 0;
                                              });
                                            },
                                            //make background is primary color
                                            style: ElevatedButton.styleFrom(
                                              primary: (_selectedSize == 0)
                                                  ? primaryColor
                                                  : Colors.white,
                                              shape:
                                              const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(12)),
                                              ),
                                            ),
                                            child: Text(
                                              "Small",
                                              style: TextStyle(
                                                color: _selectedSize == 0
                                                    ? Colors.white
                                                    : Colors.grey,
                                              ),
                                            ),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                _selectedSize = 1;
                                              });
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: (_selectedSize == 1)
                                                  ? primaryColor
                                                  : Colors.white,
                                              shape:
                                              const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(12)),
                                              ),
                                            ),
                                            child: Text(
                                              "Medium",
                                              style: TextStyle(
                                                  color: _selectedSize == 1
                                                      ? Colors.white
                                                      : Colors.grey),
                                            ),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                _selectedSize = 2;
                                              });
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: (_selectedSize == 2)
                                                  ? primaryColor
                                                  : Colors.white,
                                              shape:
                                              const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(12)),
                                              ),
                                            ),
                                            child: Text(
                                              "Large",
                                              style: TextStyle(
                                                  color: _selectedSize == 2
                                                      ? Colors.white
                                                      : Colors.grey),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 32,
                                      ),
                                      const Text('Price',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 0),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              _currentRangeValues.start
                                                  .round()
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              _currentRangeValues.end
                                                  .round()
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      RangeSlider(
                                        activeColor: primaryColor,
                                        values: _currentRangeValues,
                                        min: 0,
                                        max: 3000,
                                        divisions: 30,
                                        labels: RangeLabels(
                                          _currentRangeValues.start
                                              .round()
                                              .toString(),
                                          _currentRangeValues.end
                                              .round()
                                              .toString(),
                                        ),
                                        onChanged: (RangeValues values) {
                                          setState(() {
                                            _currentRangeValues = values;
                                            // print(_currentRangeValues.start.toString());
                                          });
                                        },
                                      ),
                                      //button apply filter
                                      const SizedBox(
                                        height: 32,
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          //make padding

                                          child: const Text(
                                            "Apply Filter",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            primary: primaryColor,

                                            padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(40)),
                                            ),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        );
                      });
                },
                child: SvgPicture.asset("assets/icons/Filter.svg"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
