
package Controller;

import Model.DungChung;
import Model.User;
import java.util.List;
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


@Controller
@RequestMapping(value = "/user")
public class ControllerUser {

    @Autowired
    SessionFactory factory;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(ModelMap mm) {
        mm.addAttribute("bien", 1);
        return "login";
    }

    private List<User> getTable() {
        Session session = factory.openSession();
        String hql = "FROM User";
        Query query = session.createQuery(hql);
        return query.list();
    }

    @RequestMapping(value = "/danhSachTaiKhoan", method = RequestMethod.GET)
    public String danhSachTaiKhoan(ModelMap mm) {
        mm.addAttribute("list", getTable());
        mm.addAttribute("user", new User());
        mm.addAttribute("lang", DungChung.getNgonNgu());
        return "danhSachTaiKhoan";
    }

    @RequestMapping(value = "/themTaiKhoan", method = RequestMethod.GET)
    public String them(ModelMap mm) {
        mm.addAttribute("user", new User());
        mm.addAttribute("userTK", new User());
        mm.addAttribute("lang", DungChung.getNgonNgu());
        return "themTaiKhoan";
    }

    @RequestMapping(value = "/danhSachTaiKhoan", method = RequestMethod.POST)
    public String them(ModelMap mm, @Validated @ModelAttribute(value = "user") User user, BindingResult errors) {
        if (errors.hasErrors()) {
            mm.addAttribute("mes", "Vui lòng sửa các lỗi bên dưới");
            mm.addAttribute("lang", DungChung.getNgonNgu());
            return "themTaiKhoan";
        } else {
            Session session = factory.openSession();
            Transaction t = session.beginTransaction();
            try {
                session.save(user);
                t.commit();
            } catch (Exception e) {
                t.rollback();
                mm.addAttribute("key", user.getUsername());
                mm.addAttribute("table", "tài khoản");
                mm.addAttribute("url", "user/themTaiKhoan.html");
                mm.addAttribute("lang", DungChung.getNgonNgu());
                return "errorInsert";
            } finally {
                session.close();
            }
        }
        mm.addAttribute("user", new User());
        mm.addAttribute("list", getTable());
        mm.addAttribute("lang", DungChung.getNgonNgu());
        return "danhSachTaiKhoan";
    }

    @RequestMapping(value = "/tableTaiKhoan", method = RequestMethod.POST)
    public String capNhat(ModelMap mm, @Validated @ModelAttribute(value = "user") User user, BindingResult errors) {
        if (errors.hasErrors()) {
            mm.addAttribute("table", "tài khoản");
            mm.addAttribute("url", "user/danhSachTaiKhoan.html");
            mm.addAttribute("lang", DungChung.getNgonNgu());
            return "errorUpdate";
        } else {
            Session session = factory.openSession();
            Transaction t = session.beginTransaction();
            try {
                session.update(user);
                t.commit();
            } catch (Exception e) {
                t.rollback();
            } finally {
                session.close();
            }
            mm.addAttribute("list", getTable());
            mm.addAttribute("lang", DungChung.getNgonNgu());
            return "danhSachTaiKhoan";
        }
    }

    @RequestMapping(value = "/danhSach", method = RequestMethod.POST)
    public String xoa(ModelMap mm, @ModelAttribute(value = "user") User user) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            session.delete(user);
            t.commit();
        } catch (Exception e) {
            e.printStackTrace();
            t.rollback();
        } finally {
            session.close();
        }
        mm.addAttribute("list", getTable());
        mm.addAttribute("lang", DungChung.getNgonNgu());
        return "danhSachTaiKhoan";
    }

    @RequestMapping(value = "/timKiem", method = RequestMethod.POST)
    public String timKiem(ModelMap mm, @RequestParam(value = "tkiem") Object tkiem) {
        if (!tkiem.toString().isEmpty()) {
            Session session = factory.openSession();
            String hql = "FROM User where username like :user or password like :pass or fullname like :name";
            Query query = session.createQuery(hql);
            query.setParameter("user", "%" + tkiem + "%");
            query.setParameter("pass", "%" + tkiem + "%");
            query.setParameter("name", "%" + tkiem + "%");
            List<User> list = query.list();
            mm.addAttribute("list", list);
        } else {
            mm.addAttribute("list", getTable());
        }
        mm.addAttribute("user", new User());
        mm.addAttribute("lang", DungChung.getNgonNgu());
        return "danhSachTaiKhoan";
    }

    private List getNVPro() {
        Session session = factory.openSession();
        String hql = "select s.name, s.photo, d.name, sum(case when r.type=1 then 1 else 0 end) as so1 from Record r, Staff s, Depart d where r.staff.id = s.id and s.depart.id = d.id group by s.name, s.photo, d.name order by so1 DESC";
        Query query = session.createQuery(hql);
        return query.list();
    }
    
    @RequestMapping(value = "/login")
    public String login(ModelMap mm, @RequestParam(value = "username") String user, @RequestParam(value = "password") String pass) {
        if (user.isEmpty() || pass.isEmpty()) {
            mm.addAttribute("bien", 1);
            mm.addAttribute("mes", "Đăng nhập thất bại!");
            return "login";
        } else {
            Session session = factory.openSession();
            String hql = "FROM User where Username = :user and Password = :pass";
            Query query = session.createQuery(hql);
            query.setParameter("user", user);
            query.setParameter("pass", pass);
            List<User> list = query.list();
            if (list.size() > 0) {
                mm.remove("bien");
                mm.addAttribute("listNVPro", getNVPro());
                mm.addAttribute("lang", "Vietnamese");
                DungChung.setNgonNgu("Vietnamese");
                return "trangChu";
            } else {
                mm.addAttribute("bien", 1);
                mm.addAttribute("mes", "Đăng nhập thất bại!");
                return "login";
            }
        }
    }
    
    @RequestMapping("/trangchu")
    public String trangChu(){
        return "trangChu";
    }

    
}
