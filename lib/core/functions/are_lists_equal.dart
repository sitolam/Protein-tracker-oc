bool areListsEqual(List a, List b) {
  if (a.length != b.length) return false;
  for (int i = 0; i < a.length; i++) {
    if (a[i]['name'] != b[i]['name'] ||
        a[i]['weight'] != b[i]['weight'] ||
        a[i]['proteinDensity'] != b[i]['proteinDensity']) {
      return false;
    }
  }
  return true;
}
