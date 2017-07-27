package customTools;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import customTools.Person;

public class DBperson {
	
	public static Person getPerson(int personID)
	{
		EntityManager em = DbUtil.getEmFactory().createEntityManager();
		Person person = em.find(Person.class, personID);
		return person; 
	}
	
	public static Person getPerson(String username)
	{
		EntityManager em = DbUtil.getEmFactory().createEntityManager();
		String qString = "Select u from Person u "
				+ "where u.username = :username";
		TypedQuery<Person> q = em.createQuery(qString, Person.class);
		q.setParameter("username", username);
		Person p = null;
		try {
			p = q.getSingleResult();
		}catch (NoResultException e){
			System.out.println(e);
		}finally{
			em.close();
		}
		return p;
	}
	
	public static boolean isValidPerson(String username, String userpassword)
	{
		EntityManager em = DbUtil.getEmFactory().createEntityManager();
		String qString = "Select count(b.personID) from Person b "
				+ "where b.username = :username and b.userpassword = :userpassword";
		TypedQuery<Long> q = em.createQuery(qString,Long.class);
		boolean result = false;
		q.setParameter("username",username);
		q.setParameter("userpassword",userpassword);

		try{
			long personID = q.getSingleResult();
			if (personID > 0)
			{
				result = true;
			}
		}catch (Exception e){

			result = false;
		}
		finally{
			em.close(); 
		} 
		return result;

	}
	public static void delete(Person User) {
		EntityManager em = DbUtil.getEmFactory().createEntityManager();
		EntityTransaction trans = em.getTransaction();
		try {
			trans.begin();
			em.remove(em.merge(User));
			trans.commit();
		} catch (Exception e) {
			System.out.println(e);
			trans.rollback();
		} finally {
			em.close();
		}
	}
	/**
	 * Updates the data in a Bhuser
	 * Pass the method a Bhuser with all the values set to your liking and 
	 * this method will update the database with these values.
	 * This method doesn't actually return anything but the good feeling
	 * that your update has been completed. If it can't be completed then 
	 * it won't tell you. Sounds like something needs to be added in the future. Hmmm.
	 * @param bhUser
	 */
	public static void update(Person User) {
		EntityManager em = DbUtil.getEmFactory().createEntityManager();
		EntityTransaction trans = em.getTransaction();
		try {
			trans.begin();
			em.merge(User);
			trans.commit();
		} catch (Exception e) {
			System.out.println(e);
			trans.rollback();
		} finally {
			em.close();
		}
	}


	public static void insert(Person p) {
		EntityManager em = DbUtil.getEmFactory().createEntityManager();
		EntityTransaction trans = em.getTransaction();
		//System.out.println("DbBullhorn: begin transaction");
		try {
			trans.begin();
			em.persist(p);
			//System.out.println("DbBullhorn: commit transaction");
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			//System.out.println("DbBullhorn: rollback transaction");
			trans.rollback();
		} finally {
			//System.out.println("DbBullhorn: close em");
			em.close();
		}
	}
}
