import 'package:councils/Services/data_service.dart';
import 'package:councils/Widgets/components/app_bar_custom.dart';
import 'package:councils/models/custom_icon_model/custom_icon.dart';
import 'package:councils/modules/Search_Views/cubit/CouncilSearch_Cubit.dart';
import 'package:councils/modules/Search_Views/cubit/CouncilSearch_State.dart';
import 'package:councils/modules/print_topics_view/print_topics_view.dart';
import 'package:councils/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';


class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  String pageName = 'Search';
  String searchOption = 'GetAllCouncilByname'; // Default selected option
  TextEditingController searchController = TextEditingController();
  late DataService dataService;

  @override
  void initState() {
    super.initState();
    // Initialize DataService here with the required auth token
    dataService = DataService(
        authToken: CacheHelper.getData(key: 'token'));
  }

  void _updateSearchOption(String option) {
    setState(() {
      searchOption = option;
      if (option == 'GetAllCouncilByname') {
        searchController.clear(); // Clear the search bar for 'Name'
      } else {
        _selectDate(context); // Open Date picker
      }
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
      setState(() {
        searchController.text = formattedDate;
      });
    }
  }

  Widget _buildSearchOption(String option, String label) {
    bool isSelected = searchOption == option;
    return Expanded(
      child: GestureDetector(
        onTap: () => _updateSearchOption(option),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xff766FEF) : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: const Color(0xff766FEF).withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ]
                : null,
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.black : Colors.grey,
              shadows: isSelected
                  ? [
                      Shadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 2,
                        offset: const Offset(0, 2),
                      ),
                    ]
                  : null,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),
      appBar: appBarCustom(pageName: pageName, fontSize: 25, context: context),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 25.h, 20.w, 25.h),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) {
                      final searchCubit = context.read<SearchCubit>();
                      if (searchOption == 'GetAllCouncilByname') {
                        searchCubit.searchByName(value.trim());
                      } else if (searchOption == 'GetCouncilBydate') {
                        searchCubit.searchByDate(value.trim());
                      } else if (searchOption == 'GetAllCouncilByDate') {
                        searchCubit.searchByDuration(value.trim());
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Search Council',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      contentPadding: EdgeInsets.only(left: 8.w),
                      suffixIcon: Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.h),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.string(
                            CustomIcon().search,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildSearchOption('GetAllCouncilByname', 'Name'),
                _buildSearchOption('GetCouncilBydate', 'Date'),
                _buildSearchOption('GetAllCouncilByDate', 'Duration'),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SearchLoaded) {
                  return ListView.builder(
                    itemCount: state.councils.length,
                    itemBuilder: (context, index) {
                      final council = state.councils[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 6.w, vertical: 5.h),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 2,
                            backgroundColor: const Color(0xffF5F7FB),
                            shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                final councilId = council.id;
                                return  PrintTopics(councilId: "4");
                              },
                            ));
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 12.w),
                                child: SvgPicture.asset(
                                  'assets/icons/Date.svg',
                                  height: 70.h,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    council.title,
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                  Text(
                                    council.hall ?? 'No Hall',
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                  Text(
                                    council.date,
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is SearchError) {
                  return Center(child: Text(state.message));
                } else {
                  return const Center(child: Text('Search for councils'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
