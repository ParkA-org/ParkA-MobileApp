const String createVehicleMutation = r"""
    mutation($data:CreateVehicleInput!){
      createVehicle(createVehicleInput:$data){
        id
        model{
          name
        }
        licensePlate
        verified
        detail
        colorExterior{
          name
        }
        mainPicture
        pictures
        year
        alias
        bodyStyle{
          id
          name
        }
      }
    }
    """;

const String updateVehicleMutation = r"""
mutation($input:UpdateVehicleInput!){
  updateVehicle(updateVehicleInput:$input){
    id
  }
}
""";
