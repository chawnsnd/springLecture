package global.sesoc.web3.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.web3.vo.Person;

@Repository
public class PersonDao {

	@Autowired
	private SqlSession session;

	public int getCount() {
		PersonMapper mapper = session.getMapper(PersonMapper.class);
		int result = 0;
		try {
			result = mapper.getCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int insertPerson(Person person) {
		PersonMapper mapper = session.getMapper(PersonMapper.class);
		int result = 0;
		try {
			result = mapper.insertPerson(person);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public Person selectPerson(String name) {
		PersonMapper mapper = session.getMapper(PersonMapper.class);
		Person person = null;
		try {
			person = mapper.selectPerson(name);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return person;
	}

	public ArrayList<Person> getList() {
		PersonMapper mapper = session.getMapper(PersonMapper.class);
		ArrayList<Person> list = null;
		try {
			list = mapper.selectAll();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int deletePerson(String name) {
		PersonMapper mapper = session.getMapper(PersonMapper.class);
		int result = 0;
		try {
			result = mapper.deletePerson(name);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
	public int deleteAll() {
		PersonMapper mapper = session.getMapper(PersonMapper.class);
		int result = 0;
		try {
			result = mapper.deleteAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
