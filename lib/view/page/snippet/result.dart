import 'package:flutter/material.dart';
import 'package:toolbox/core/extension/context/locale.dart';
import 'package:toolbox/data/model/server/snippet.dart';
import 'package:toolbox/data/res/ui.dart';
import 'package:toolbox/view/widget/cardx.dart';
import 'package:toolbox/view/widget/custom_appbar.dart';
import 'package:toolbox/view/widget/expand_tile.dart';

class SnippetResultPage extends StatelessWidget {
  final List<SnippetResult?> results;

  const SnippetResultPage({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(l10n.result),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      itemCount: results.length,
      itemBuilder: (_, index) {
        final item = results[index];
        if (item == null) return UIs.placeholder;
        return CardX(
          ExpandTile(
            initiallyExpanded: results.length == 1,
            title: Text(item.dest ?? ''),
            subtitle: Text(item.time.toString(), style: UIs.textGrey),
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                scrollDirection: Axis.horizontal,
                child: Text(
                  item.result,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
