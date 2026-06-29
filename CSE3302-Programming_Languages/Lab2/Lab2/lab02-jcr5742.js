/*
    Name: Jeremiah Richard
    1000 #: 1001475742
    Due: 7/11/2022
 */

var inputtable = [1,2,3,4,5,6,7,8,9,10];

// This function generate a function that will multiple
// a given number by the value argument
function multiple(value)
{
    return function multNum(number)
    {
        return number*value;
    }
}

var mult5 = multiple(5);
var mult13 = multiple(13);
// This function will simply time a given value by itself
var squared = value => {
    return value * value;
}
var mult10 = multiple(10)

// Map is used to output a new array changing up the array from the mult function
var fiveTable = inputtable.map(mult5)
var thirteenTable = inputtable.map(mult13)
var squaresTable = inputtable.map(squared)

var mult10 = multiple(10);
var tenTable = inputtable.map(mult10);

/*
    This function will print until the end of the multiples of 5
    It does this by evaluating the start and end passing by value
    having the acc and start be counters for the rest of the function
 */
function printTilOddMultEnd(end, acc, multiple)
{
    if(acc+multiple > end)
        return;
    if((acc+multiple)%2 > 0)
    {
        console.log("Multiples of " + multiple + " that's odd: " + (acc + multiple));
    }
    return printTilOddMultEnd(end, (acc+multiple), multiple);
}

printTilOddMultEnd(100, 0, 5);

function sumTilMultEnd(counter, end, acc, multiple)
{
    // The start will go for as long as the multiple accumulate to the end
    // There are two separate counters with two constants which is:
    // end & multiple. The counter will change by multiples; the accumulation
    // will change based on the current multiple or (counter+multiple)
    if((counter+multiple) > end)
        return console.log("Sum of multiples of "+multiple+" to "+end+": "+acc);
    if((counter+multiple)%2 == 0)
        return sumTilMultEnd(counter+multiple, end, acc+(counter+multiple),multiple);
    else
        return sumTilMultEnd(counter+multiple, end, acc, multiple);
}

sumTilMultEnd(0, 100, 0, 7);

// This function will take the given radius into
// a function, so it can be reused in currying
var cylinder_volume = r => h => 3.14*r*r*h;

volumeWithFive = cylinder_volume(5);
console.log("Volume of Cylinder with radius 5, h = 10: "+volumeWithFive(10));
console.log("Volume of Cylinder with radius 5, h = 17: "+volumeWithFive(17));
console.log("Volume of Cylinder with radius 5, h = 11: "+volumeWithFive(11));

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ HTML PART ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

makeTag = function(beginTag, endTag){
    return function(textcontent){
        return beginTag +textcontent +endTag;
    }
}

//

tableTag = makeTag("<table>\n","</table>\n");
tableRow = makeTag("<tr>\n","</tr>\n");
tableTitle = makeTag("<th>","</th>\n");
tableCells = makeTag("<td>","</td>\n");

// Now time for the output!
// For this output, I input multiple functions into one another of the tags stringing them along

console.log(tableTag(tableRow(tableTitle("Company")
    +tableTitle("Country")+tableTitle("income"))
    +tableRow(tableCells("Winter Labs LLC")+tableCells("Double Stop Inc."))
    +tableRow(tableCells("Swizterland")+tableCells("U.S."))
    +tableRow(tableCells("$753,000")+tableCells("$1,002,342"))));

