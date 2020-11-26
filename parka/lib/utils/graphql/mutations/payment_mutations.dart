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

const String updatePaymentMutation = r"""
    mutation($data:UpdatePaymentInput!){
      updatePayment(updatePaymentInput: $data){
        cardHolder
      }
    }
""";
