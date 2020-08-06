
package Controller;

import Model.Depart;
import Model.DungChung;
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
@RequestMapping(value = "/depart")
public class ControllerDepart {

    @Autowired
    SessionFactory factory;

    private List<Depart> getTable() {
        Session session = factory.openSession();
        String hql = "FROM Depart";
        Query query = session.createQuery(hql);
        return query.list();
    }

    @RequestMapping(value = "/danhSachPhongBan", method = RequestMethod.GET)
    public String danhSachPhongBan(ModelMap mm) {
        mm.addAttribute("list", getTable());
        mm.addAttribute("depart", new Depart());
        mm.addAttribute("lang", DungChung.getNgonNgu());
        return "danhSachPhongBan";
    }

    @RequestMapping(value = "/themPhongBan", method = RequestMethod.GET)
    public String them(ModelMap mm) {
        mm.addAttribute("depart", new Depart());
        mm.addAttribute("lang", DungChung.getNgonNgu());
        return "themPhongBan";
    }

    @RequestMapping(value = "/danhSachPhongBan", method = RequestMethod.POST)
    public String them(ModelMap mm, @Validated @ModelAttribute(value = "depart")Depart depart, BindingResult errors) {
        if (errors.hasErrors()) {
            mm.addAttribute("mes", "Vui lòng sửa các lỗi bên dưới");
            mm.addAttribute("lang", DungChung.getNgonNgu());
            return "themPhongBan";
        }else{
            Session session = factory.openSession();
            Transaction t = session.beginTransaction();
            try {
                session.save(depart);
                t.commit();
            } catch (Exception e) {
                t.rollback();
                mm.addAttribute("key", depart.getId());
                mm.addAttribute("table", "phòng ban");
                mm.addAttribute("url", "depart/themPhongBan.html");
                mm.addAttribute("lang", DungChung.getNgonNgu());
                return "errorInsert";
            } finally {
                session.close();
            }
        }
        mm.addAttribute("list", getTable());
        mm.addAttribute("depart", new Depart());
        mm.addAttribute("lang", DungChung.getNgonNgu());
        return "danhSachPhongBan";
    }

    @RequestMapping(value = "/tablePhongBan", method = RequestMethod.POST)
    public String capNhat(ModelMap mm, @Validated @ModelAttribute(value = "depart") Depart depart, BindingResult errors) {
        if (errors.hasErrors()) {
            mm.addAttribute("table", "phòng ban");
            mm.addAttribute("url", "depart/danhSachPhongBan.html");
            mm.addAttribute("lang", DungChung.getNgonNgu());
            return "errorUpdate";
        } else {
            Session session = factory.openSession();
            Transaction t = session.beginTransaction();
            try {
                session.update(depart);
                t.commit();
            } catch (Exception e) {
                t.rollback();
            } finally {
                session.close();
            }
            mm.addAttribute("list", getTable());
            mm.addAttribute("lang", DungChung.getNgonNgu());
            return "danhSachPhongBan";
        }
    }

    @RequestMapping(value = "/danhSach", method = RequestMethod.POST)
    public String xoa(ModelMap mm, @ModelAttribute(value = "depart") Depart depart) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            session.delete(depart);
            t.commit();
        } catch (Exception e) {
            t.rollback();
            mm.addAttribute("table", "Phòng ban");
            mm.addAttribute("name", depart.getName());
            mm.addAttribute("url", "depart/danhSachPhongBan.html");
            mm.addAttribute("lang", DungChung.getNgonNgu());
            return "errorKhoaNgoai";
        } finally {
            session.close();
        }
        mm.addAttribute("list", getTable());
        mm.addAttribute("lang", DungChung.getNgonNgu());
        return "danhSachPhongBan";
    }
    
    @RequestMapping(value = "/timKiem", method = RequestMethod.POST)
    public String timKiem(ModelMap mm, @RequestParam(value = "tkiem") Object tkiem) {
        if (!tkiem.toString().isEmpty()) {
            Session session = factory.openSession();
            String hql = "FROM Depart where id like :id or name like :name";
            Query query = session.createQuery(hql);
            query.setParameter("id", "%" + tkiem + "%");
            query.setParameter("name", "%" + tkiem + "%");
            List<Depart> list = query.list();
            mm.addAttribute("list", list);
        } else {
            mm.addAttribute("list", getTable());
        }
        mm.addAttribute("depart", new Depart());
        mm.addAttribute("lang", DungChung.getNgonNgu());
        return "danhSachPhongBan";
    }
}
