function sayHelloNTimes(name ,n) {
    function greet() {
        console.log( `Hi, ${name}!`);
    };
    for (let i = 0; i < n; i++) {
        greet();
    };
};

// sayHelloNTimes("loser", 4);

function isPalindrome(string) {
    function reverse() {
        return string.split('').reverse().join('');
    }

    console.log(string === reverse());
};

// console.log(isPalindrome('racecar'));
// isPalindrome('racecar');
// isPalindrome('hungry');
// console.log('nonpally'.split('').reverse());
// console.log('racecar'.reverse);

function buildList(list) {
    var result = [];
    for (var i = 0; i < list.length; i++) {
        var item = 'item' + i;
        result.push(function () { console.log(item + ' ' + list[i]) });
    }
    return result;
};

function testList() {
    var fnlist = buildList([1, 2, 3]);
    // Using j only to help prevent confusion -- could use i.
    for (var j = 0; j < fnlist.length; j++) {
        fnlist[j]();
    }
};

// testList();

function Kitten(name, age) {
    this.name = name;
    this.age = age;

    this.meow = function () {
        console.log(this.name + ' says "meow!"');
    };
}

let kitten = new Kitten("Earl", 2);

// console.log(kitten.meow());

function foo(arg) {
    debugger;
    return arg;
};

// foo(5);
// console.log(foo(5));

const thing = function (names) {
    names.forEach(name => console.log(name));
};

thing(['hello', 'to', 'you']);