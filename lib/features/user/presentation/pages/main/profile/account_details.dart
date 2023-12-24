import 'package:event_app/features/user/data/datasources/local/data.dart';
import 'package:event_app/features/user/data/models/user.dart';
import 'package:flutter/material.dart';

class AccountDetails extends StatefulWidget {
  const AccountDetails({super.key});

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  User savedUser = Data.user;
  late User currentUser;
  @override
  void initState() {
    currentUser = savedUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          top: 10,
          left: 10,
          right: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () => {
                        Navigator.pop(context),
                      },
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.black)),
              IconButton(
                  onPressed: () => {
                        showMenu(
                          context: context,
                          position: const RelativeRect.fromLTRB(10, 50, 0, 0),
                          items: [
                            const PopupMenuItem<String>(
                              value: 'edit',
                              child: Text('Chỉnh sửa'),
                            ),
                          ],
                        ).then((value) {
                          // Xử lý khi mục menu được chọn
                          if (value == 'edit') {
                            // Thực hiện chỉnh sửa ở đây
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return EditDialog(currentUser: currentUser);
                              },
                            ).then((value) => {
                                  if (value != null)
                                    {
                                      setState(() {
                                        currentUser = value;
                                      })
                                    }
                                });
                          }
                        })
                      },
                  icon: const Icon(Icons.more_vert, color: Colors.black))
            ],
          ),
        ),
        const Positioned(
            top: 100,
            left: 20,
            child: Row(
              children: [
                Stack(children: [
                  Center(
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage:
                          AssetImage('assets/images/profile_avatar.jpg'),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Icon(
                        Icons.camera_enhance_outlined,
                        color: Colors.grey,
                        size: 30,
                      )),
                ]),
              ],
            )),
        Positioned(
            top: 180,
            left: 10,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(currentUser.name,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              SizedBox(
                width: 300,
                height: 50,
                child: Text(
                  currentUser.description,
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              const SizedBox(height: 40),
              const Text('Thông tin cá nhân',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.person, color: Colors.blue),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(currentUser.gender,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                            const Text(
                              'Giới tính',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.cake, color: Colors.blue),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(currentUser.birthday,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                            const Text('Ngày sinh',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.map, color: Colors.blue),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(currentUser.address,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                            const Text('Địa chỉ',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400))
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text('Thông tin liên hệ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.phone, color: Colors.blue),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(currentUser.phone,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                            const Text(
                              'Số điện thoại',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.mail, color: Colors.blue),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(currentUser.email,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                            const Text(
                              'Email',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ])),
      ],
    ));
  }
}

class EditDialog extends StatefulWidget {
  final User currentUser;
  const EditDialog({super.key, required this.currentUser});

  @override
  State<EditDialog> createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialog> {
  final TextEditingController _newNameController = TextEditingController();
  final TextEditingController _newDescriptionController =
      TextEditingController();
  final TextEditingController _newGenderController = TextEditingController();
  final TextEditingController _newAddressController = TextEditingController();
  final TextEditingController _newPhoneController = TextEditingController();
  final TextEditingController _newEmailController = TextEditingController();
  final TextEditingController _newBirthdayController = TextEditingController();

  String get newName => _newNameController.text;
  String get newDescription => _newDescriptionController.text;
  String get newGender => _newGenderController.text;
  String get newAddress => _newAddressController.text;
  String get newPhone => _newPhoneController.text;
  String get newEmail => _newEmailController.text;
  String get newBirthday => _newBirthdayController.text;

  String get currentName => widget.currentUser.name;
  String get currentDescription => widget.currentUser.description;
  String get currentBirthday => widget.currentUser.birthday;
  String get currentGender => widget.currentUser.gender;
  String get currentAddress => widget.currentUser.address;
  String get currentPhone => widget.currentUser.phone;
  String get currentEmail => widget.currentUser.email;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Chỉnh sửa thông tin'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Name'),
              onChanged: (value) {
                setState(() {
                  _newNameController.text = value;
                });
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Description'),
              onChanged: (value) {
                setState(() {
                  _newDescriptionController.text = value;
                });
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Gender'),
              onChanged: (value) {
                setState(() {
                  _newGenderController.text = value;
                });
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Birthday'),
              onChanged: (value) {
                setState(() {
                  _newBirthdayController.text = value;
                });
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Address'),
              onChanged: (value) {
                setState(() {
                  _newAddressController.text = value;
                });
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Phone'),
              onChanged: (value) {
                setState(() {
                  _newPhoneController.text = value;
                });
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              onChanged: (value) {
                setState(() {
                  _newEmailController.text = value;
                });
              },
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Đóng'),
        ),
        ElevatedButton(
          onPressed: () {
            // Xử lý khi nhấn nút Lưu
            User user = User(
              name: newName.isEmpty ? currentName : newName,
              description:
                  newDescription.isEmpty ? currentDescription : newDescription,
              gender: newGender.isEmpty ? currentGender : newGender,
              birthday: newBirthday.isEmpty ? currentBirthday : newBirthday,
              address: newAddress.isEmpty ? currentAddress : newAddress,
              phone: newPhone.isEmpty ? currentPhone : newPhone,
              email: newEmail.isEmpty ? currentEmail : newEmail,
            );
            Data.user = user;

            Navigator.pop(context, user);
          },
          child: const Text('Lưu'),
        ),
      ],
    );
  }
}
