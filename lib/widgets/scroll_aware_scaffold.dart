import 'package:flutter/material.dart';
import 'app_header.dart';
import 'sidebar.dart';

class ScrollAwareScaffold extends StatefulWidget {
  final Widget child;

  const ScrollAwareScaffold({super.key, required this.child});

  @override
  State<ScrollAwareScaffold> createState() => _ScrollAwareScaffoldState();
}

class _ScrollAwareScaffoldState extends State<ScrollAwareScaffold> {
  final ScrollController _scrollController = ScrollController();
  bool _showHeader = true;
  double _lastOffset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final offset = _scrollController.offset;
    if (offset > _lastOffset && offset > 0 && _showHeader) {
      setState(() => _showHeader = false);
    } else if (offset < _lastOffset && !_showHeader) {
      setState(() => _showHeader = true);
    }
    _lastOffset = offset;
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      body: SafeArea(
        child: Column(
          children: [
            // Animated header container that collapses when hidden
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: _showHeader ? 60 : 0,
              child: ClipRect(
                child: AnimatedSlide(
                  offset: _showHeader ? Offset.zero : const Offset(0, -1),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: Builder(
                    builder: (innerCtx) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: AppHeader(
                          onLogoPressed: () =>
                              Navigator.of(innerCtx).pushReplacementNamed('/'),
                          onMenuPressed: () =>
                              Scaffold.of(innerCtx).openDrawer(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: widget.child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
