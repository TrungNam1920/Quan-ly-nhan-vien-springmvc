
package Controller;

import Model.Depart;
import Model.DungChung;
import Model.Staff;
import java.io.File;
import java.util.List;
import javax.servlet.ServletContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


@Controller
@RequestMapping(value = "/staff")
public class ControllerStaff {

    @Autowired
    SessionFactory factory;

    @Autowired
    ServletContext context;

    @ModelAttribute(value = "departs")
    public List<Depart> getDepart() {
        Session session = factory.openSession();
        String hql = "FROM Depart";
        Query query = session.createQuery(hql);
        return query.list();
    }

    private List<Staff> getTable() {
        Session session = factory.openSession();
        String hql = "FROM Staff";
        Query query = session.createQuery(hql);
        return query.list();
    }

    @RequestMapping(value = "/danhSachNhanVien", method = RequestMethod.GET)
    public String danhSachNhanVien(ModelMap mm) {
        mm.addAttribute("list", getTable());
        mm.addAttribute("staff", new Staff());
        mm.addAttribute("lang", DungChung.getNgonNgu());
        return "danhSachNhanVien";
    }

    @RequestMapping(value = "/themNhanVien", method = RequestMethod.GET)
    public String them(ModelMap mm) {
        mm.addAttribute("staff", new Staff());
        mm.addAttribute("lang", DungChung.getNgonNgu());
        return "themNhanVien";
    }

    @RequestMapping(value = "/danhSachNhanVien", method = RequestMethod.POST)
    public String them(ModelMap mm, @RequestParam(value = "photo") MultipartFile photo, @Validated @ModelAttribute(value = "staff") Staff staff, BindingResult errors) {
        if (photo.isEmpty() && errors.hasErrors()) {
            mm.addAttribute("loi", "Vui lòng chọn hình");
            mm.addAttribute("mes", "Vui lòng sửa các lỗi bên dưới");
            mm.addAttribute("lang", DungChung.getNgonNgu());
            return "themNhanVien";
        } else {
            Session session = factory.openSession();
            Transaction t = session.beginTransaction();
            try {
                String photoPath = context.getRealPath("/images/" + photo.getOriginalFilename());
                photo.transferTo(new File(photoPath));             
            
                
                staff.setPhoto(photo.getOriginalFilename());
                session.save(staff);
                t.commit();
            } catch (Exception e) {
                t.rollback();
                mm.addAttribute("key", staff.getId());
                mm.addAttribute("table", "nhân viên");
                mm.addAttribute("url", "staff/themNhanVien.html");
                mm.addAttribute("lang", DungChung.getNgonNgu());
                return "errorInsert";
            } finally {
                session.close();
            }
        }
        mm.addAttribute("staff", new Staff());
        mm.addAttribute("list", getTable());
        mm.addAttribute("lang", DungChung.getNgonNgu());
        return "danhSachNhanVien";
    }

    @RequestMapping(value = "/tableNhanVien", method = RequestMethod.POST)
    public String capNhat(ModelMap mm, @RequestParam(value = "hinh") MultipartFile photo, @Validated @ModelAttribute(value = "staff") Staff staff, BindingResult errors) {
        if (photo.isEmpty() && errors.hasErrors()) {
            mm.addAttribute("table", "nhân viên");
            mm.addAttribute("url", "staff/danhSachNhanVien.html");
            mm.addAttribute("lang", DungChung.getNgonNgu());
            return "errorUpdate";
        } else {
            Session session = factory.openSession();
            Transaction t = session.beginTransaction();
            try {
                if (!photo.isEmpty()) {
                    String photoPath = context.getRealPath("/images/" + photo.getOriginalFilename());
                    photo.transferTo(new File(photoPath));
                    staff.setPhoto(photo.getOriginalFilename());
                }
                session.update(staff);
                t.commit();
            } catch (Exception e) {
                t.rollback();
            } finally {
                session.close();
            }
            mm.addAttribute("list", getTable());
            mm.addAttribute("lang", DungChung.getNgonNgu());
            return "danhSachNhanVien";
        }
    }
    
    @RequestMapping(value = "/danhSach", method = RequestMethod.POST)
    public String xoa(ModelMap mm, @ModelAttribute(value = "staff") Staff staff) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            session.delete(staff);
            t.commit();
        } catch (Exception e) {
            t.rollback();
            mm.addAttribute("table", "Nhân viên");
            mm.addAttribute("name", staff.getName());
            mm.addAttribute("url", "staff/danhSachNhanVien.html");
            mm.addAttribute("lang", DungChung.getNgonNgu());
            return "errorKhoaNgoai";
        } finally {
            session.close();
        }
        mm.addAttribute("list", getTable());
        mm.addAttribute("lang", DungChung.getNgonNgu());
        return "danhSachNhanVien";
    }
    
    @RequestMapping(value = "/timKiem", method = RequestMethod.POST)
    public String timKiem(ModelMap mm, @RequestParam(value = "tkiem") Object tkiem) {
        if (!tkiem.toString().isEmpty()) {
            Session session = factory.openSession();
            String hql = "FROM Staff where id like :id or name like :name or"
                    + " gender like :gender or year(birthday) like :year or"
                    + " email like :email or phone like :phone or salary like :salary";
            Query query = session.createQuery(hql);
            query.setParameter("id", "%" + tkiem + "%");
            query.setParameter("name", "%" + tkiem + "%");
            if(tkiem.toString().equalsIgnoreCase("Nam")){
                tkiem = true;
                boolean gt = Boolean.parseBoolean(String.valueOf(tkiem));
                query.setBoolean("gender", gt);
            }else if(tkiem.toString().equalsIgnoreCase("Nữ") || tkiem.toString().equalsIgnoreCase("Nu")){
                tkiem = false;
                boolean gt = Boolean.parseBoolean(String.valueOf(tkiem));
                query.setBoolean("gender", gt);
            }else{
                query.setParameter("gender", null);
            }
            if(tkiem.toString().matches("[0-9]{4}")){
                int nam = Integer.parseInt(String.valueOf(tkiem));
                query.setInteger("year", nam);
            }else{
                query.setInteger("year", 0);
            }
            query.setParameter("email", "%" + tkiem + "%");
            query.setParameter("phone", "%" + tkiem + "%");
            
            if(tkiem.toString().matches("[0-9]") || tkiem.toString().matches("[0-9]{2}") || tkiem.toString().matches("[0-9]{3}")){
                int luong = Integer.parseInt(String.valueOf(tkiem));
                query.setInteger("salary", luong);
            }else{
                query.setInteger("salary", 0);
            }          
            query.setParameter("note", "%" + tkiem + "%");
            query.setParameter("departname", "%" + tkiem + "%");
            List<Staff> list = query.list();
            mm.addAttribute("list", list);
        } else {
            mm.addAttribute("list", getTable());
        }
        mm.addAttribute("staff", new Staff());
        mm.addAttribute("lang", DungChung.getNgonNgu());
        return "danhSachNhanVien";
    }
}
