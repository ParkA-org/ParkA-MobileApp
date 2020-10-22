const String getAllModelsQuery = r"""
    query{
      getAllMakes{
        icon
        name
        models{
          id
          make
          name
        }
      }
    }
    """;
