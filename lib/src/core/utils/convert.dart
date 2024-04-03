// import 'package:doti_starter/src/core/src/core/logger/logger.dart';

// class Convert {
//   Convert();

//   static List<T> toList<T>(
//     dynamic map,
//     T Function(Map<String, dynamic> map) parser,
//   ) {
//     final list = <T>[];
//     if (map != null) {
//       for (final element in map) {
//         try {
//           list.add(parser(element));
//         } catch (e) {
//           logger.e('Error parsing list',
//               error: e, stackTrace: StackTrace.current);
//           list.clear();
//         }
//       }
//     }

//     return list;
//   }

//   static T toObject<T>(
//     dynamic map,
//     T Function(Map<String, dynamic> map) parser,
//   ) {
//     try {
//       return parser(map);
//     } catch (e) {
//       logger.e('Error parsing object',
//           error: e, stackTrace: StackTrace.current);

//       rethrow;
//     }
//   }

//   static List<String> toStringList(dynamic map) {
//     List<String> list = [];
//     if (map != null) {
//       list = List.from(map).cast<String>();
//     }

//     return list;
//   }
// }
