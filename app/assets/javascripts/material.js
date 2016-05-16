$('.collapsible').collapsible({
  accordion : false 
});

$('.dropdown-button').dropdown({
  inDuration: 300,
  outDuration: 225,
  constrain_width: true, // Does not change width of dropdown to that of the activator
  hover: true, // Activate on hover
  gutter: 0, // Spacing from edge
  belowOrigin: false, // Displays dropdown below the button
  alignment: 'left' // Displays dropdown with edge aligned to the left of button
});

$('.button-collapse').sideNav({
  menuWidth: 200,
  edge: 'left', // Choose the horizontal origin
});