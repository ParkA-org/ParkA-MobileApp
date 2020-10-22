const String getAllModelsQuery = r"""
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
