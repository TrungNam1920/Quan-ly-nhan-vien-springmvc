
package Controller;

import Model.DungChung;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping(value = "")
public class ControllerNull {

    @Autowired
    SessionFactory factory;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(ModelMap mm, @RequestParam(value = "ngonngu")String ten) {
        if (ten.startsWith("Vi")) {
            mm.addAttribute("lang", "Vietnamese");
        }else{
            mm.addAttribute("lang", "English");
        }
        mm.addAttribute("listNVPro", getNVPro());
        return "trangChu";
    }

    private List getNVPro() {
        Session session = factory.openSession();
        String hql = "select s.name, s.photo, d.name, sum(case when r.type=1 then 1 else 0 end) as so1 from Record r, Staff s, Depart d where r.staff.id = s.id and s.depart.id = d.id group by s.name, s.photo, d.name order by so1 DESC";
        Query query = session.createQuery(hql);
        return query.list();
    }

    
    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String home(ModelMap mm, @RequestParam(value = "language") String lang) {
        if (lang.equals("vi")) {
            mm.addAttribute("lang", "Vietnamese");
            DungChung.setNgonNgu("Vietnamese");
        }else{
            mm.addAttribute("lang", "English");
            DungChung.setNgonNgu("English");
        }
        mm.addAttribute("listNVPro", getNVPro());
        return "trangChu";
    }

    @RequestMapping(value = "/lang")
    public String lang(ModelMap mm, @RequestParam(value = "language")String lang) {
        return "redirect:home.html?language=" + lang;
    }
}
