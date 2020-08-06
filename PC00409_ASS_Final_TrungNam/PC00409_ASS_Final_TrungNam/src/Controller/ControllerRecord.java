
package Controller;

import Model.DungChung;
import Model.Record;
import Model.Staff;
import java.util.List;
import javax.mail.internet.MimeMessage;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping(value = "/record")
public class ControllerRecord {
    private int kt = 0;
    
    @Autowired
    JavaMailSender mailer;
    
    @Autowired
    SessionFactory factory;

    @ModelAttribute(value = "staffs")
    public List<Staff> getStaff() {
        Session session = factory.openSession();
        String hql = "FROM Staff";
        Query query = session.createQuery(hql);
        return query.list();
    }

    private List<Record> getTable() {
        Session session = factory.openSession();
        String hql = "FROM Record";
        Query query = session.createQuery(hql);
        return query.list();
    }

    @RequestMapping(value = "/danhSachThanhTich", method = RequestMethod.GET)
    public String danhSachThanhTich(ModelMap mm) {
        mm.addAttribute("list", getTable());
        mm.addAttribute("record", new Record());
        mm.addAttribute("lang", DungChung.getNgonNgu());
        return "danhSachThanhTich";
    }

    @RequestMapping(value = "/themThanhTich", method = RequestMethod.GET)
    public String them(ModelMap mm) {
        mm.addAttribute("record", new Record());
        mm.addAttribute("lang", DungChung.getNgonNgu());
        return "themThanhTich";
    }

    @RequestMapping(value = "/danhSachThanhTich", method = RequestMethod.POST)
    public String them(ModelMap mm, @Validated @ModelAttribute(value = "record") Record record, BindingResult errors) {
        if (errors.hasErrors()) {
            mm.addAttribute("mes", "Vui lòng sửa các lỗi bên dưới");
            mm.addAttribute("lang", DungChung.getNgonNgu());
            return "themThanhTich";
        } else {
            Session session = factory.openSession();
            Transaction t = session.beginTransaction();
            try {
                session.save(record);
                t.commit();
            } catch (Exception e) {
                t.rollback();
                mm.addAttribute("key", record.getId());
                mm.addAttribute("table", "thành tích");
                mm.addAttribute("url", "record/themThanhTich.html");
                mm.addAttribute("lang", DungChung.getNgonNgu());
                return "errorInsert";
            } finally {
                session.close();
            }
        }
        mm.addAttribute("record", new Record());
        mm.addAttribute("list", getTable());
        mm.addAttribute("lang", DungChung.getNgonNgu());
        return "danhSachThanhTich";
    }

    @RequestMapping(value = "/tableThanhTich", method = RequestMethod.POST)
    public String capNhat(ModelMap mm, @Validated @ModelAttribute(value = "record") Record record, BindingResult errors) {
        if (errors.hasErrors()) {
            mm.addAttribute("table", "thành tích");
            mm.addAttribute("url", "record/danhSachThanhTich.html");
            mm.addAttribute("lang", DungChung.getNgonNgu());
            return "errorUpdate";
        } else {
            Session session = factory.openSession();
            Transaction t = session.beginTransaction();
            try {
                session.update(record);
                t.commit();
            } catch (Exception e) {
                t.rollback();
            } finally {
                session.close();
            }
            mm.addAttribute("list", getTable());
            mm.addAttribute("lang", DungChung.getNgonNgu());
            return "danhSachThanhTich";
        }
    }

    @RequestMapping(value = "/danhSach", method = RequestMethod.POST)
    public String xoa(ModelMap mm, @ModelAttribute(value = "record") Record record) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            session.delete(record);
            t.commit();
        } catch (Exception e) {
            t.rollback();
            mm.addAttribute("table", "Thành tích");
            mm.addAttribute("name", record.getStaff().getName());
            mm.addAttribute("url", "record/danhSachThanhTich.html");
            mm.addAttribute("lang", DungChung.getNgonNgu());
            return "errorKhoaNgoai";
        } finally {
            session.close();
        }
        mm.addAttribute("list", getTable());
        mm.addAttribute("lang", DungChung.getNgonNgu());
        return "danhSachThanhTich";
    }

    @RequestMapping(value = "/timKiem", method = RequestMethod.POST)
    public String timKiem(ModelMap mm, @RequestParam(value = "tkiem") Object tkiem) {
        if (!tkiem.toString().isEmpty()) {
            Session session = factory.openSession();
            String hql = "FROM Record where id like :id or type like :type or reason like :reason or year(date) like :date or staff.name like :name";
            Query query = session.createQuery(hql);
            if (tkiem.toString().matches("[0-9]") || tkiem.toString().matches("[0-9]{2}") || tkiem.toString().matches("[0-9]{3}")) {
                int id = Integer.parseInt(String.valueOf(tkiem));
                query.setInteger("id", id);
            } else {
                query.setInteger("id", 0);
            }
            query.setParameter("reason", "%" + tkiem + "%");
            if (tkiem.toString().equalsIgnoreCase("Thành tích") || tkiem.toString().equalsIgnoreCase("Thành")
                    || tkiem.toString().equalsIgnoreCase("Tích") || tkiem.toString().equalsIgnoreCase("thanh tich")
                    || tkiem.toString().equalsIgnoreCase("thanh") || tkiem.toString().equalsIgnoreCase("tich")) {
                tkiem = true;
                boolean gt = Boolean.parseBoolean(String.valueOf(tkiem));
                query.setBoolean("type", gt);
            } else if (tkiem.toString().equalsIgnoreCase("Kỷ luật") || tkiem.toString().equalsIgnoreCase("Kỷ")
                    || tkiem.toString().equalsIgnoreCase("Luật") || tkiem.toString().equalsIgnoreCase("ky")
                    || tkiem.toString().equalsIgnoreCase("luat") || tkiem.toString().equalsIgnoreCase("ky luat")) {
                tkiem = false;
                boolean gt = Boolean.parseBoolean(String.valueOf(tkiem));
                query.setBoolean("type", gt);
            } else {
                query.setParameter("type", null);
            }
            if (tkiem.toString().matches("[0-9]{4}")) {
                int nam = Integer.parseInt(String.valueOf(tkiem));
                query.setInteger("date", nam);
            } else {
                query.setInteger("date", 0);
            }
            query.setParameter("name", "%" + tkiem + "%");
            List<Record> list = query.list();
            mm.addAttribute("list", list);
        } else {
            mm.addAttribute("list", getTable());
        }
        mm.addAttribute("record", new Record());
        mm.addAttribute("lang", DungChung.getNgonNgu());
        return "danhSachThanhTich";
    }

    @RequestMapping(value = "/tongHopThanhTich", method = RequestMethod.GET)
    public String tongHopThanhTich(ModelMap mm) {
        Session session = factory.openSession();
        String hqlNV = "select staff.id, staff.name, SUM(case when type=1 then 1 else 0 end), SUM(case when type=0 then 1 else 0 end), staff.email from Record group by staff.id, staff.name, staff.email";
        Query queryNV = session.createQuery(hqlNV);
        mm.addAttribute("listNV", queryNV.list());

        String hqlPB = "select s.depart.id, s.depart.name, sum(case when r.type=1 then 1 else 0 end), sum(case when r.type=0 then 1 else 0 end) from Record r, Staff s where r.staff.id = s.id group by s.depart.id, s.depart.name";
        Query queryPB = session.createQuery(hqlPB);
        mm.addAttribute("listPB", queryPB.list());
        mm.addAttribute("lang", DungChung.getNgonNgu());
        return "tongHopThanhTich";
    }
    
    @RequestMapping(value = "/sendEmail", method = RequestMethod.POST)
    public String guiMail(ModelMap mm, @RequestParam(value = "email")String email, 
            @RequestParam(value = "thanhtich")String thanhtich,
            @RequestParam(value = "kyluat")String kyluat) {
        try {
            String from = "Namhtpc00409@gmail.com";
            String to = email;
            String subject = "GHI NHẬN THÀNH TÍCH/KỶ LUẬT";
            String body = "- Thành tích: " + thanhtich + "\n- Kỷ luật: " + kyluat;
            MimeMessage mail = mailer.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(mail);
            helper.setFrom(from, from);
            helper.setTo(to);
            helper.setReplyTo(from, from);
            helper.setSubject(subject);
            helper.setText(body, true);
            mailer.send(mail);
            mm.addAttribute("message", "Gửi mail thành công!");
        } catch (Exception e) {
            mm.addAttribute("message", "Gửi mail thất bại!");
            e.printStackTrace();
        }
        return "redirect:tongHopThanhTich.html";
    }
}
