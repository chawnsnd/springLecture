package global.sesoc.web3.dao;

import java.util.ArrayList;

import global.sesoc.web3.vo.Person;

public interface PersonMapper {
	
	public int insertPerson(Person person);

	public Person selectPerson(String name);

	public ArrayList<Person> selectAll();

	public int deletePerson(String name);

	public int deleteAll();

	public int getCount();

}
