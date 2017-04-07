console.log('working')

$('.register').click(function(){
	var usernameVal = $('#username').val();
	var passVal = $('#password').val();
	$('#username').val('');
	$('#password').val('');
$.ajax({
	url: '/welcome/register',
	type: 'POST',
	data: {username: usernameVal, password: passVal},
	success: function(response){
		if (response.result) {
			window.location.href = '/question'
		}
		else {
			$('#no').append("<h4 id='exists'>username is taken</h4>")
			$('#exists').fadeOut(4000, function(){
				$(this).remove()
			})
		} 	
},
	err: function(err){
		console.log(err)
	}
})
})

$('.login').click(function(){
	var usernameVal = $('#username').val();
	var passVal = $('#password').val();
	$('#password').val('');
$.ajax({
	cache: false,
	beforeSend: function(xhr) {
   		xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
 	},
	url: '/welcome/login',
	type: 'POST',
	data: {username: usernameVal, password: passVal},
	success: function(response){
		if (response.result) {
			window.location.href = '/question'
		}
		else {
			$('#no').append("<h4 id='wrong'> incorrect username or password </h4>")
			$('#wrong').fadeOut(4000, function(){
				$(this).remove()
			})
		} 
},
	err: function(err){
		console.log(err)
	}
})
})

$('.good').click(function(e){
	var id = $(this).data("id")
	$(this).prop('disabled', true)
$.ajax({
	url: '/community/good/' + id,
	type: 'POST',
	success: function(response){
		console.log(response.good)
	$(e.target).closest('div').find('.goodNum').text(response.good)
},
  err: function(err){
  	console.log(err)
  }
})
})


$('.bad').click(function(e){
	var id = $(this).data("id")
	$(this).prop('disabled', true)
$.ajax({
	url: '/community/bad/' + id,
	type: 'POST',
	success: function(response){
		console.log(response.bad)
	$(e.target).closest('div').find('.badNum').text(response.bad)
},
  err: function(err){
  	console.log(err)
  }
})
})

$('.creepy').click(function(e){
	var id = $(this).data("id")
	$(this).prop('disabled', true)
$.ajax({
	url: '/community/creepy/' + id,
	type: 'POST',
	success: function(response){
		console.log(response.creepy)
	$(e.target).closest('div').find('.creepyNum').text(response.creepy)
},
  err: function(err){
  	console.log(err)
  }
})
})













