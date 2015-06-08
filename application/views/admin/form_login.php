<div class= "container">
	<form class="form-login" method="POST" action="<?php echo site_url("control_autentikasi/login");?>" role="form">
		<input type="hidden" name="location" value="<?php if(isset($location)) echo htmlspecialchars($location); ?>">
		<label for="username">Username</label>
		<input type="text" name="username" value="<?php echo set_value('username')?>" class="form-control" placeholder="Username" required autofocus />
		<label for="password">Password</label>
		<input type="password" name="password" class="form-control" placeholder="Password" required /><br>
		<button class="btn btn-lg btn-primary btn-block" type="submit">Login</button><br>
		<?php
		if (!empty(validation_errors()) || !empty($errors)) {
			echo "<div class= \"alert alert-danger\"><ol type='1'>";
				if(!empty(validation_errors()) ) echo validation_errors("<li>", "</li>");
				if(!empty($errors)) echo "<li>".$errors."<li>";
			echo "</ol></div>";
		}
		?>
	</form>
</div>