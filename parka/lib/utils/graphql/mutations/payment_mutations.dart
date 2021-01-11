const String createPaymentMutation = r"""
    mutation($data:CreatePaymentInput!){
      createPayment(createPaymentInput:$data){
        cardHolder
        expirationDate
        digit
        activated  
      }
    }
    """;

const String deletePaymentMutation = r"""
mutation($data:String!){
  deletePayment(id:$data)
}
""";

const String updatePaymentMutation = r"""
    mutation($data:UpdatePaymentInput!){
      updatePayment(updatePaymentInput: $data){
        cardHolder
      }
    }
""";
