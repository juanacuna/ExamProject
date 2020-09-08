package cl.inacap.exam.validators;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import cl.inacap.exam.models.User;

@Component
public class ProjectValidator implements Validator{
	
	@Override
    public boolean supports(Class<?> clazz) {
        return User.class.equals(clazz);
    }
    
    @Override
    public void validate(Object target, Errors errors) {
        User user = (User) target;
        
        if (!user.getPasswConf().equals(user.getPassw())) {
            errors.rejectValue("passwConf", "Match");
        }         
    }

}
