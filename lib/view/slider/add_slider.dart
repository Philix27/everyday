part of 'slider_w.dart';

class AddSlider extends StatefulWidget {
  const AddSlider({Key? key, required this.ref}) : super(key: key);
  final CollectionReference ref;
  @override
  _AddSliderState createState() => _AddSliderState();
}

class _AddSliderState extends State<AddSlider> {
  int selectedColorCode = 0xFF087040;

  changeColor(int color) {
    setState(() {
      selectedColorCode = color;
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  ScrollController? _scrollController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Banner', style: Styles.headlineText2),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text('Title', style: Styles.bodyText2),
                    TextFormField(
                      controller: titleController,
                      style: Styles.bodyText2,
                      maxLines: 2,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Name of drug';
                        } else if (value.length <= 2) {
                          return 'Please enter more than 2 characters';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        hintText: 'Name',
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text('Details', style: Styles.bodyText2),
                    TextFormField(
                      controller: _descriptionController,
                      style: Styles.bodyText2,
                      maxLines: 2,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Name of drug';
                        } else if (value.length <= 2) {
                          return 'Please enter more than 2 characters';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        hintText: 'Details',
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildColorCard(0xFF087040),
                        buildColorCard(0xFFb80c0c),
                        buildColorCard(0xFF049e04),
                        buildColorCard(0xFFae5e00),
                        buildColorCard(0xFF6506a2),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: MyWidgets.raisedButton(
                        title: "Send",
                        onPressed: () {
                          final String docID =
                              Timestamp.now().millisecondsSinceEpoch.toString();
                          addDrugsNeeded(
                            docID,
                            {
                              "docID": docID,
                              "details": _descriptionController.text.trim(),
                              "title": titleController.text.trim(),
                              "imageUrl": "",
                              "isImage": false,
                              "authorID": "",
                              "colorCode": selectedColorCode,
                              "timePosted": Timestamp.now(),
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildColorCard(int colorCode) {
    if (selectedColorCode == colorCode) {
      return InkWell(
        onTap: () => changeColor(colorCode),
        child: Container(
          height: 50,
          width: 50,
          color: Color(colorCode),
          child: const Center(
            child: Icon(
              Icons.circle,
              color: Colors.white,
            ),
          ),
        ),
      );
    } else {
      return InkWell(
        onTap: () => changeColor(colorCode),
        child: Container(
          height: 50,
          width: 50,
          color: Color(colorCode),
        ),
      );
    }
  }

  Future<void> addDrugsNeeded(String id, Map<String, dynamic> data) async =>
      widget.ref
          // MyGlobals.notesSliderCollection
          .doc(id)
          .set(data)
          .then((value) => MyWidgets.snackbar(title: "Added"));
}
