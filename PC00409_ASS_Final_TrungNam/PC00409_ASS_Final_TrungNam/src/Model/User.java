
package Model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.validator.constraints.NotBlank;


@Entity
@Table(name = "Users")
public class User implements Serializable {
    @Id
    @Column(name = "Username")
    @NotBlank(message = "Vui lòng nhập username")
    private String username;
    
    @Column(name = "Password")
    @NotBlank(message = "Vui lòng nhập password!")
    private String password;
    
    @Column(name = "Fullname")
    @NotBlank(message = "Vui lòng nhập fullname!")
    private String fullname;

    public User() {
    }

    public User(String username, String password, String fullname) {
        this.username = username;
        this.password = password;
        this.fullname = fullname;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }
}
