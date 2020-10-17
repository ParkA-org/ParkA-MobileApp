const String getAllUserPaymentMethodsQuery = r""" 
    query{
      getUserInformationById{
        id
        paymentInformation{
          id
          cardHolder
          expirationDate
          digit
          activated
          
        }
      }
    }
    """;
