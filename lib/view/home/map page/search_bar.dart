import 'package:flutter/material.dart';
import 'package:medical/view/home/map%20page/vending_machine_service.dart';

class SearchBarWidget extends StatefulWidget {
  final List<VendingMachineModel> machines;
  final Function(VendingMachineModel) onMachineSelected;

  const SearchBarWidget({
    super.key,
    required this.machines,
    required this.onMachineSelected,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _searchController = TextEditingController();
  List<VendingMachineModel> _filteredMachines = [];
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _filteredMachines = List.from(widget.machines);
  }

  @override
  void didUpdateWidget(SearchBarWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.machines != widget.machines) {
      setState(() {
        _filteredMachines = List.from(widget.machines);
      });
    }
  }

  void _filterMachines() {
    final query = _searchController.text.trim();
    setState(() {                                                                                    
      if (query.isEmpty) {
        _filteredMachines = List.from(widget.machines);
      } else {
        _filteredMachines = widget.machines
            .where((machine) =>
                machine.location.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _showSearchResults() {
    setState(() {
      _isSearching = true;
      _filteredMachines = List.from(widget.machines);
      _searchController.clear();
    });
    
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          width: double.maxFinite,
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        autofocus: true,
                        decoration: InputDecoration(
                          hintText: 'ابحث عن ماكينة...',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        ),
                        onSubmitted: (_) => _filterMachines(),
                      ),
                    ),
                    SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: _searchController.text.trim().isEmpty ? null : _filterMachines,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: Text('بحث'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: _filteredMachines.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.search_off, size: 64, color: Colors.grey),
                            SizedBox(height: 16),
                            Text(
                              'لا توجد نتائج',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: _filteredMachines.length,
                        itemBuilder: (context, index) {
                          final machine = _filteredMachines[index];
                          return ListTile(
                            title: Text(machine.location),
                            subtitle: Text(
                              machine.distance != null
                                  ? 'المسافة: ${machine.distance!.toStringAsFixed(1)} كم'
                                  : '',
                            ),
                            leading: Icon(Icons.room),
                            onTap: () {
                              Navigator.pop(context);
                              widget.onMachineSelected(machine);
                              setState(() => _isSearching = false);
                            },
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    ).then((_) {
      if (_isSearching) {
        setState(() => _isSearching = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 16,
      left: 16,
      right: 16,
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        child: InkWell(
          onTap: _showSearchResults,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Icon(Icons.search),
                SizedBox(width: 12),
                Text(
                  'ابحث عن ماكينة...',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
} 