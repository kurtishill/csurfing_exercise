part of '../profile_view.dart';

class _AppBar extends StatelessWidget {
  const _AppBar(this.user);

  final User user;

  @override
  Widget build(BuildContext context) {
    final canNavBack = Navigator.of(context).canPop();

    final maxHeight = context.mediaQuery.size.height * 0.45 + 50;

    return SliverLayoutBuilder(
      builder: (context, constraints) {
        var leftPadding =
            16.0 + 50 * offset(constraints.scrollOffset, maxHeight);

        if (!canNavBack) {
          leftPadding = 16;
        }

        final bottomPadding =
            50 - 2 * offset(constraints.scrollOffset, maxHeight);

        final opacity = 1.0 - offset(constraints.scrollOffset, maxHeight);

        return SliverAppBar(
          pinned: true,
          expandedHeight: maxHeight,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Color.lerp(
            context.theme.colorScheme.inversePrimary,
            context.theme.colorScheme.surface,
            opacity,
          ),
          leading: canNavBack
              ? SizedBox(
                  height: 50,
                  width: 50,
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Opacity(
                        opacity: opacity,
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black.withValues(
                                alpha: 0.4,
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        constraints: const BoxConstraints(),
                        padding: const EdgeInsets.only(right: 4),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back_ios_new),
                      ),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
          bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 50),
            child: ColoredBox(
              color: context.theme.colorScheme.surface,
              child: const _TabBar(),
            ),
          ),
          flexibleSpace: Stack(
            children: [
              Opacity(
                opacity: opacity,
                child: Padding(
                  padding: EdgeInsets.only(bottom: bottomPadding),
                  child: SizedBox.expand(
                    child: CachedNetworkImage(
                      imageUrl: user.image,
                      placeholder: (_, _) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [0, 1],
                        colors: [
                          Colors.black.withValues(alpha: 0.4),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: bottomPadding,
                child: Opacity(
                  opacity: opacity,
                  child: SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: const [0, 1],
                          colors: [
                            Colors.black.withValues(alpha: 0.8),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: leftPadding,
                    bottom:
                        32 -
                        16 * offset(constraints.scrollOffset, maxHeight) +
                        bottomPadding,
                  ),
                  child: Text(
                    user.name,
                    style: context.theme.textTheme.titleLarge,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Opacity(
                  opacity: opacity,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: leftPadding,
                      bottom: 8 + bottomPadding,
                    ),
                    child: Text(user.about),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  double offset(double scrollOffset, double maxHeight) {
    return (scrollOffset / maxHeight).clamp(0, 1);
  }
}
