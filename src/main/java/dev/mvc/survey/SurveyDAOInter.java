package dev.mvc.survey;

import java.util.HashMap;
import java.util.List;


import dev.mvc.survey.SurveyVO;

public interface SurveyDAOInter {

/**
 * ����������
 * @param SurveyVO �Է� ���� �������� ����
 * @return
 */
  public int create(SurveyVO surveyVO);
  
  /**
   * ����������
   * @return 
   */
 public List<SurveyVO> list_m();
  
  
  /**
   * ������ ���
   * @return
   */
  public List<Manager_SurveyVO> list(int managerno);
  
  /**
   *  ���� ��ȸ
   * @param surveyno
   * @return
   */
  public Manager_SurveyVO read (int surveyno);
  
  public SurveyVO read_m(int surveyno);
  
  /**
   * ����
   * @param surveyVO
   * @return
   */
  public int update(SurveyVO surveyVO);
  
  /**
   * ����
   * @param surveyno
   * @return
   */
  public int delete(int surveyno);
  
  /**
   * �켱���� ����
   * @param surveyno
   * @return
   */
  public int update_seqno_up(int surveyno);
  
  /**
   * �켱���� ����
   * @param surveyno
   * @return
   */
  public int update_seqno_down(int surveyno);
  
  /**
   * �ۼ� ����
   * @param categrpno
   * @return
   */
  public int increaseCnt(int surveyno);

  /**
   * �ۼ� ����
   * @param categrpno
   * @return
   */
  public int decreaseCnt(int surveyno);
  
  /**
   * ���ο���surveyitemno����ϱ� ������
   * @return
   */
  public List<FindVO> findNo(int surveyno);
  
  /**
   * �˻� ���
   * @param categoryno
   * @return
   */
  public List<Manager_SurveyVO>list_by_manager_search(HashMap hashMap);
  
  /**
   * category�� �˻��� ���ڵ� ����
   * @return
   */
  public int search_count(HashMap hashMap);
      
  
  /**
   * �˻� ��� + ����¡
   * @param hashMap
   * @return
   */
  public List<Manager_SurveyVO> list_by_manager_search_paging(HashMap<String, Object> hashMap);

}