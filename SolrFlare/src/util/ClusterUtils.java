package util;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import weka.clusterers.SimpleKMeans;
import weka.core.DistanceFunction;
import weka.core.Instances;
import weka.core.ManhattanDistance;
import weka.filters.Filter;
import weka.filters.unsupervised.attribute.Remove;

public class ClusterUtils {

	/* Clustering parameters */
	static int numberOfClusters = 3;
	static int seedsForClustering = 5;
	static DistanceFunction distanceFunction = new ManhattanDistance();
	
	static String arffFileName = "clusterdata/user_data.arff";
	static Map<Integer, Integer> clusteredData = new HashMap<Integer, Integer>();
	static Instances userData;

	public static void makeClusters() {

		BufferedReader reader = null;
		Instances dataWithoutLastAttribute = null;

		try {
			reader = new BufferedReader(new FileReader(arffFileName));
			userData = new Instances(reader);
			System.out.println("Loaded arff file.");

			/* Ignore/remove the last attribute */
			String[] removeOptions = new String[2];
			removeOptions[0] = "-R"; // "range"
			removeOptions[1] = "9"; // 9th attribute
			Remove remove = new Remove(); // new instance of filter
			remove.setOptions(removeOptions); // set options
			remove.setInputFormat(userData); // inform filter about dataset
			dataWithoutLastAttribute = Filter.useFilter(userData, remove); // apply
																// filter

			/* Use k-means */
			SimpleKMeans clusterer = new SimpleKMeans();

			clusterer.setDistanceFunction(distanceFunction);
			clusterer.setSeed(seedsForClustering);
			clusterer.setPreserveInstancesOrder(true);
			clusterer.setNumClusters(numberOfClusters);
			clusterer.buildClusterer(dataWithoutLastAttribute);

			/*- This array returns the cluster number (starting with 0) for each
			 *  instance. The array has as many elements as the number of instances */
			int[] assignments = clusterer.getAssignments();

			for (int instanceNum = 0; instanceNum < assignments.length; instanceNum++) {
				int clusterNum = assignments[instanceNum];
				clusteredData.put(instanceNum, clusterNum);
			}

		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (reader != null) {
				try {
					reader.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	public static List<String> getOtherUsersInMyCluster(String userId) {
		List<String> userIds = new ArrayList<String>();
		int clusterNum = -1;

		/* Get instance no. corresponding to user ID */
		for (int i = 0; i < userData.numInstances(); i++) {
			String currentUserId = userData.instance(i).stringValue(8);
			if (currentUserId != null && currentUserId.equals(userId)) {
				clusterNum = clusteredData.get(i);
				break;
			}
		}

		/* Get all users in this cluster */
		for (int currentInstanceNum : clusteredData.keySet()) {
			if (clusterNum == clusteredData.get(currentInstanceNum)) {
				String currentUserId = userData.instance(currentInstanceNum).stringValue(8);
				if (!currentUserId.equals(userId))
					userIds.add(currentUserId);
			}
		}

		return userIds;
	}
}