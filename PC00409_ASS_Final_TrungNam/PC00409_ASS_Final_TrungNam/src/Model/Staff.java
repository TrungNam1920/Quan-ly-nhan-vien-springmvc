
package Model;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;



@Entity
@Table(name = "Staffs")
public class Staff implements Serializable{
    @Id
    @Column(name = "Id")
    @NotBlank(message = "Vui lòng nhập id")
    private String id;
    
    @Column(name = "Name")
    @NotBlank(message = "Vui lòng nhập name")
    private String name;
    
    @Column(name = "Gender")
    @NotNull(message = "Chưa chọn giới tính")
    private Boolean gender;
    
    @Column(name = "Birthday")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @NotNull(message = "Vui lòng chọn ngày sinh")
    private Date birthday;
    
    @Column(name = "Photo")
    private String photo;
    
    @Column(name = "Email")
    @Email(message = "Sai định dạng email")
    @NotBlank(message = "Vui lòng nhập email")
    private String email;
    
    @Column(name = "Phone")
    @Pattern(regexp = "0[0-9]{9}", message = "Phone gồm 10 số bắt đầu từ 0")
    private String phone;
    
    @Column(name = "Salary")
    @NotNull(message = "Vui lòng nhập salary")
    @DecimalMin(value = "0", message = "Lương số dương từ 0 đến 999 triệu")
    @DecimalMax(value = "999", message = "Lương số dương từ 0 đến 999 triệu")
    private Float salary;
    
  
    
    @Column(name = "Notes")
    private String note;
    
    @ManyToOne
    @JoinColumn(name = "DepartId")
    private Depart depart;

    @OneToMany(mappedBy = "staff", fetch = FetchType.EAGER)
    private Collection<Record> records;
    
    public Staff() {
    }

    public Staff(String id, String name, Boolean gender, Date birthday, String photo, String email, String phone, Float salary, String note, Depart depart) {
        this.id = id;
        this.name = name;
        this.gender = gender;
        this.birthday = birthday;
        this.photo = photo;
        this.email = email;
        this.phone = phone;
        this.salary = salary;
        this.note = note;
        this.depart = depart;
    }

    public Staff(String id, String name, Boolean gender, Date birthday, String photo, String email, String phone, Float salary, String note, Depart depart, Collection<Record> records) {
        this.id = id;
        this.name = name;
        this.gender = gender;
        this.birthday = birthday;
        this.photo = photo;
        this.email = email;
        this.phone = phone;
        this.salary = salary;
        this.note = note;
        this.depart = depart;
        this.records = records;
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

    public Boolean getGender() {
        return gender;
    }

    public void setGender(Boolean gender) {
        this.gender = gender;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Float getSalary() {
        return salary;
    }

    public void setSalary(Float salary) {
        this.salary = salary;
    }  
    
    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Depart getDepart() {
        return depart;
    }

    public void setDepart(Depart depart) {
        this.depart = depart;
    }

    public Collection<Record> getRecords() {
        return records;
    }

    public void setRecords(Collection<Record> records) {
        this.records = records;
    }
}
