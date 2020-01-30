package global.sesoc.web3.dao;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import javax.naming.Context;

import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;

import global.sesoc.web3.vo.Person;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@WebAppConfiguration
@Transactional
public class PersonDaoTest {
	
	@Autowired
	private ApplicationContext context;

	@Autowired
	private PersonDao personDao;

	private Person[] personArr;
	private Person person;
	
	@Before
	public void setPerson() {
		
		personArr = new Person[10];
		for(int i=0; i<personArr.length; i++) {			
			Person person = Person.builder()
					.name("테스트이름"+i)
					.age(i)
					.address("테스트주소"+i)
					.build();
			personArr[i] = person;
		}
		person = Person.builder()
				.name("테스트이름")
				.age(80)
				.address("테스트주소")
				.build();
	}
	
	@Test
	public void deleteAll() {
		personDao.deleteAll();
		assertThat(personDao.getCount(), is(0));
	}
	
	@Test
	public void insert() {
		personDao.deleteAll();
		personDao.insertPerson(person);
		assertThat(personDao.getCount(), is(1));
	}

	@Test
	public void select() {
		personDao.deleteAll();
		personDao.insertPerson(person);
		assertThat(personDao.selectPerson(person.getName()), is(person));
	}

	@Test
	public void selectAll() {
		personDao.deleteAll();
		for (Person person : personArr) {			
			personDao.insertPerson(person);
		}
		for (Person person : personArr) {			
			assertThat(personDao.selectPerson(person.getName()), is(person));
		}
	}
	
	@Test
	public void delete() {
		personDao.deleteAll();
		personDao.insertPerson(person);
		personDao.deletePerson(person.getName());
		assertThat(personDao.getCount(), is(0));
	}
}
