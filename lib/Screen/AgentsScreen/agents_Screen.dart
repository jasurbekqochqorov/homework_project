import 'package:flutter/material.dart';
import 'package:homework12/data/models/Agents/agents_models.dart';
import 'package:homework12/data/repositories/agents_repository.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/extension/extension.dart';
import 'package:homework12/utils/fonts/fonts.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../data/network_response.dart';

class AgentsScreen extends StatefulWidget {
  const AgentsScreen({super.key});

  @override
  State<AgentsScreen> createState() => _LaptopScreenState();
}

class _LaptopScreenState extends State<AgentsScreen> {
  final AgentRepository agentRepository = AgentRepository();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: AppColors.black,
          ),
        ),
        title: Text(
          'Agents',
          style: AppTextStyle.interSemiBold.copyWith(
            color: Colors.indigo,
            fontSize: 24.getW(),
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: agentRepository.getAgents(),
        builder: (
          BuildContext context,
          AsyncSnapshot<NetworkResponse> snapshot,
        ) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (snapshot.hasData) {
            List<AgentsModel>? agents =
                (snapshot.data as NetworkResponse).data as List<AgentsModel>;
            return GridView.count(
                padding: EdgeInsets.symmetric(
                    horizontal: 15.getW(), vertical: 30.getH()),
                scrollDirection: Axis.vertical,
                primary: false,
                crossAxisSpacing: 10.getW(),
                mainAxisSpacing: 10.getH(),
                childAspectRatio: 0.7,
                crossAxisCount: 2,
                children: [
                  ...List.generate(agents.length, (index) {
                    AgentsModel agent = agents[index];
                    return ZoomTapAnimation(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.getW(), vertical: 10.getH()),
                        width: width,
                        height: height,
                        decoration: BoxDecoration(
                            // color: AppColors.white,
                            gradient: LinearGradient(
                                // begin: Alignment.centerLeft,
                                // end: Alignment.centerRight,
                                colors: [
                                  agent.backgroundGradientColors[0]
                                      .toString()
                                      .toColor(),
                                  (agent.backgroundGradientColors[1]
                                      .toString()
                                      .toColor()),
                                  (agent.backgroundGradientColors[2]
                                      .toString()
                                      .toColor()),
                                  (agent.backgroundGradientColors[3]
                                      .toString()
                                      .toColor()),
                                ]),
                            boxShadow: const [
                              BoxShadow(
                                  offset: Offset(0, 1),
                                  spreadRadius: 0,
                                  blurRadius: 2)
                            ],
                            borderRadius: BorderRadius.circular(20.getW())),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              agent.displayIcon,
                              width: 180.getW(),
                              height: 100.getH(),
                            ),
                            const Spacer(),
                            Text(
                              "Name:${agent.displayName}",
                              style: AppTextStyle.interSemiBold.copyWith(
                                  color: Colors.orange, fontSize: 19.getW()),
                            ),
                            Text(
                              "Developer name: ${agent.developerName}",
                              style: AppTextStyle.interSemiBold
                                  .copyWith(color: Colors.orange),
                            )
                          ],
                        ),
                      ),
                    );
                  })
                ]);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

extension ColorExtension on String {
  toColor() {
    //  var hexColor = this.replaceAll("#", "");
    //   if (hexColor.length == 6) {
    //     hexColor = "$hexColor";
    //   }
    return Color(int.parse("0xff${this}"));
  }
}
