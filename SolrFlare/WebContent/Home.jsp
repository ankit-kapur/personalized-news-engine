<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<title>Preference selection</title>
<meta charset="UTF-8">

<link rel="stylesheet" href="css/homeboxes.css" type="text/css" />

<script src="js/jquery-1.11.1.js"></script>

<script type="text/javascript">
    $(document).ready(function(){
            var data = "science";
            $.post("/SolrFlare/GetHomeArticles", data, function(result) {
                $("#science_article").html(result);
            });
            
            var data = "lifestyle";
            $.post("/SolrFlare/GetHomeArticles", data, function(result) {
                $("#lifestyle_article").html(result);
            });
    });
    </script>
</head>

<body>


	<div id="fb-root"></div>

	<!-- UI Elements here -->
	<jsp:include page="Headerbar.html" />

	<br>
	<br>
	<section class="homestories">
		<div class="wrap">
			<h1>Recommended stories</h1>
			<table class="story_table" border="1">

				<!-- 1st Row -->
				<tr>
					<!-- Science & technology -->
					<td class="card">
						<table class="card_table">
							<tr>
								<td class="img_and_title"><img
									src="images/icons/science.png"
									style="width: 50px; height: 50px;" /><br> <span
									class="card_title">Science and technology</span></td>
								<td class="card_articles">
									<div class="articletext" id="science_article">It is a
										long established fact that a reader will be distracted by the
										readable content of a page when looking at its layout. The
										point of using Lorem Ipsum is that it has a more-or-less
										normal distribution of letters, as opposed to using 'Content
										here, content here', making it look like readable English. It
										is a long established fact that a reader will be distracted by
										the readable content of a page when looking at its layout. The
										point of using Lorem Ipsum is that it has a more-or-less
										normal distribution of letters, as opposed to using 'Content
										here, content here', making it look like readable English.</div>
								</td>
							</tr>
						</table>
					</td>

					<!-- Lifestyle -->
					<td class="card">
						<table class="card_table">
							<tr>
								<td class="img_and_title"><img
									src="images/icons/lifestyle.png"
									style="width: 50px; height: 50px;" /><br> <span
									class="card_title">Lifestyle</span></td>
								<td class="card_articles">
									<div class="articletext" id="lifestyle_article">It is a
										long established fact that a reader will be distracted by the
										readable content of a page when looking at its layout. The
										point of using Lorem Ipsum is that it has a more-or-less
										normal distribution of letters, as opposed to using 'Content
										here, content here', making it look like readable English. It
										is a long established fact that a reader will be distracted by
										the readable content of a page when looking at its layout. The
										point of using Lorem Ipsum is that it has a more-or-less
										normal distribution of letters, as opposed to using 'Content
										here, content here', making it look like readable English.</div>
								</td>
							</tr>
						</table>
					</td>
				</tr>

				<!-- 2nd Row -->
				<tr>
					<!-- Entertainment -->
					<td class="card">
						<table class="card_table">
							<tr>
								<td class="img_and_title"><img
									src="images/icons/entertainment.png"
									style="width: 50px; height: 50px;" /><br> <span
									class="card_title">Entertainment</span></td>
								<td class="card_articles">
									<div class="articletext" id="entertainment_article">It is
										a long established fact that a reader will be distracted by
										the readable content of a page when looking at its layout. The
										point of using Lorem Ipsum is that it has a more-or-less
										normal distribution of letters, as opposed to using 'Content
										here, content here', making it look like readable English. It
										is a long established fact that a reader will be distracted by
										the readable content of a page when looking at its layout. The
										point of using Lorem Ipsum is that it has a more-or-less
										normal distribution of letters, as opposed to using 'Content
										here, content here', making it look like readable English.</div>
								</td>
							</tr>
						</table>
					</td>

					<!-- Travel -->
					<td class="card">
						<table class="card_table">
							<tr>
								<td class="img_and_title"><img
									src="images/icons/travel.png"
									style="width: 50px; height: 50px;" /><br> <span
									class="card_title">Travel</span></td>
								<td class="card_articles">
									<div class="articletext" id="travel_article">It is a long
										established fact that a reader will be distracted by the
										readable content of a page when looking at its layout. The
										point of using Lorem Ipsum is that it has a more-or-less
										normal distribution of letters, as opposed to using 'Content
										here, content here', making it look like readable English. It
										is a long established fact that a reader will be distracted by
										the readable content of a page when looking at its layout. The
										point of using Lorem Ipsum is that it has a more-or-less
										normal distribution of letters, as opposed to using 'Content
										here, content here', making it look like readable English.</div>
								</td>
							</tr>
						</table>
					</td>
				</tr>

				<!-- 3rd Row -->
				<tr>
					<!-- Business -->
					<td class="card">
						<table class="card_table">
							<tr>
								<td class="img_and_title"><img
									src="images/icons/business.png"
									style="width: 50px; height: 50px;" /><br> <span
									class="card_title">Business</span></td>
								<td class="card_articles">
									<div class="articletext" id="business_article">It is a
										long established fact that a reader will be distracted by the
										readable content of a page when looking at its layout. The
										point of using Lorem Ipsum is that it has a more-or-less
										normal distribution of letters, as opposed to using 'Content
										here, content here', making it look like readable English. It
										is a long established fact that a reader will be distracted by
										the readable content of a page when looking at its layout. The
										point of using Lorem Ipsum is that it has a more-or-less
										normal distribution of letters, as opposed to using 'Content
										here, content here', making it look like readable English.</div>
								</td>
							</tr>
						</table>
					</td>

					<!-- Automobiles -->
					<td class="card">
						<table class="card_table">
							<tr>
								<td class="img_and_title"><img
									src="images/icons/automobiles.png"
									style="width: 50px; height: 50px;" /><br> <span
									class="card_title">Automobiles</span></td>
								<td class="card_articles">
									<div class="articletext" id="automobiles_article">It is a
										long established fact that a reader will be distracted by the
										readable content of a page when looking at its layout. The
										point of using Lorem Ipsum is that it has a more-or-less
										normal distribution of letters, as opposed to using 'Content
										here, content here', making it look like readable English. It
										is a long established fact that a reader will be distracted by
										the readable content of a page when looking at its layout. The
										point of using Lorem Ipsum is that it has a more-or-less
										normal distribution of letters, as opposed to using 'Content
										here, content here', making it look like readable English.</div>
								</td>
							</tr>
						</table>
					</td>
				</tr>

				<!-- 4th Row -->
				<tr>

					<!-- World news -->
					<td class="card">
						<table class="card_table">
							<tr>
								<td class="img_and_title"><img src="images/icons/world.png"
									style="width: 50px; height: 50px;" /><br> <span
									class="card_title">World news</span></td>
								<td class="card_articles">
									<div class="articletext" id="world_article">It is a long
										established fact that a reader will be distracted by the
										readable content of a page when looking at its layout. The
										point of using Lorem Ipsum is that it has a more-or-less
										normal distribution of letters, as opposed to using 'Content
										here, content here', making it look like readable English. It
										is a long established fact that a reader will be distracted by
										the readable content of a page when looking at its layout. The
										point of using Lorem Ipsum is that it has a more-or-less
										normal distribution of letters, as opposed to using 'Content
										here, content here', making it look like readable English.</div>
								</td>
							</tr>
						</table>
					</td>

					<!-- Misc -->
					<td class="card">
						<table class="card_table">
							<tr>
								<td class="img_and_title"><img src="images/icons/misc.png"
									style="width: 50px; height: 50px;" /><br> <span
									class="card_title">Miscellaneous</span></td>
								<td class="card_articles">
									<div class="articletext" id="misc_article">It is a long
										established fact that a reader will be distracted by the
										readable content of a page when looking at its layout. The
										point of using Lorem Ipsum is that it has a more-or-less
										normal distribution of letters, as opposed to using 'Content
										here, content here', making it look like readable English. It
										is a long established fact that a reader will be distracted by
										the readable content of a page when looking at its layout. The
										point of using Lorem Ipsum is that it has a more-or-less
										normal distribution of letters, as opposed to using 'Content
										here, content here', making it look like readable English.</div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
	</section>

	<div class="messagetext" id="message"></div>

	<input type="hidden" name="userInfo1" id="userInfo1"
		value="dummyvalue1" />
	<input type="hidden" name="userInfo2" id="userInfo2"
		value="dummyvalue2" />

	<br />
	<br />

	<!--Footer bar-->
	<jsp:include page="Footer.html" />

</body>
</html>