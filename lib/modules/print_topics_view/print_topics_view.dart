import 'dart:typed_data';
import 'package:councils/Services/data_service.dart';
import 'package:councils/models/print_topics_model/print_topic_model.dart';
import 'package:councils/modules/print_topics_view/cubit/print_topics_cubit.dart';
import 'package:councils/modules/print_topics_view/cubit/print_topics_state.dart';
import 'package:councils/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PrintTopics extends StatelessWidget {
  late String councilId;

  PrintTopics({Key? key, required this.councilId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TopicsCubit(
        dataService: DataService(
            authToken: CacheHelper.getData(key: 'token')),
        councilId: int.parse(councilId),
      )..fetchTopics(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Topics Result')),
        body: const TopicsView(),
      ),
    );
  }
}

class TopicsView extends StatelessWidget {
  const TopicsView({Key? key}) : super(key: key);

  Future<Uint8List> _generatePdf(
      PdfPageFormat format, List<PrintTopicModel> topics) async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.MultiPage(
        pageFormat: format,
        build: (pw.Context context) {
          return [
            pw.Header(
                level: 0,
                child: pw.Text('تقرير المجلس', textAlign: pw.TextAlign.center)),
            pw.ListView.builder(
              itemCount: topics.length,
              itemBuilder: (context, index) {
                final topic = topics[index];
                return pw.Container(
                  margin: const pw.EdgeInsets.only(bottom: 20),
                  padding: const pw.EdgeInsets.all(15),
                  decoration: pw.BoxDecoration(
                    border: pw.Border.all(color: PdfColors.grey),
                    borderRadius:
                        const pw.BorderRadius.all(pw.Radius.circular(5)),
                  ),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'الموضوع ${index + 1}',
                        style: pw.TextStyle(
                            fontSize: 18, fontStyle: pw.FontStyle.italic),
                      ),
                      pw.Text(
                        'اسم الموضوع : ${topic.title}',
                        style: pw.TextStyle(fontSize: 16),
                      ),
                      pw.Text(
                        'تصنيف mmmmm الموضوع : ${topic.type}',
                        style: pw.TextStyle(fontSize: 16),
                      ),
                      pw.Text(
                        'نبذه عنه : ${topic.notes}',
                        style: pw.TextStyle(fontSize: 16),
                      ),
                      pw.Text(
                        'القرار الذي تم اتخاذه بشأنه :\n${topic.result}',
                        style: pw.TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                );
              },
            ),
          ];
        },
      ),
    );

    return pdf.save();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopicsCubit, TopicsState>(
      builder: (context, state) {
        if (state is TopicsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TopicsLoaded) {
          return PdfPreview(
            build: (format) => _generatePdf(format, state.topics),
          );
        } else if (state is TopicsError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('Please wait...'));
        }
      },
    );
  }
}
