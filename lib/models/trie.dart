class TrieNode {
  Map<String, TrieNode> children = {};
  bool isEndOfWord = false;
}

class Trie {
  final TrieNode root = TrieNode();

  void insert(String word) {
    var node = root;
    for (var char in word.toLowerCase().split('')) {
      node = node.children.putIfAbsent(char, () => TrieNode());
    }
    node.isEndOfWord = true;
  }

  List<String> searchPrefix(String prefix) {
    var node = root;
    for (var char in prefix.toLowerCase().split('')) {
      if (!node.children.containsKey(char)) return [];
      node = node.children[char]!;
    }
    return _collectWords(prefix, node);
  }

  List<String> _collectWords(String prefix, TrieNode node) {
    List<String> results = [];
    if (node.isEndOfWord) results.add(prefix);
    for (var entry in node.children.entries) {
      results.addAll(_collectWords(prefix + entry.key, entry.value));
    }
    return results;
  }
}
