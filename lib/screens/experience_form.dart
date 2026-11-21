import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

class ExperienceFormPage extends StatefulWidget
{
    const ExperienceFormPage({super.key});

    @override
    State<ExperienceFormPage> createState() => _ExperienceFormPageState();
}

class _ExperienceFormPageState extends State<ExperienceFormPage>
{
    final _formKey = GlobalKey<FormState>();

    String _experienceName = "";
    String _description = "";
    String _employment = "Full-time";
    DateTime? _startDate;
    DateTime? _endDate;

    final List<String> _employmentType = 
    [
    'Full-time',
    'Part-time',
    'Volunteer',
    ];

    String _formatDate(DateTime date) 
    {
        final year = date.year.toString().padLeft(4, '0');
        final month = date.month.toString().padLeft(2, '0');
        final day = date.day.toString().padLeft(2, '0');
        return '$year-$month-$day';
    }

    Future<void> _selectDate({required bool isStartDate}) async 
    {
        final DateTime initialDate = isStartDate
            ? (_startDate ?? DateTime.now())
            : (_endDate ?? _startDate ?? DateTime.now());

        final DateTime? picked = await showDatePicker
        (
          context: context,
          initialDate: initialDate,
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );

        if (!mounted || picked == null) return;

        setState
        (() 
        {
          if (isStartDate) 
          {
            _startDate = picked;
          } 
          else 
          {
            _endDate = picked;
          }
        });
      }

    @override
    Widget build(BuildContext context)
    {
        return Scaffold
        (
            appBar: AppBar
            (
                title: const Center
                (
                    child: Text("Add Experience Form")
                ),
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
            ),
           drawer: LeftDrawer(), 
           body: Form
           (
                key: _formKey,
                child: SingleChildScrollView
                (
                    child: Column
                    (
                        crossAxisAlignment: CrossAxisAlignment.start, 
                        children: 
                        [
                            // === Experience Name ===
                            Padding
                            (
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField
                                (
                                    decoration: InputDecoration
                                    (
                                        hintText: "Nama Pengalaman",
                                        labelText: "Nama Pengalaman",
                                        border: OutlineInputBorder
                                        (
                                            borderRadius: BorderRadius.circular(5.0)
                                        )
                                    ),
                                    onChanged: (String? value)
                                    {
                                        setState(() => _experienceName = value!);
                                    },
                                    validator: (String? value)
                                    {
                                        if (value == null || value.trim().isEmpty)
                                        {
                                            return "Nama pengalaman tidak boleh kosong!";
                                        }
                                        if (value.trim().length > 100) 
                                        {
                                            return "Nama pengalaman maksimal 100 karakter!";
                                        }
                                    return null;
                                    }
                                )
                            ),

                            // == Description Name ===
                            Padding
                            (
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField
                                (
                                    maxLines: 5,
                                    decoration: InputDecoration
                                    (
                                        hintText: "Deskripsi Pengalaman",
                                        labelText: "Deskripsi Pengalaman",
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))
                                        
                                    ),
                                    onChanged: (String? value)
                                    {
                                        setState(() => _description = value!); 
                                    },
                                    validator: (String? value)
                                    {
                                        if (value == null || value.trim().isEmpty)
                                        {
                                            return "Deskripsi pengalaman tidak boleh kosong!";
                                        }
                                        if (value.trim().length > 100) 
                                        {
                                            return "Deskripsi pengalaman maksimal 100 karakter!";
                                        }
                                        return null;
                                    },
                                )
                            ),
                            Padding
                            (
                                padding: const EdgeInsets.all(8.0),
                                child: DropdownButtonFormField<String>
                                (
                                    decoration: InputDecoration
                                    (
                                        labelText: "Kategori Pengalaman",
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                                    ),
                                    initialValue: _employment,
                                    items: _employmentType.map
                                    (
                                        (category) => DropdownMenuItem
                                        (
                                            value: category,
                                            child: Text(category),
                                        )
                                    ).toList(),
                                    onChanged: (String? newValue)
                                    {
                                        setState(() => _employment = newValue!);
                                    },
                                    validator: (String? value)
                                    {
                                        if (value == null || value.trim().isEmpty) 
                                        { 
                                            return "Kategori pengalaman harus dipilih!";
                                        }
                                        if (!_employmentType.contains(value)) 
                                        {
                                            return "Kategori pengalaman tidak valid!";
                                        }
                                        return null;
                                    }
                                )
                            ),

                                // === Start Date ===
                            Padding
                            (
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField
                                (
                                    key: ValueKey(_startDate),
                                    initialValue: _startDate == null ? "" : _formatDate(_startDate!),
                                    readOnly: true,
                                    decoration: InputDecoration
                                    (
                                        labelText: "Tanggal Mulai",
                                        hintText: "Pilih tanggal mulai",
                                        suffixIcon: const Icon(Icons.calendar_today),
                                        border: OutlineInputBorder
                                        (
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                    ),
                                    onTap: () => _selectDate(isStartDate: true),
                                    validator: (String? value) 
                                    {
                                        if (_startDate == null) 
                                        {
                                            return "Tanggal mulai tidak boleh kosong!";
                                        }
                                        return null;
                                    },
                                ),
                            ),

                            // === End Date ===
                            Padding
                            (
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField
                                (
                                    key: ValueKey(_endDate),
                                    initialValue: _endDate == null ? "" : _formatDate(_endDate!),
                                    readOnly: true,
                                    decoration: InputDecoration
                                    (
                                        labelText: "Tanggal Selesai",
                                        hintText: "Pilih tanggal selesai",
                                        suffixIcon: const Icon(Icons.calendar_today),
                                        border: OutlineInputBorder
                                        (
                                            borderRadius: BorderRadius.circular(5.0),
                                        ),
                                    ),
                                onTap: () => _selectDate(isStartDate: false),
                                validator: (String? value) 
                                {
                                    if (_endDate == null) 
                                    {
                                        return "Tanggal selesai tidak boleh kosong!";
                                    }
                                    if (_startDate != null && _endDate!.isBefore(_startDate!)) 
                                    {
                                        return "Tanggal selesai tidak boleh sebelum tanggal mulai!";
                                    }
                                    return null;
                                },
                              ),
                            ),


                            // === Tombol Simpan ===
                            Align
                            (
                                alignment: Alignment.bottomCenter,
                                child: Padding
                                (
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton
                                    (
                                        style: ButtonStyle
                                        (
                                            backgroundColor: WidgetStateProperty.all(Colors.indigo),
                                        ),
                                        onPressed: ()
                                        {
                                            if (_formKey.currentState!.validate())
                                            {
                                                showDialog
                                                (
                                                    context: context,
                                                    builder: (context)
                                                    {
                                                        return AlertDialog
                                                        (
                                                            title: const Text('Pengalaman berhasil ditambahkan!'),
                                                            content: SingleChildScrollView
                                                            (
                                                                child: Column
                                                                (
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: 
                                                                    [
                                                                        Text('Nama Pengalaman: $_experienceName'),
                                                                        Text('Deskripsi: $_description'),
                                                                        Text('Kategori: $_employment'),
                                                                    ],
                                                                )
                                                            ),
                                                            actions:
                                                            [
                                                                TextButton
                                                                (
                                                                    child: const Text('OK'),
                                                                    onPressed: ()
                                                                    {
                                                                        Navigator.pop(context);
                                                                        _formKey.currentState!.reset();
                                                                    },
                                                                ),
                                                            ],
                                                        );
                                                    },
                                                );
                                            }
                                        },
                                        child: const Text
                                        (
                                            "Save",
                                            style: TextStyle(color: Colors.white),
                                        ),
                                    ),
                                ),
                            ),
                        ] 
                    ),
                )
           ),
        );
    }
}
