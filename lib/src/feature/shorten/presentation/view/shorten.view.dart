import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/style/palette.dart';
import '../../../../core/style/typography.dart';
import '../../../../product/config/constant/asset_constant.dart';
import '../../data/model/short_link.dart';
import '../../data/source/local/link_box.service.dart';
import '../bloc/link_bloc.dart';

class ShortenView extends StatelessWidget {
  const ShortenView({Key? key}) : super(key: key);
  static const routeName = '/shorten';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LinkBloc(
          context.read(),
          context.read(),
        )..add(GetLinkList()),
        child: const _ShortenViewBody(),
      ),
    );
  }
}

class _ShortenViewBody extends StatelessWidget {
  const _ShortenViewBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: BlocListener<LinkBloc, LinkState>(
            listener: (context, state) {
              if (state.state == GetLinkState.error) {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Url is not valid",
                      textAlign: TextAlign.center,
                    ),
                    backgroundColor: Colors.black54,
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.all(100),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                );
              } else if (state.state == GetLinkState.loading) {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => WillPopScope(
                    onWillPop: () async {
                      return false;
                    },
                    child: const Dialog(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      child:
                          Center(child: CircularProgressIndicator.adaptive()),
                    ),
                  ),
                );
              } else if (state.state == GetLinkState.loaded) {
                Navigator.of(context).pop();
              }
            },
            child: BlocBuilder<LinkBloc, LinkState>(
              builder: (context, state) {
                if (state.shortLinkList.isEmpty) {
                  return const OnboardingBody();
                } else {
                  return LinkHistoryBody(shortLinkList: state.shortLinkList);
                }
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: const _BottomBarWidget(),
    );
  }
}

class _BottomBarWidget extends StatefulWidget {
  const _BottomBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<_BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<_BottomBarWidget> {
  late final TextEditingController _controller;
  final _formKey = GlobalKey<FormState>();
  bool isEmpty = false;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    context.read<LinkBox>().closeBox();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(54, 41, 88, 1),
      height: 164.h,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(1.sw, 164.h),
            painter: CurvePainter(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 48),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _controller,
                    textAlign: TextAlign.center,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: isEmpty
                          ? 'Please add link here...'
                          : 'Shorten a link here...',
                      errorStyle: const TextStyle(height: 0),
                      hintStyle: TextStyle(
                        color: isEmpty
                            ? Colors.red
                            : Colors.grey, // <-- Change this
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      isEmpty = false;
                      setState(() {});
                      FocusScope.of(context).unfocus();
                      context
                          .read<LinkBloc>()
                          .add(LinkShortenTappedEvent(link: _controller.text));
                    } else {
                      isEmpty = true;
                      setState(() {});
                    }
                  },
                  child: Text(
                    'Shorten It !'.toUpperCase(),
                    style: MyTypography.xlargeSemiBoldText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LinkHistoryBody extends StatefulWidget {
  const LinkHistoryBody({Key? key, required this.shortLinkList})
      : super(key: key);

  final List<ShortLink> shortLinkList;

  @override
  State<LinkHistoryBody> createState() => _LinkHistoryBodyState();
}

class _LinkHistoryBodyState extends State<LinkHistoryBody> {
  String? coppiedLink;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Link History", style: MyTypography.xlargeSemiBoldText),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: widget.shortLinkList.length,
            itemBuilder: (context, index) {
              final ShortLink item = widget.shortLinkList[index];
              return CardListTile(
                item: item,
                isCoppied: coppiedLink == item.shortLink ? true : false,
                coppy: (link) {
                  coppiedLink = link;
                  setState(() {});
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class CardListTile extends StatelessWidget {
  const CardListTile(
      {Key? key,
      required this.item,
      required this.coppy,
      required this.isCoppied})
      : super(key: key);

  final ShortLink item;
  final ValueSetter<String> coppy;
  final bool isCoppied;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(item.originalLink!,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: MyTypography.xlargeSemiBoldText.copyWith(
                          color: const Color.fromRGBO(54, 41, 88, 1),
                        )),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Color.fromRGBO(54, 41, 88, 1),
                    ),
                    onPressed: () {
                      context.read<LinkBloc>().add(DeleteLink(item));
                    },
                  ),
                ],
              ),
            ),
            const Divider(thickness: 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(item.shortLink!,
                  overflow: TextOverflow.ellipsis,
                  style: MyTypography.xlargeSemiBoldText.copyWith(
                    color: Palette.primaryColor,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isCoppied
                      ? const Color.fromRGBO(54, 41, 88, 1)
                      : Palette.primaryColor,
                ),
                onPressed: () {
                  FlutterClipboard.copy(item.shortLink!)
                      .then((value) => coppy(item.shortLink!));
                },
                child: Text(
                  isCoppied ? 'COPIED !' : 'COPY',
                  style: MyTypography.xlargeSemiBoldText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SvgPicture.asset(
            AssetConstant.logo,
            width: .3.sw,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: SvgPicture.asset(
              AssetConstant.chemistryLab,
              width: .9.sw,
            ),
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              const Text(
                "Let's get started!.",
                style: MyTypography.xlargeSemiBoldText,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Paste your first link into \nthe field to shorten it.',
                style: MyTypography.xlargeRegularText,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white10
      ..style = PaintingStyle.fill;

    Path path = Path()
      ..moveTo(size.width * .3, 0)
      ..quadraticBezierTo(size.width * 0.3, size.height * 0.9, size.width * 0.7,
          size.height * 0.7)
      ..quadraticBezierTo(
          size.width * 0.9, size.height * 0.65, size.width, size.height * .75)
      ..lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
