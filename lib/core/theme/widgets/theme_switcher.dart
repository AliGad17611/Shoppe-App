// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shoppe_app/core/theme/cubit/theme_cubit.dart';
// import 'package:shoppe_app/core/theme/cubit/theme_mode.dart';
// import 'package:shoppe_app/core/theme/cubit/theme_state.dart';
// import 'package:shoppe_app/core/utils/app_colors.dart';

// class ThemeSwitcher extends StatelessWidget {
//   const ThemeSwitcher({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       icon: const Icon(Icons.palette_outlined),
//       onPressed: () {
//         _showThemeDialog(context);
//       },
//     );
//   }

//   void _showThemeDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (dialogContext) => BlocProvider.value(
//         value: context.read<ThemeCubit>(),
//         child: const ThemeSwitcherDialog(),
//       ),
//     );
//   }
// }

// class ThemeSwitcherDialog extends StatelessWidget {
//   const ThemeSwitcherDialog({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ThemeCubit, ThemeState>(
//       builder: (context, state) {
//         return AlertDialog(
//           title: const Text(
//             'Choose Theme',
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               _ThemeOption(
//                 title: 'Light Theme',
//                 description: 'Clean and bright',
//                 icon: Icons.light_mode,
//                 color: AppColors.primary,
//                 isSelected: state.themeMode == AppThemeMode.light,
//                 onTap: () {
//                   context.read<ThemeCubit>().changeTheme(AppThemeMode.light);
//                   Navigator.of(context).pop();
//                 },
//               ),
//               const SizedBox(height: 12),
//               _ThemeOption(
//                 title: 'Dark Theme',
//                 description: 'Easy on the eyes',
//                 icon: Icons.dark_mode,
//                 color: AppColors.darkGrey,
//                 isSelected: state.themeMode == AppThemeMode.dark,
//                 onTap: () {
//                   context.read<ThemeCubit>().changeTheme(AppThemeMode.dark);
//                   Navigator.of(context).pop();
//                 },
//               ),
//               const SizedBox(height: 12),
//               _ThemeOption(
//                 title: 'Blue Theme',
//                 description: 'Cool and professional',
//                 icon: Icons.water_drop,
//                 color: AppColors.bluePrimary,
//                 isSelected: state.themeMode == AppThemeMode.blue,
//                 onTap: () {
//                   context.read<ThemeCubit>().changeTheme(AppThemeMode.blue);
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: const Text('Cancel'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

// class _ThemeOption extends StatelessWidget {
//   final String title;
//   final String description;
//   final IconData icon;
//   final Color color;
//   final bool isSelected;
//   final VoidCallback onTap;

//   const _ThemeOption({
//     required this.title,
//     required this.description,
//     required this.icon,
//     required this.color,
//     required this.isSelected,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(12),
//       child: Container(
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           border: Border.all(
//             color: isSelected ? color : Colors.grey.withOpacity(0.3),
//             width: isSelected ? 2 : 1,
//           ),
//           borderRadius: BorderRadius.circular(12),
//           color: isSelected ? color.withOpacity(0.1) : Colors.transparent,
//         ),
//         child: Row(
//           children: [
//             Container(
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: color.withOpacity(0.2),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Icon(icon, color: color, size: 24),
//             ),
//             const SizedBox(width: 16),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       color: isSelected ? color : null,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     description,
//                     style: TextStyle(fontSize: 12, color: Colors.grey[600]),
//                   ),
//                 ],
//               ),
//             ),
//             if (isSelected) Icon(Icons.check_circle, color: color, size: 24),
//           ],
//         ),
//       ),
//     );
//   }
// }
