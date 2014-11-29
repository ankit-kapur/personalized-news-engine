package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.log4j.Logger;

import DBUtils.servlets.User;

public class DBUtils {
	static Logger logger = Logger.getLogger(DBUtils.class);
	private Connection connection;

	public DBUtils(String dbURL, String user, String pwd) throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		this.connection = DriverManager.getConnection(dbURL, user, pwd);
	}

	public DBUtils(Connection con) throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		this.connection = con;
	}

	public Connection getConnection() {
		return this.connection;
	}

	public Boolean authenticateUser(String userId, String password) throws SQLException {
		boolean successFlag = false;
		if (userId == null || userId.equals("") || password == null || password.equals("") ) {
			successFlag = false;
		} else {
			Connection con = getConnection();
			PreparedStatement ps = null;
			ResultSet rs = null;
			try {
				ps = con.prepareStatement("select count(*) from user where idUser=? and password=?");
				ps.setString(1, userId.trim());
				ps.setString(2, password.trim());
				rs = ps.executeQuery();
				if (rs != null && rs.next()) {
					int count = rs.getInt(1);
					if (count > 0) {
						successFlag = true;
						logger.info("User found with details=" + userId);
					} else {
						successFlag = false;
						logger.info("User not found");
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
				logger.error("Database connection problem");
			} finally {
				try {
					if (rs != null)
						rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				try {
					if (ps != null)
						ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return successFlag;
	}	
	
	public boolean isUserExists(String userId) throws SQLException {
		boolean successFlag = false;
		if (userId == null || userId.equals("")) {
			successFlag = false;
		} else {
			Connection con = getConnection();
			PreparedStatement ps = null;
			ResultSet rs = null;
			try {
				ps = con.prepareStatement("select count(*) from user where idUser=?");
				ps.setString(1, userId);
				rs = ps.executeQuery();
				if (rs != null && rs.next()) {
					int count = rs.getInt(1);
					if (count > 0) {
						successFlag = true;
						logger.info("User found with details=" + userId);
					} else {
						successFlag = false;
						logger.info("User not found");
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
				logger.error("Database connection problem");
			} finally {
				try {
					if (rs != null)
						rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				try {
					if (ps != null)
						ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return successFlag;
	}

	public User PopulateUserData(String userId) throws DBUtilException {
		User user = new User();
		List<String> categoryList = user.getCategoryList();
		Map<String, String> prefCatMap = user.getCatPrefMap();
		if (userId == null || userId.equals("")) {
			throw new DBUtilException("Exception occured in DBUtils");
		} else {
			Connection con = getConnection();
			PreparedStatement ps = null, ps1 = null, ps2 = null;
			ResultSet rs = null, rs1 = null, rs2 = null;
			try {
				// For setting user related data.
				ps = con.prepareStatement("select idUser,nameUser,email,password,lastLogin,active from user where idUser=?");
				ps.setString(1, userId);
				rs = ps.executeQuery();
				if (rs != null && rs.next()) {
					user.setUserId(rs.getString(1));
					user.setUserName(rs.getString(2));
					user.setEmail(rs.getString(3));
					user.setPassword(rs.getString(4));
					user.setLastLogin(rs.getString(5));
					user.setActive(rs.getString(6));
				}
				// For setting List of categories for a particular user.
				ps1 = con.prepareStatement("select nameCategory from category where idUser=?");
				ps1.setString(1, userId);
				rs1 = ps1.executeQuery();
				while (rs1 != null && rs1.next()) {
					categoryList.add(rs1.getString(1));
				}
				user.setCategoryList(categoryList);
				// For setting preference-->category map in user object
				ps2 = con.prepareStatement("select p.preferenceName,c.nameCategory from category c,preference p where p.idUser=c.idUser and p.idCategory=c.idCategory and c.idUser=?");
				ps2.setString(1, userId);
				rs2 = ps2.executeQuery();
				while (rs2 != null && rs2.next()) {
					prefCatMap.put(rs2.getString(1), rs2.getString(2));
				}
				user.setCatPrefMap(prefCatMap);
			} catch (Exception e) {
				e.printStackTrace();
				logger.error("Database connection problem");
			} finally {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				try {
					rs1.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				try {
					ps1.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return user;
	}

	public Boolean InsertPreCatMapIntoDB(String userId, Map<String, String> prefCatMap) throws DBUtilException, SQLException {
		boolean successFlag = false;
		if (userId == null || userId.equals("")) {
			throw new DBUtilException("Exception occured in DBUtils");
		} else {
			Connection con = getConnection();
			PreparedStatement ps = null, ps1 = null, ps2 = null, ps3 = null, ps4 = null, ps5 = null, ps6 = null;
			ResultSet rs = null, rs2 = null, rs5 = null;
			String categoryIdValue = null;
			boolean preferencePresent = false;
			boolean categoryPresent = false;
			try {
				for (Entry<String, String> entry : prefCatMap.entrySet()) {
					String preference = entry.getKey();
					String category = entry.getValue();
					ps = con.prepareStatement("select preferenceName,preferenceFrequency from preference where idUser=? and preferenceName=?");
					ps.setString(1, userId);
					ps.setString(2, preference);
					rs = ps.executeQuery();
					// if prefernce is already in the table fetch the
					// frequency and update it
					if (rs != null && rs.next()) {
						preferencePresent = true;
						int prefFrequency = rs.getInt(2);
						prefFrequency++;
						ps1 = con.prepareStatement("update preference set preferenceFrequency=? where preferenceName=?");
						ps1.setInt(1, prefFrequency);
						ps1.setString(2, preference);
						int r = ps1.executeUpdate();
						if (r < 0) {
							throw new DBUtilException("Exception in Updating Preference Table");
						}
					}
					// if category is already in the table fetch the
					// frequency and update it
					ps2 = con.prepareStatement("select idCategory,frequency from category where idUser=? and nameCategory=?");
					ps2.setString(1, userId);
					ps2.setString(2, category);
					rs2 = ps2.executeQuery();
					if (rs2 != null && rs2.next()) {
						categoryPresent = true;
						categoryIdValue = rs2.getString(1);
						int CatFrequency = rs2.getInt(2);
						CatFrequency++;
						ps3 = con.prepareStatement("update category set frequency=? where nameCategory=?");
						ps3.setInt(1, CatFrequency);
						ps3.setString(2, category);
						int r = ps3.executeUpdate();
						if (r < 0) {
							throw new DBUtilException("Exception in Updating Category Table");
						}
					}
					// if category is not present in the table insert a new
					// record.
					if (!categoryPresent) {
						ps4 = con.prepareStatement("insert into category(nameCategory,frequency,idUser) values(?,?,?)");
						ps4.setString(1, category);
						ps4.setInt(2, 1);
						ps4.setString(3, userId);
						int r = ps4.executeUpdate();
						if (r < 0) {
							throw new DBUtilException("Exception in Inserting in Category Table");
						}
					}
					// if preference is not present in the table insert a
					// new record.
					if (!preferencePresent) {
						ps5 = con.prepareStatement("select idCategory from category where idUser=? and nameCategory=?");
						ps5.setString(1, userId);
						ps5.setString(2, category);
						rs5 = ps5.executeQuery();
						if (rs5 != null && rs5.next()) {
							categoryIdValue = rs5.getString(1);
						}
						ps6 = con.prepareStatement("insert into preference (idCategory,idUser,preferenceName,preferenceFrequency) values(?,?,?,?)");
						ps6.setString(1, categoryIdValue);
						ps6.setString(2, userId);
						ps6.setString(3, preference);
						ps6.setInt(4, 1);
						int r = ps6.executeUpdate();
						if (r < 0) {
							throw new DBUtilException("Exception in Inserting in Preference Table");
						}
					}

				}
				successFlag = true;
			} catch (DBUtilException e) {
				successFlag = false;
				e.printStackTrace();
				con.setAutoCommit(false);
				con.rollback();
			} finally {
				if (ps != null)
					ps.close();
				if (ps1 != null)
					ps1.close();
				if (ps2 != null)
					ps2.close();
				if (ps3 != null)
					ps3.close();
				if (ps4 != null)
					ps4.close();
				if (ps5 != null)
					ps5.close();
				if (ps6 != null)
					ps6.close();
				if (rs5 != null)
					rs5.close();
				if (rs != null)
					rs.close();
				if (rs2 != null)
					rs2.close();
			}
		}
		return successFlag;

	}
}
