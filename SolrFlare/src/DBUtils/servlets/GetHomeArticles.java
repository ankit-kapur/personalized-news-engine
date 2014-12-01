package DBUtils.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import util.ClusterUtils;
import util.DBUtils;

@WebServlet("/GetHomeArticles")
public class GetHomeArticles extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Logger logger = Logger.getLogger(GetHomeArticles.class);

	public GetHomeArticles() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		User userMetadata = (User) request.getSession().getAttribute("user");
		Connection con = (Connection) getServletContext().getAttribute("DBConnection");
		DBUtils dbUtils = null;
		try {
			dbUtils = new DBUtils(con);

			String userId = null;
			if (userMetadata != null)
				userId = userMetadata.getUserId();
			userId = "3002";

			/* Get list of similar users */
			List<String> similarUsers = ClusterUtils.getOtherUsersInMyCluster(userId);
			System.out.println(similarUsers);

			/*
			 * Get doc IDs for these users, of articles not read by current
			 * user
			 */
			List<String> docIds = dbUtils.getDocIdsFromSimilarUsers(userId, similarUsers);

			PrintWriter out = response.getWriter();
			out.write(docIds.toString());
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}