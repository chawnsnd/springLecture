package global.sesoc.web3.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.web3.vo.Person;

@Repository
public class PersonDao {

	@Autowired
	private SqlSession session;

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

}
