
package Model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;



@Entity
@Table(name = "Records")
public class Record implements Serializable{
    @Id
    @GeneratedValue
    @Column(name = "Id")
    private Integer id;
    
    @Column(name = "Type")
    @NotNull(message = "Chưa chọn type")
    private Boolean type;
    
    @Column(name = "Reason")
    @NotBlank(message = "Vui lòng nhập reason")
    private String reason;
    
    @Column(name = "Date")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @NotNull(message = "Vui lòng chọn ngày ghi nhận")
    private Date date;
    
    @ManyToOne
    @JoinColumn(name = "StaffId")
    private Staff staff;

    public Record() {
    }

    public Record(Integer id, Boolean type, String reason, Date date, Staff staff) {
        this.id = id;
        this.type = type;
        this.reason = reason;
        this.date = date;
        this.staff = staff;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Boolean getType() {
        return type;
    }

    public void setType(Boolean type) {
        this.type = type;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Staff getStaff() {
        return staff;
    }

    public void setStaff(Staff staff) {
        this.staff = staff;
    }
}
