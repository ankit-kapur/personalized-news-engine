<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<title>Preference selection</title>

<link
	href='http://fonts.googleapis.com/css?family=PT+Sans:regular,italic,bold,bolditalic&amp;subset=latin,latin-ext,cyrillic'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="css/selectpreferences.css" type="text/css" />
<link rel="stylesheet" href="css/noty-buttons.css" type="text/css" />

</head>

<body>

	<script src="js/jquery-1.7.2.min.js"></script>

	<script type="text/javascript"
		src="js/noty/packaged/jquery.noty.packaged.min.js"></script>

	<script type="text/javascript">
		var science_categIsSelected = false, lifestyle_categIsSelected = false, entertainment_categIsSelected = false, travel_categIsSelected = false, business_categIsSelected = false, automobiles_categIsSelected = false, worldnews_categIsSelected = false, misc_categIsSelected = false;
		var science_prefs = "", lifestyle_prefs = "", entertainment_prefs = "", travel_prefs = "", business_prefs = "", automobiles_prefs = "", worldnews_prefs = "", misc_prefs = "";
		var inputField = "";

		function add_to_prefs(element) {
			if (element.id == "prefbutton_science") {
				var inputField = "prefinput_science";
				if (science_prefs == "")
					science_prefs = document.getElementById(inputField).value;
				else
					science_prefs = science_prefs + ";"
							+ document.getElementById(inputField).value;
			} else if (element.id == "prefbutton_lifestyle") {
				var inputField = "prefinput_lifestyle";
				if (lifestyle_prefs == "")
					lifestyle_prefs = document.getElementById(inputField).value;
				else
					lifestyle_prefs = lifestyle_prefs + ";"
							+ document.getElementById(inputField).value;
			} else if (element.id == "prefbutton_entertainment") {
				var inputField = "prefinput_entertainment";
				if (entertainment_prefs == "")
					entertainment_prefs = document.getElementById(inputField).value;
				else
					_prefs = _prefs + ";"
							+ document.getElementById(inputField).value;
			} else if (element.id == "prefbutton_travel") {
				var inputField = "prefinput_travel";
				if (travel_prefs == "")
					travel_prefs = document.getElementById(inputField).value;
				else
					_prefs = _prefs + ";"
							+ document.getElementById(inputField).value;
			} else if (element.id == "prefbutton_business") {
				var inputField = "prefinput_business";
				if (business_prefs == "")
					business_prefs = document.getElementById(inputField).value;
				else
					business_prefs = business_prefs + ";"
							+ document.getElementById(inputField).value;
			} else if (element.id == "prefbutton_automobiles") {
				var inputField = "prefinput_automobiles";
				if (automobiles_prefs == "")
					automobiles_prefs = document.getElementById(inputField).value;
				else
					automobiles_prefs = automobiles_prefs + ";"
							+ document.getElementById(inputField).value;
			} else if (element.id == "prefbutton_worldnews") {
				var inputField = "prefinput_worldnews";
				if (worldnews_prefs == "")
					worldnews_prefs = document.getElementById(inputField).value;
				else
					worldnews_prefs = worldnews_prefs + ";"
							+ document.getElementById(inputField).value;
			} else if (element.id == "prefbutton_misc") {
				var inputField = "prefinput_misc";
				if (misc_prefs == "")
					misc_prefs = document.getElementById(inputField).value;
				else
					misc_prefs = misc_prefs + ";"
							+ document.getElementById(inputField).value;
			}

			var prefValue = document.getElementById(inputField).value;
			document.getElementById(inputField).value = "";
			document.getElementById(inputField).placeholder = "Enter preference";

			/* Generate notification */
			var information = generate("Preference added: '" + prefValue + "'");

			setTimeout(function() {
				$.noty.closeAll();
			}, 2000);
		}

		function toggle(element, doToggle) {

			var isCardActive = false;
			var addPrefId = "";

			if (element.id == "card_science") {
				if (doToggle)
					science_categIsSelected = !(science_categIsSelected);
				isCardActive = science_categIsSelected;
				addPrefId = "pref_science";
			} else if (element.id == "card_lifestyle") {
				if (doToggle)
					lifestyle_categIsSelected = !(lifestyle_categIsSelected);
				isCardActive = lifestyle_categIsSelected;
				addPrefId = "pref_lifestyle";
			} else if (element.id == "card_entertainment") {
				if (doToggle)
					entertainment_categIsSelected = !(entertainment_categIsSelected);
				isCardActive = entertainment_categIsSelected;
				addPrefId = "pref_entertainment";
			} else if (element.id == "card_travel") {
				if (doToggle)
					travel_categIsSelected = !(travel_categIsSelected);
				isCardActive = travel_categIsSelected;
				addPrefId = "pref_travel";
			} else if (element.id == "card_business") {
				if (doToggle)
					business_categIsSelected = !(business_categIsSelected);
				isCardActive = business_categIsSelected;
				addPrefId = "pref_business";
			} else if (element.id == "card_automobiles") {
				if (doToggle)
					automobiles_categIsSelected = !(automobiles_categIsSelected);
				isCardActive = automobiles_categIsSelected;
				addPrefId = "pref_automobiles";
			} else if (element.id == "card_worldnews") {
				if (doToggle)
					worldnews_categIsSelected = !(worldnews_categIsSelected);
				isCardActive = worldnews_categIsSelected;
				addPrefId = "pref_worldnews";
			} else if (element.id == "card_misc") {
				if (doToggle)
					misc_categIsSelected = !(misc_categIsSelected);
				isCardActive = misc_categIsSelected;
				addPrefId = "pref_misc";
			}

			cardToggle(isCardActive, element);
			if (isCardActive) {
				document.getElementById(addPrefId).style.visibility = "visible";
			} else {
				document.getElementById(addPrefId).style.visibility = "hidden";
			}
		}

		function cardToggle(isActive, element) {
			if (isActive) {
				element.style.backgroundColor = "#7254fc";
				element.style.color = "#fff";
				element.style.textShadow = "-1px 1px 8px #000, 1px -1px 8px #000";
				element.style.boxShadow = "none";
			} else {
				element.style.backgroundColor = "#ffffff";
				element.style.color = "#333";
				element.style.textShadow = "none";
				element.style.boxShadow = "3px 3px 3px 3px rgba(0, 0, 0, .2)";
			}
		}

		function hoverCard(element) {
			element.style.backgroundColor = '#b0b3fd';
			element.style.color = '#fff';
			element.style.textShadow = '-1px 1px 8px #000, 1px -1px 8px #000';
		}

		function generate(notification_text) {
			var n = noty({
				text : notification_text,
				type : 'information',
				dismissQueue : false,
				layout : 'bottomLeft',
				theme : 'defaultTheme'
			});
			return n;
		}
		
	</script>

	<div id="fb-root"></div>

	<!-- UI Elements here -->
	<jsp:include page="Headerbar.html" />

	<br>
	<br>
	<table>
		<tr>
			<td>
				<div class="card" onclick="toggle(this, true);"
					onmouseover="hoverCard(this);" onmouseleave="toggle(this, false);"
					id="card_science">Science and Technology</div>
				<div class="pref" id="pref_science">
					<input type="text" class="preference_input" id="prefinput_science"
						placeholder="Enter preference" onsubmit="alert('HI');" />
					<button class="preference_button" id="prefbutton_science"
						onclick="add_to_prefs(this);">+</button>
				</div>
			</td>

			<td>
				<div class="card" onclick="toggle(this, true);"
					onmouseover="hoverCard(this);" onmouseleave="toggle(this, false);"
					id="card_lifestyle">Lifestyle</div>
				<div class="pref" id="pref_lifestyle">
					<input type="text" class="preference_input"
						id="prefinput_lifestyle" placeholder="Enter preference" />
					<button class="preference_button" id="prefbutton_lifestyle"
						onclick="add_to_prefs(this);">+</button>
				</div>
			</td>

			<td>
				<div class="card" onclick="toggle(this, true);"
					onmouseover="hoverCard(this);" onmouseleave="toggle(this, false);"
					id="card_entertainment">Entertainment</div>
				<div class="pref" id="pref_entertainment">
					<input type="text" class="preference_input"
						id="prefinput_entertainment" placeholder="Enter preference" />
					<button class="preference_button" id="prefbutton_entertainment"
						onclick="add_to_prefs(this);">+</button>
				</div>
			</td>

			<td>
				<div class="card" onclick="toggle(this, true);"
					onmouseover="hoverCard(this);" onmouseleave="toggle(this, false);"
					id="card_travel">Travel</div>
				<div class="pref" id="pref_travel">
					<input type="text" class="preference_input" id="prefinput_travel"
						placeholder="Enter preference" />
					<button class="preference_button" id="prefbutton_travel"
						onclick="add_to_prefs(this);">+</button>
				</div>
			</td>
		</tr>

		<tr>
			<td>
				<div class="card" onclick="toggle(this, true);"
					onmouseover="hoverCard(this);" onmouseleave="toggle(this, false);"
					id="card_business">Business</div>
				<div class="pref" id="pref_business">
					<input type="text" class="preference_input" id="prefinput_business"
						placeholder="Enter preference" />
					<button class="preference_button" id="prefbutton_business"
						onclick="add_to_prefs(this);">+</button>
				</div>
			</td>

			<td>
				<div class="card" onclick="toggle(this, true);"
					onmouseover="hoverCard(this);" onmouseleave="toggle(this, false);"
					id="card_automobiles">Automobiles</div>
				<div class="pref" id="pref_automobiles">
					<input type="text" class="preference_input"
						id="prefinput_automobiles" placeholder="Enter preference" />
					<button class="preference_button" id="prefbutton_automobiles"
						onclick="add_to_prefs(this);">+</button>
				</div>
			</td>

			<td>
				<div class="card" onclick="toggle(this, true);"
					onmouseover="hoverCard(this);" onmouseleave="toggle(this, false);"
					id="card_worldnews">World news</div>
				<div class="pref" id="pref_worldnews">
					<input type="text" class="preference_input"
						id="prefinput_worldnews" placeholder="Enter preference" />
					<button class="preference_button" id="prefbutton_worldnews"
						onclick="add_to_prefs(this);">+</button>
				</div>
			</td>

			<td>
				<div class="card" onclick="toggle(this, true);"
					onmouseover="hoverCard(this);" onmouseleave="toggle(this, false);"
					id="card_misc">Miscellaneous</div>
				<div class="pref" id="pref_misc">
					<input type="text" class="preference_input" id="prefinput_misc"
						placeholder="Enter preference" />
					<button class="preference_button" id="prefbutton_misc"
						onclick="add_to_prefs(this);">+</button>
				</div>
			</td>
		</tr>
	</table>

	<br>
	<div id="submitlink">
		<a href="Home.jsp">Submit preferences</a>
	</div>

	<!--Footer bar-->
	<jsp:include page="Footer.html" />

</body>
</html>