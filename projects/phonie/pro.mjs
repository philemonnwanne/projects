
// Creating a list of available telecommunication providers
let telecomCarriers = ['mtn', 'airtel', 'glo', 'etisalat'];

// Initialiting page as black
document.body.style.background = 'black';

// Asking a user to select a provider for validation
let userPrompt = prompt(`Choose a telecomms provider to validate from: ${telecomCarriers}`)

// all available telecommunication providers
if (userPrompt === 'mtn' || userPrompt === 'MTN') {
  document.getElementsByName('phone')[0].placeholder = 'MTN numbers only';
  // document.getElementById('mtn-pro-btn').classList.remove('hidden');
  document.body.style.backgroundColor = 'yellow'

  // Mtn Pattern Validation
  function validateMtn(event) {

    let mtnPattern = document.getElementById('input').pattern;

    mtnPattern = "^070([36]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^[\+]?[(]?[234]{3}[)]?[-. ]?70([36]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^080([36]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^[\+]?[(]?[234]{3}[)]?[-. ]?80([36]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^081([0346]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^[\+]?[(]?[234]{3}[)]?[-. ]?81([0346]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^090([36]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^[\+]?[(]?[234]{3}[)]?[-. ]?90([36]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^091([36]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^[\+]?[(]?[234]{3}[)]?[-. ]?91([36]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$";

    let mtnInput = document.getElementById('input').value;

    // Checking for a match
    if (mtnInput.match(mtnPattern)) {
      document.getElementById('teleicon').classList.add('mtn');
      console.log(`Your Mtn number is: ${mtnInput}`)
    }
    else {
      console.log(`This a not a valid Mtn number`);
    }
    event.preventDefault();
  }

  document.getElementById('input').addEventListener('mouseleave', validateMtn);
}
else if (userPrompt === 'airtel' || userPrompt === 'AIRTEL') {
  document.getElementsByName('phone')[0].placeholder = 'AIRTEL numbers only';
  // document.getElementById('airtel-pro-btn').classList.remove('hidden');
  document.body.style.backgroundColor = 'red'

  // Airtel Pattern Validation
  function validateAirtel(event) {

    let airtelPattern = document.getElementById('input').pattern;

    airtelPattern = "^070([18]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^[\+]?[(]?[234]{3}[)]?[-. ]?70([18]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^080([28]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^[\+]?[(]?[234]{3}[)]?[-. ]?80([28]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^081([2]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^[\+]?[(]?[234]{3}[)]?[-. ]?81([2]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^090([1247]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^[\+]?[(]?[234]{3}[)]?[-. ]?90([1247]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^091([2]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^[\+]?[(]?[234]{3}[)]?[-. ]?91([2]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$";

    let airtelInput = document.getElementById('input').value;

    // Checking for a match
    if (airtelInput.match(airtelPattern)) {
      document.getElementById('teleicon').classList.add('airtel');
      console.log(`Your Airtel number is: ${airtelInput}`)
    }
    else {
      console.log(`This a not a valid Airtel number`);
    }
    event.preventDefault();
  }

  document.getElementById('input').addEventListener('mouseleave', validateAirtel);
}
else if (userPrompt === 'glo' || userPrompt === 'GLO') {
  document.getElementsByName('phone')[0].placeholder = 'GLO numbers only';
  // document.getElementById('glo-pro-btn').classList.remove('hidden');
  document.body.style.backgroundColor = 'green'

  // Glo Pattern Validation
  function validateGlo(event) {

    let gloPattern = document.getElementById('input').pattern;

    gloPattern = "^070([5]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^[\+]?[(]?[234]{3}[)]?[-. ]?70([5]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^080([57]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^[\+]?[(]?[234]{3}[)]?[-. ]?80([57]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^081([15]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^[\+]?[(]?[234]{3}[)]?[-. ]?81([15]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^090([5]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^[\+]?[(]?[234]{3}[)]?[-. ]?90([5]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^091([5]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^[\+]?[(]?[234]{3}[)]?[-. ]?91([5]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$";

    let gloInput = document.getElementById('input').value;

    // Checking for a match
    if (gloInput.match(gloPattern)) {
      document.getElementById('teleicon').classList.add('glo');
      console.log(`Your Glo number is: ${gloInput}`)
    }
    else {
      console.log(`This a not a valid Glo number`);
    }
    event.preventDefault();
  }

  document.getElementById('input').addEventListener('mouseleave', validateGlo);
}
else if (userPrompt === 'etisalat' || userPrompt === 'ETISALAT') {
  document.getElementsByName('phone')[0].placeholder = 'ETISALAT numbers only';
  // document.getElementById('etisalat-pro-btn').classList.remove('hidden');
  document.body.style.backgroundColor = '#CCDB3B'
  document.getElementById('formgroup').style.background = '#373435'

  // Etisalat Pattern Validation
  function validateEtisalat(event) {

    let etisalatPattern = document.getElementById('input').pattern;

    etisalatPattern = "^080([9]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^[\+]?[(]?[234]{3}[)]?[-. ]?80([9]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^081([78]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^[\+]?[(]?[234]{3}[)]?[-. ]?81([78]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^090([89]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^[\+]?[(]?[234]{3}[)]?[-. ]?90([89]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$";

    let etisalatInput = document.getElementById('input').value;

    // Checking for a match
    if (etisalatInput.match(etisalatPattern)) {
      document.getElementById('teleicon').classList.add('etisalat');
      console.log(`Your Etisalat number is: ${etisalatInput}`)
    }
    else {
      console.log(`This a not a valid Etisalat number`);
    }
    event.preventDefault();
  }

  document.getElementById('input').addEventListener('mouseleave', validateEtisalat);

}
else {
  // document.getElementById('container').classList.add('hidden');
  document.body.style.backgroundColor = 'black';
  document.body.style.color = 'white';
  document.getElementsByTagName('h2').innerText = 'See you around!!!';
}

function proApp() {

  /* I have tried testing these regular expressions but for some reason they don't seem yet*/
  
  // let mtnNg = /mtn/i
  // const airtelNg = /airtel/i;
  // const gloNg = /glo/i;
  // const etisalatNg = /(etisalat)^9(mobile)/i;



  // Display custom javascript messages in input field
  let phone_input = document.getElementById("input");

  // phone_input.mouseout = function () {
  //   if (phone_input.value === '') {
  //     phone_input.setCustomValidity('Enter phone number');
  //   }
  // }

  phone_input.addEventListener('mouseleave', () => {
    phone_input.setCustomValidity('');
    // phone_input.checkValidity();
  });

  phone_input.addEventListener('invalid', () => {
    if (phone_input.value === '') {
      phone_input.setCustomValidity('Enter phone number!');
    } else {
      phone_input.setCustomValidity('Enter phone number in this format: 0703/0706-***-****');
    }
  });


  // Changing h2
  const header = document.querySelector('h2');
  if (header) {
    header.textContent = 'Made with ❤️ by phil!!';
  }
};

// ======= DO NOT EDIT ============== //
export default proApp;
  // ======= EEND DO NOT EDIT ========= //
