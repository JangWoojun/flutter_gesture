import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              TestCheckBox(),
              TestRadioButton(),
              TestSlider(),
              TestSwitch(),
              PopUpMenu(),
            ],
          ),
        ),
      ),
    );
  }
}

enum TestWidgetValue {
  test1,
  test2,
  test3;
}

class PopUpMenu extends StatefulWidget {
  const PopUpMenu({super.key});

  @override
  State<PopUpMenu> createState() => _PopUpMenuState();
}

class _PopUpMenuState extends State<PopUpMenu> {
  TestWidgetValue? selectValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(selectValue?.name ?? "선택 안됨"),
        PopupMenuButton(
          itemBuilder: (context) {
            return TestWidgetValue.values
                .map((value) =>
                    PopupMenuItem(value: value, child: Text(value.name)))
                .toList();
          },
          onSelected: (newValue) => setState(() => selectValue = newValue)
        ),
      ],
    );
  }
}

class TestSwitch extends StatefulWidget {
  const TestSwitch({super.key});

  @override
  State<TestSwitch> createState() => _TestSwitchState();
}

class _TestSwitchState extends State<TestSwitch> {
  late bool value;

  @override
  void initState() {
    super.initState();
    value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Switch(
            value: value,
            onChanged: (newValue) => setState(() => value = newValue)),
        CupertinoSwitch(
            value: value,
            onChanged: (newValue) => setState(() => value = newValue)),
      ],
    );
  }
}

class TestSlider extends StatefulWidget {
  const TestSlider({super.key});

  @override
  State<TestSlider> createState() => _TestSliderState();
}

class _TestSliderState extends State<TestSlider> {
  late double value;

  @override
  void initState() {
    super.initState();
    value = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("${value.round()}"),
        Slider(
          value: value,
          onChanged: (newValue) => setState(() => value = newValue),
          max: 100,
          min: 0,
          activeColor: Colors.blue,
        ),
      ],
    );
  }
}

class TestRadioButton extends StatefulWidget {
  const TestRadioButton({super.key});

  @override
  State<TestRadioButton> createState() => _TestRadioButtonState();
}

class _TestRadioButtonState extends State<TestRadioButton> {
  TestWidgetValue? selectValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(TestWidgetValue.test1.name),
          onTap: () {
            setState(() {
              if (selectValue != TestWidgetValue.test1) {
                selectValue = TestWidgetValue.test1;
              }
            });
          },
          leading: Radio<TestWidgetValue>(
              value: TestWidgetValue.test1,
              groupValue: selectValue,
              onChanged: (value) => setState(() => selectValue = value!)),
        ),
        ListTile(
          title: Text(TestWidgetValue.test2.name),
          onTap: () {
            setState(() {
              if (selectValue != TestWidgetValue.test2) {
                selectValue = TestWidgetValue.test2;
              }
            });
          },
          leading: Radio<TestWidgetValue>(
              value: TestWidgetValue.test2,
              groupValue: selectValue,
              onChanged: (value) => setState(() => selectValue = value!)),
        ),
        ListTile(
          title: Text(TestWidgetValue.test3.name),
          onTap: () {
            setState(() {
              if (selectValue != TestWidgetValue.test3) {
                selectValue = TestWidgetValue.test3;
              }
            });
          },
          leading: Radio<TestWidgetValue>(
              value: TestWidgetValue.test3,
              groupValue: selectValue,
              onChanged: (value) => setState(() => selectValue = value!)),
        ),
      ],
    );
  }
}

class TestCheckBox extends StatefulWidget {
  const TestCheckBox({super.key});

  @override
  State<TestCheckBox> createState() => _TestCheckBoxState();
}

class _TestCheckBoxState extends State<TestCheckBox> {
  late List<bool> values;

  @override
  void initState() {
    super.initState();
    values = [false, false, false];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: values[0],
            onChanged: (value) => changeValue(0, value: value)),
        Checkbox(
            value: values[1],
            onChanged: (value) => changeValue(1, value: value)),
        Checkbox(
            value: values[2],
            onChanged: (value) => changeValue(2, value: value)),
      ],
    );
  }

  void changeValue(int index, {bool? value = false}) {
    setState(() {
      values[index] = value!;
    });
  }
}
