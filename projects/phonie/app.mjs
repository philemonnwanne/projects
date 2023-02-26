// RegEx pattern for MTN phone numbers;
const mtn1 = /^070([36]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^[\+]?[(]?[234]{3}[)]?[-. ]?70([36]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/
const mtn2 = /^080([36]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^[\+]?[(]?[234]{3}[)]?[-. ]?80([36]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/
const mtn3 = /^081([0346]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^[\+]?[(]?[234]{3}[)]?[-. ]?81([0346]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/
const mtn4 = /^090([36]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^[\+]?[(]?[234]{3}[)]?[-. ]?90([36]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/
const mtn5 = /^091([36]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^[\+]?[(]?[234]{3}[)]?[-. ]?91([36]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/

// RegEx pattern for AIRTEL phone numbers;
const airtel1 = /^070([18]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^[\+]?[(]?[234]{3}[)]?[-. ]?70([18]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/
const airtel2 = /^080([28]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^[\+]?[(]?[234]{3}[)]?[-. ]?80([28]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/
const airtel3 = /^081([2]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^[\+]?[(]?[234]{3}[)]?[-. ]?81([2]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/
const airtel4 = /^090([1247]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^[\+]?[(]?[234]{3}[)]?[-. ]?90([1247]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/
const airtel5 = /^091([2]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^[\+]?[(]?[234]{3}[)]?[-. ]?91([2]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/

// RegEx pattern for GLO phone numbers;
const glo1 = /^070([5]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^[\+]?[(]?[234]{3}[)]?[-. ]?70([5]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/
const glo2 = /^080([57]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^[\+]?[(]?[234]{3}[)]?[-. ]?80([57]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/
const glo3 = /^081([15]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^[\+]?[(]?[234]{3}[)]?[-. ]?81([15]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/
const glo4 = /^090([5]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^[\+]?[(]?[234]{3}[)]?[-. ]?90([5]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/
const glo5 = /^091([5]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^[\+]?[(]?[234]{3}[)]?[-. ]?91([5]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/

// RegEx pattern for ETISALAT phone numbers;
const etisalat1 = /^080([9]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^[\+]?[(]?[234]{3}[)]?[-. ]?80([9]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/
const etisalat2 = /^081([78]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^[\+]?[(]?[234]{3}[)]?[-. ]?81([78]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/
const etisalat3 = /^090([89]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$|^[\+]?[(]?[234]{3}[)]?[-. ]?90([89]{1})[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/

function startApp() {
  // Your entire app should not necessarily be coded inside this 
  // single function (though there's no penalty for that), 
  // so create and use/call additional functions from here

  // pls remove the below and make some magic in here!

  // Function to check if phone number is valid
  function validatePhoneNumber(event) {

    let num = document.getElementById('input').value;

    if (mtn1.test(num) || mtn2.test(num) || mtn3.test(num) || mtn4.test(num) || mtn5.test(num)) {
      document.getElementById('icon').classList.add('mtn');
      // alert(`${num} is an mtn number`)
    }
    else if (airtel1.test(num) || airtel2.test(num) || airtel3.test(num) || airtel4.test(num) || airtel5.test(num)) {
      document.getElementById('icon').classList.add('airtel');
      // alert(`${num} is an airtel number`)
    }
    else if (glo1.test(num) || glo2.test(num) || glo3.test(num) || glo4.test(num) || glo5.test(num)) {
      document.getElementById('icon').classList.add('glo');
      // alert(`${num} is an glo number`)
    }
    else if (etisalat1.test(num) || etisalat2.test(num) || etisalat3.test(num)) {
      document.getElementById('icon').classList.add('etisalat');
      // alert(`${num} is an etisalat number`)
    }
    else {
      let showErrMsg = document.getElementById('error').classList.remove('hidden');

    }
    event.preventDefault();
  }

  document.getElementById('input').addEventListener('change', validatePhoneNumber);



  // Method to enable autocomplete functionality
  function autoComplete() {
    let inputField = document.getElementById('input').value;
    let listField = document.getElementById('listt').value;
    inputField.addEventListener('input', valid);
    listField.addEventListener('click', validate);
  }





  const header = document.querySelector('h2');
  if (header) {
    header.textContent = 'Made with ❤️ by phil!!';
  }
};

// ======= DO NOT EDIT ============== //
export default startApp;
  // ======= EEND DO NOT EDIT ========= //
