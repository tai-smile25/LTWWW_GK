package fit.iuh.se.controllers;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import fit.iuh.se.entities.Doctor;
import fit.iuh.se.services.DoctorService;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/doctors")
public class DoctorController {

    @Autowired
    DoctorService doctorService;

    // Display list of doctors
    @GetMapping
    public ModelAndView getList(ModelAndView model) {
        List<Doctor> doctors = doctorService.findAll();
        model.setViewName("doctor-list");
        model.addObject("doctors", doctors);
        return model;
    }

    // Display list of doctors with pagination
    @GetMapping("/page/{pageNo}")
    public String getList(Model model, 
                          @PathVariable int pageNo,
                          @RequestParam(defaultValue = "5", required = false) int pageSize,
                          @RequestParam(defaultValue = "id", required = false) String sortBy,
                          @RequestParam(defaultValue = "ASC", required = false) String sortDirection) {
        Page<Doctor> doctors = doctorService.findAllWithPaging(pageNo - 1, pageSize, sortBy, sortDirection);
        
        model.addAttribute("currentPage", pageNo);
        model.addAttribute("totalPages", doctors.getTotalPages());
        model.addAttribute("totalItems", doctors.getTotalElements());

        model.addAttribute("sortBy", sortBy);
        model.addAttribute("sortDirection", sortDirection);
        
        model.addAttribute("doctors", doctors.getContent());
        
        return "doctor-list";
    }

    // Show form for adding a new doctor
    @GetMapping("/register")
    public ModelAndView showRegisterForm(ModelAndView model) {
        Doctor doctor = new Doctor();
        model.setViewName("register-doctor");
        model.addObject("doctor", doctor);
        return model;
    }

    // Save a new doctor or update an existing one
    @PostMapping("/save")
    public String save(@Valid @ModelAttribute Doctor doctor, BindingResult result) {
        if (result.hasErrors()) {
            return "register-doctor";
        }
        
        doctorService.save(doctor);
        
        return "redirect:/doctors";
    }

    // Show form for updating an existing doctor
    @GetMapping("/update")
    public ModelAndView update(@RequestParam("doctorId") int id, ModelAndView model) {
        Doctor doctor = doctorService.findById(id);
    
        if (doctor == null) {
            model.addObject("message", "Cannot find Doctor with ID: " + id);
            model.setViewName("error");
        } else {
            model.addObject("doctor", doctor);
            model.setViewName("register-doctor");
        }
        
        return model;
    }

    // Delete a doctor by ID
    @GetMapping("/delete")
    public String delete(@RequestParam("doctorId") int id) {
        doctorService.delete(id);
        return "redirect:/doctors";
    }

    // Search doctors by keyword
    @GetMapping("/search")
    public ModelAndView search(@RequestParam String keyword, ModelAndView model) {
        List<Doctor> doctors = doctorService.search(keyword);
        model.setViewName("doctor-list");
        model.addObject("doctors", doctors);
     
        return model;    
    }
}
