package daos;

import model.HibernateUtil;
import model.Usuario;
import org.hibernate.Query;
import org.hibernate.Session;

public class UsuarioDAO {

    Session session = null;

    public UsuarioDAO() {
        this.session = HibernateUtil.getSessionFactory().getCurrentSession();
    }

    public boolean existeUsuarioLogin(String username, String pass) {
        boolean existe = false;
        Usuario user = null;
        try {
            org.hibernate.Transaction tx = session.beginTransaction();
            Query q = session.createQuery("from Usuario as u where u.username='" + username + "' AND u.password='" + pass + "'");
            user = (Usuario) q.uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(user != null)
            existe = true;
        return existe;
    }
}
