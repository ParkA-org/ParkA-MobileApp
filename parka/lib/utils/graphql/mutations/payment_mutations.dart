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
