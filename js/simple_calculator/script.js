const firstValues = parseFloat(prompt('First values ?'));

const operator = prompt('Operator ?');

const secondValues = parseFloat(prompt('Second values ?'));

let result = null;

switch (operator) {
    case '+':
        result = firstValues + secondValues;
        console.log(firstValues + secondValues);
        break;
    case '-':
        result = firstValues - secondValues;
        console.log(firstValues - secondValues);
        break;
    case '/':
        result = firstValues / secondValues;
        console.log(firstValues / secondValues);
        break;
    case '*':
        result = firstValues * secondValues;
        console.log(firstValues * secondValues);
        break;
  default:
    console.warn(`Invalid operator`);
}

if (typeof(result) === 'number' && !isNaN(result)) {
    alert(`${firstValues} ${operator} ${secondValues} = ${result}`);
} else {
    alert("The operation could not be performed, please try again");
}
