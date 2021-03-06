package dev.mvc.surveyparty;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import dev.mvc.survey.SurveyDAOInter;

@Component("dev.mvc.surveyparty.SurveypartyProc")
public class SurveypartyProc implements SurveypartyProcInter {
  @Autowired
  @Qualifier("dev.mvc.surveyparty.SurveypartyDAO")
  
  private SurveypartyDAOInter surveypartyDAO = null;
  
  public SurveypartyProc(){
    System.out.println("--> SurveypartyProc created.");
  }
  

  @Override
  public int create(SurveypartyVO surveypartyVO) {
    
    return surveypartyDAO.create(surveypartyVO) ;
  }


  @Override
  public List<Survey_PartyVO> list() {
    
    return surveypartyDAO.list();
  }


  @Override
  public List<Survey_PartyVO> list_survey(int surveyno) {
    // TODO Auto-generated method stub
    return surveypartyDAO.list_survey(surveyno);
  }


  @Override
  public int mnoCnt(HashMap hashMap) {
    // TODO Auto-generated method stub
    return surveypartyDAO.mnoCnt(hashMap);
  }


  @Override
  public int delete(int surveyno) {
    
    return surveypartyDAO.delete(surveyno);
  }


  @Override
  public int delete_item(int surveyitemno) {
    // TODO Auto-generated method stub
    return surveypartyDAO.delete_item(surveyitemno);
  }

  



}
