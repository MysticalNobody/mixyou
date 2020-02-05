class InitState {
  bool inited;

  InitState({
    this.inited = false,
  });

  Map<String, dynamic> toJson() {
    return {};
  }

  static InitState fromJson(Map<String, dynamic> map) {
    if (map == null) return InitState();

    return InitState();
  }
}
