
package actions;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import daos.UsuarioDAO;
import model.Usuario;

public class LoginAction extends ActionSupport{
    private static final long serialVersionUID = 1L;
    
    Usuario user;   
    
    UsuarioDAO userDAO = new UsuarioDAO();
    
    @Override
    public void validate() {
        if (user.getUsername().length() == (0)) {
            this.addFieldError("user.username", "Name is required");
        }
        if (user.getPassword().length() == (0)) {
            this.addFieldError("user.password", "Password is required");
        }
    }
    
    public String login(){
        System.out.println("username: " + user.getUsername());
        System.out.println("password: " + user.getPassword());
        if (userDAO.existeUsuarioLogin(user.getUsername(), user.getPassword())) {
            System.out.println("Es success");
            return SUCCESS;
        } else {
            this.addActionError("Invalid username and password");
        }
        return INPUT;
    }

    public Usuario getUser() {
        return user;
    }

    public void setUser(Usuario user) {
        this.user = user;
    }   
}
