import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class PersistentBottomSheet extends StatefulWidget {
  @override
  _PersistentBottomSheetState createState() => _PersistentBottomSheetState();
}

class _PersistentBottomSheetState extends State<PersistentBottomSheet> {
  GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  Map<String, dynamic> inputValues = {
    'regionName': null,
    'lightCapacity': null,
  };

  void _submit() {
    if (!_fbKey.currentState.validate()) {
      return;
    }

    _fbKey.currentState.save();
    inputValues = _fbKey.currentState.value;
    print(inputValues);
    Navigator.of(context).pop();
  }

  void _showPersistentBottomSheet(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.amberAccent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
            ),
            // padding: EdgeInsets.only(
            //   bottom: MediaQuery.of(context).viewInsets.bottom,
            // ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40,
                    right: 20,
                    left: 20,
                    bottom: 20,
                  ),
                  child: FormBuilder(
                    key: _fbKey,
                    child: Column(
                      children: <Widget>[
                        FormBuilderTextField(
                          attribute: 'regionName',
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            labelText: '지역 이름',
                          ),
                          validators: [
                            FormBuilderValidators.required(),
                            FormBuilderValidators.minLength(2),
                            FormBuilderValidators.maxLength(16),
                          ],
                        ),
                        SizedBox(height: 20),
                        FormBuilderTextField(
                          attribute: 'lightCapacity',
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            labelText: '일사량',
                          ),
                          validators: [
                            FormBuilderValidators.required(),
                            FormBuilderValidators.numeric(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                MaterialButton(
                  child: Text('Submit'),
                  onPressed: _submit,
                  color: Colors.deepPurple,
                  textColor: Colors.white,
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    ).closed.then((_) {
      print('showBottomSheet closed');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Persistent Bottom Sheet'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            inputValues['regionName'] != null
                ? Text(
                    '지역명: ${inputValues['regionName']}',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  )
                : Container(),
            inputValues['lightCapacity'] != null
                ? Text(
                    '일사량: ${inputValues['lightCapacity']}',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  )
                : Container(),
            Builder(
              builder: (context) => MaterialButton(
                color: Colors.indigo,
                textColor: Colors.white,
                minWidth: 220,
                height: 45,
                child: Text(
                  '지명과 일사량을 입력하세요',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                onPressed: () => _showPersistentBottomSheet(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
