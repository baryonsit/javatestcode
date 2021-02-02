package resource;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.validator.Field;
import org.apache.commons.validator.ValidatorAction;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.validator.DynaValidatorForm;
import org.apache.struts.validator.Resources; 

public final class MyValidator {

  public static boolean validateRequiredMultilist(
    Object bean,
    ValidatorAction va, 
    Field field,
    ActionErrors errors,
    HttpServletRequest request) {
    
    // Declare the dynabean
	  
    DynaValidatorForm form = (DynaValidatorForm)bean;
    // Get the name of the field we want to validate
    String name = field.getProperty();
 
    // Get the data in the field
    String[] s = (String[])form.get(name);

    if (s == null || s.length == 0) {
      errors.add(field.getKey(),
                 Resources.getActionError(request, va, field));
      return false;
    }  

    return true;
  }
}