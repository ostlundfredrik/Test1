class CoWorker {
  String username;
  //Home/Office/unknown
  WorkerLocation location;
  DateTime lastUpdated;

  CoWorker({
    this.username,
    this.location,
    this.lastUpdated,
  });
}

enum WorkerLocation { home, office, unknown }

class StalkerModel {
  List<CoWorker> coWorkers;
  CoWorker mySelf;
  //home location
  //work location

  StalkerModel() {
    mySelf = new CoWorker(
        username: "Fredrik",
        location: WorkerLocation.unknown,
        lastUpdated: DateTime.now());
    updateWorkers();
  }

  void updateWorkers() {
    coWorkers = fakeWorkers;
  }
}

final fakeWorkers = [
  new CoWorker(
      username: "Mikaela",
      location: WorkerLocation.home,
      lastUpdated: DateTime.parse("2020-01-20 20:18:04Z")),
  new CoWorker(
      username: "Fredrik",
      location: WorkerLocation.office,
      lastUpdated: DateTime.parse("2019-12-03 10:10:01Z")),
  new CoWorker(
      username: "Benji",
      location: WorkerLocation.unknown,
      lastUpdated: DateTime.parse("2020-04-02 13:00:00Z"))
];
