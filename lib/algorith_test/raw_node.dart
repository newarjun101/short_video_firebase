import 'dart:collection';

class RawNode {
  int data;
  List<RawNode>? children;

  RawNode({required this.data, this.children});
}

class TreeItems {
  final Set<int> _uniqueIntegers = HashSet<int>();

  Set<int> search(RawNode tree) {
    _addInOrder(tree);
    return _uniqueIntegers;
  }

  void _addInOrder(RawNode node) {
    _uniqueIntegers.add(node.data);
    if (node.children == null) return;
    for (int i = 0; i < node.children!.length; i++) {
      _addInOrder(node.children![i]);
    }
    for (final child in node.children!) {}
  }
}
