abstract class NewsStates{}


class NewsInitalState extends NewsStates{}


class NewsBottomNavState extends NewsStates{}
class LoadingBusinessState extends NewsStates{}
class LoadingSportsState extends NewsStates{}
class LoadingScienceState extends NewsStates{}

class GetBusinessDataState extends NewsStates{}
class GetSportsDataState extends NewsStates{}
class GetScienceDataState extends NewsStates{}

class BusinessErrorState extends NewsStates{

  final String error;
  BusinessErrorState(this.error);
}
class SportsErrorState extends NewsStates{

  final String error;
  SportsErrorState(this.error);
}
class ScienceErrorState extends NewsStates{

  final String error;
  ScienceErrorState(this.error);
}