import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mod_monitor_app/bloc/trigger_state.dart';
import 'package:mod_monitor_app/ui_kit/colors.dart';
import 'package:mod_monitor_app/ui_kit/widgets/main_button.dart';

import '../bloc/trigger_bloc.dart';
import '../ui_kit/text_styles.dart';
import '../ui_kit/widgets/custom_textField_container.dart';
import '../utils/assets_paths.dart';

class MyTriggerScreen extends StatelessWidget {
  const MyTriggerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController triggerController = TextEditingController();
    context.read<TriggerCubit>().loadTriggers();

    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          text: 'My trigger list',
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leadingWidth: 50,
        leading: Container(
          padding: const EdgeInsets.only(left: 20),
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              AppIcons.arrowLeftIcon,
              width: 10,
            ),
          ),
        ),
      ),
      body: BlocBuilder<TriggerCubit, TriggerState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextWidget(
                        text: 'Name of the list',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: CustomTextFieldContainer(
                          hintText: 'Enter list name',
                        ),
                      ),
                      const TextWidget(
                        text: 'Write down the triggers:',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: CustomTextFieldContainer(
                          hintText: 'Enter trigger',
                          controller: triggerController,
                          hasSuffixIcon: true,
                          onSuffixTap: () {
                            final triggerText = triggerController.text.trim();
                            if (triggerText.isNotEmpty) {
                              context
                                  .read<TriggerCubit>()
                                  .addTrigger(triggerText);
                              triggerController.clear();
                            }
                          },
                        ),
                      ),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: state.triggers.map((trigger) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextWidget(
                                  text: trigger.name,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                                const SizedBox(width: 8),
                                GestureDetector(
                                  onTap: () {
                                    context
                                        .read<TriggerCubit>()
                                        .deleteTrigger(trigger.id);
                                  },
                                  child: const Icon(
                                    Icons.close,
                                    color: AppColors.black,
                                    size: 16,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                      const TextWidget(
                        text: 'My comment:',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                      const CustomTextFieldContainer(
                        height: 70,
                        maxLines: 3,
                        hintText: 'Start typing...',
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                MainButton(
                  text: 'Save',
                  fontColor: AppColors.primary,
                  onTap: () {},
                  containerColor: AppColors.bottomBarColor,
                  height: 50,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
