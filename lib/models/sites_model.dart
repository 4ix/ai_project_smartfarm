class SitesModel {
  late final List<String> siteIds;

  SitesModel.fromJson(Map<String, dynamic> json) {
    final siteIdsJson = json['site_ids'] as List<dynamic>;
    siteIds = siteIdsJson.map((id) => id.toString()).toList();
  }
}
