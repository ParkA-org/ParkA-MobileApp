const String getAllMakesQuery = r"""
query{
  getAllMakes{
    id
    name
    models{
      id
      name
    }
  }
}
""";
