


class FormValidationMixin
{

  String? isEmpty(String? value)
  {
    if(value!.isEmpty)
    {
      return "field should not be empty";
    }
    return null;

  }
 











}