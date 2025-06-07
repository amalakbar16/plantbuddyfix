import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TambahkanWidget extends StatefulWidget {
  final String? selectedJenisTanaman;
  final ValueChanged<String?>? onJenisTanamanChanged;

  const TambahkanWidget({
    Key? key,
    this.selectedJenisTanaman,
    this.onJenisTanamanChanged,
  }) : super(key: key);

  @override
  State<TambahkanWidget> createState() => _TambahkanWidgetState();
}

class _TambahkanWidgetState extends State<TambahkanWidget> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _namaTanamanController = TextEditingController();
  bool _isPicking = false; // <-- ADD THIS FLAG

  Future<void> _pickImage() async {
    if (_isPicking) return;        // Prevent double tap!
    setState(() => _isPicking = true);

    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _selectedImage = File(image.path);
        });
      }
    } catch (e) {
      // Optional: Show error
    } finally {
      setState(() => _isPicking = false);  // Release lock
    }
  }

  @override
  Widget build(BuildContext context) {
    final jenisTanamanList = [
      "Sayuran",
      "Buah",
      "Bunga",
      "Rempah",
      "Tanaman Hias"
    ];

    return Center(
      child: Card(
        elevation: 7,
        color: Colors.white,
        margin: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Foto Produk (preview)
              GestureDetector(
                onTap: _pickImage,
                child: Stack(
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        color: _selectedImage != null
                            ? Colors.grey.shade200
                            : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: _selectedImage != null
                              ? Color(0xFF01B14E)
                              : Colors.grey.shade300,
                          width: 2.2,
                          style: BorderStyle.solid,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 12,
                            spreadRadius: 2,
                          )
                        ],
                      ),
                      child: _selectedImage == null
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add_a_photo_rounded,
                                      color: Colors.grey.shade400, size: 46),
                                  SizedBox(height: 10),
                                  Text(
                                    "Tambah Foto",
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.file(
                                _selectedImage!,
                                width: 180,
                                height: 180,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                    if (_selectedImage != null)
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(99),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  spreadRadius: 1)
                            ],
                          ),
                          child: Icon(Icons.edit, color: Color(0xFF01B14E), size: 24),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 26),

              // Field: Nama Tanaman
              TextFormField(
                controller: _namaTanamanController,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  color: Colors.black87,
                ),
                decoration: InputDecoration(
                  labelText: "Nama Tanaman",
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  labelStyle: TextStyle(
                    color: Colors.grey.shade500,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                      width: 1.6,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                      width: 1.6,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(
                      color: Color(0xFF01B14E),
                      width: 2.0,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                ),
              ),
              SizedBox(height: 22),

              // Field: Jenis Tanaman (Dropdown)
              DropdownButtonFormField<String>(
                value: widget.selectedJenisTanaman,
                onChanged: widget.onJenisTanamanChanged,
                icon: Icon(Icons.keyboard_arrow_down_rounded,
                    color: Colors.black54, size: 30),
                style: TextStyle(
                  color: Colors.black87,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  labelText: "Jenis Tanaman",
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  labelStyle: TextStyle(
                    color: Colors.grey.shade500,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                      width: 1.6,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                      width: 1.6,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(
                      color: Color(0xFF01B14E),
                      width: 2.0,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                ),
                dropdownColor: Colors.white,
                items: jenisTanamanList
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: TextStyle(
                            color: Colors.black87,
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              SizedBox(height: 22),

              // Field: Lampiran (upload)
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: 1.6,
                      style: BorderStyle.solid,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 8,
                        offset: Offset(1, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 18),
                      Expanded(
                        child: _selectedImage == null
                            ? Text(
                                "Lampiran",
                                style: TextStyle(
                                  color: Color(0xFFAFB1B6),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              )
                            : Text(
                                "Gambar berhasil dipilih",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                      ),
                      if (_selectedImage != null)
                        Padding(
                          padding: const EdgeInsets.only(right: 3),
                          child: Icon(Icons.check_circle, color: Color(0xFF01B14E), size: 22),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16, left: 7),
                        child: Icon(Icons.image_outlined, color: Color(0xFFAFB1B6), size: 28),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 28),

              // Tombol Tambahkan
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 4,
                    backgroundColor: const Color(0xFF01B14E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    // TODO: Aksi submit di sini
                  },
                  child: Text(
                    'Tambahkan',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.5,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
