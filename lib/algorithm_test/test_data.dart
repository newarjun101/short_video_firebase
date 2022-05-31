
import '../algorithm_test/raw_node.dart';

final treeOne = RawNode(data : 1, children: [
   RawNode(data : 4, children: [
    RawNode(data : 10),
    RawNode(data : 12),
  ]),
  RawNode(data : 3, children: [
    RawNode(data : 3),
    RawNode(data : 10),
    RawNode(data : 1),
  ]),
]);

final treeTwo = RawNode(data : 4, children: [
  RawNode(data : 10),
  RawNode(data : 3),
  RawNode(data: 12),
]);