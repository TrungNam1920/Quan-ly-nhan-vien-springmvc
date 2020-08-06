
package Model;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.validator.constraints.NotBlank;



@Entity
@Table(name = "Departs")
public class Depart implements Serializable{
    @Id
    @Column(name = "Id")
    @NotBlank(message = "Vui lòng nhập id!")
    private String id;
    
    @Column(name = "Name")
    @NotBlank(message = "Vui lòng nhập name!")
    private String name;

    @OneToMany(mappedBy = "depart", fetch = FetchType.EAGER)
    private Collection<Staff> staffs;
    
    public Depart() {
    }

    public Depart(String id, String name) {
        this.id = id;
        this.name = name;
    }

    public Depart(String id, String name, Collection<Staff> staffs) {
        this.id = id;
        this.name = name;
        this.staffs = staffs;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Collection<Staff> getStaff() {
        return staffs;
    }

    public void setStaff(Collection<Staff> staffs) {
        this.staffs = staffs;
    }
}
