//todo 1 (next repo.dart)

class Company {
  final String name;
  final String location;
  final String logo;
  final String backdropPhoto;
  final String about;
  final List<Course> courses;

  Company({
    required this.name,
    required this.location,
    required this.logo,
    required this.backdropPhoto,
    required this.about,
    required this.courses,
  });
}

class Course {
  final String title;
  final String thumbnail;
  final String url;

  Course({required this.title, required this.thumbnail, required this.url});
}
