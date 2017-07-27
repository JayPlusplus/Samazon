package customTools;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

public class DBorder {
	public static void insert(Order ord) {
		EntityManager em = DbUtil.getEmFactory().createEntityManager();
		EntityTransaction trans = em.getTransaction();
		try {
			trans.begin();
			em.persist(ord);
			trans.commit();
		} catch (Exception e) {
			trans.rollback();
		} finally {
			em.close();

		}
}
}