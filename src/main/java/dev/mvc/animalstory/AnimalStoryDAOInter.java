package dev.mvc.animalstory;

import java.util.HashMap;
import java.util.List;

public interface AnimalStoryDAOInter {

  /**
   * 글 생성
   * @param animalStoryVO
   * @return
   */
  public int create(AnimalStoryVO animalStoryVO);
  
  /**
   * 차트 리스트 - 전체 다 가져옴 => managerno 없이 불러올 수 있어야함
   * @return
   */
  public List<AnimalStoryVO> list();
  
  /**
   * 차트리스트 - anitype에 따라
   * @param anitype
   * @return
   */
  public List<AnimalStoryVO> list_anitype(HashMap hashmap);
  
  /**
   * 매니저 이름 검색 - 글쓴이 나타내기 위해
   * @return
   */
  public String manager(int managerno);
  
  
  /**
   * 하나의 글 삭제
   * @param anino
   * @return
   */
  public int delete(int anino);
  
  /**
   * 하나의 글 읽기
   * @param anino
   * @return
   */
  public AnimalStoryVO read(int anino);
  
  /**
   * 하나의 글 수정
   * @param aniVO
   * @return
   */
  public int update(AnimalStoryVO aniVO);
  
  /**
   * 내용 검색
   * @param content
   * @return
   */
  public List<AnimalStoryVO> list_by_search(String content);
  
  /**
   * 검색 + 페이징 - 전체
   * @param hashMap
   * @return
   */
  public List<AnimalStoryVO> list_by_search_paging(HashMap<String, Object> hashMap);
  
  /**
   * 검색 + 페이징 - 분류
   * @param hashMap
   * @return
   */
  public List<AnimalStoryVO> list_by_search_paging_anitype(HashMap hashMap);
  
  /**
   * 검색된 게시물 개수
   * @param content
   * @return
   */
  public int search_count(HashMap hashMap);
  
  /**
   * 검색된 게시물 개수 - 분류
   * @param hashMap
   * @return
   */
  public int search_count_anitype(HashMap hashMap);
  
  
}
