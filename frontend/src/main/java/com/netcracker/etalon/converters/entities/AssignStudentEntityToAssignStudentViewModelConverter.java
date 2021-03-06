package com.netcracker.etalon.converters.entities;

import com.netcracker.etalon.beans.AssignStudentViewModel;
import com.netcracker.etalon.beans.PracticeViewModel;
import com.netcracker.etalon.beans.StudentViewModel;
import com.netcracker.pmbackend.impl.entities.AssignStudentsEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.ConversionService;
import org.springframework.core.convert.converter.Converter;


public class AssignStudentEntityToAssignStudentViewModelConverter implements Converter<AssignStudentsEntity, AssignStudentViewModel> {

    @Autowired
    private ConversionService conversionService;

    public AssignStudentViewModel convert(AssignStudentsEntity assignstudentsEntity) {
        AssignStudentViewModel assignStudentViewModel = new AssignStudentViewModel();
        assignStudentViewModel.setId(String.valueOf(assignstudentsEntity.getId()));
        assignStudentViewModel.setStudentViewModel(conversionService.convert(assignstudentsEntity.getStudentsByStudentId(), StudentViewModel.class));
        assignStudentViewModel.setPracticeViewModel(conversionService.convert(assignstudentsEntity.getPracticesByPracticeId(), PracticeViewModel.class));
        return assignStudentViewModel;
    }
}
