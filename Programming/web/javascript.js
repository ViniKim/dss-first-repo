// java는 ECMA라고 함. 나오기는 ECMA7까지 나왔음. ECMA6부터는 클래스가 생김.

// 주석
// 한줄주석: // code
// 여러줄 주석: /* code */

console.log("data");

// 식별자
// 상수: SNAKE_CASE (대문자 스네이크 케이스) -- 보편적인 케이스. 이렇게 사용하지 않는 곳도 있음. 회사 정책에 따라서...
// 변수명: camelCase (카멜 케이스)
// 모듈: PascalCase (파스칼 케이스)
// 파이썬의 식별자 특수기호 : _
// 자바스크립트는 : $, _
// _name : private variable, function쓸 때 _로 네이밍
// $target: selector를 변수로 사용할 때

var $target = 1; // jquery: javascript framework
console.log($target);


var name = "doojin"; // 이건 변수야 = var. 여기서의 변수는 string
console.log(name);

var a = 1.1; // 여기서의 변수는 number(not integer)
var b = 2;
console.log(a + b, typeof a);

// 연산자
// +, -, *, /, %, ++, --
var number = 5;
var result = number;
console.log(result);

var number = 5;
var result = ++number; // ++는 1 증가시킴. --는 1 감소시킴. 앞에 쓰면 number=6, result=6
console.log(number, result);

var number = 5;
var result = number++; // ++는 1 증가시킴. --는 1 감소시킴. 뒤에 쓰면 number=6, result=5. 값을 대입한 후에 1을 증가해서 그런 거.
console.log(number, result);

// 데이터 타입
var a = 1; //Number
var b = 1.9; //Number
var c = "data"; //String
var d = [1,2,3]; //Object
var e = {a:1, b:2} //Object
var f = true; //boolean
console.log(typeof a,typeof b,typeof c,typeof d,typeof e,typeof f)

// null, undefined, NaN
// null: 값이 없음을 지정 - 언제 사용? garbage collector - 필요하지 않으면 삭제해서 메모리 줄여주는. 줄여서 'GC'라고 많이 함.
// 식별자를 없애줄 때! 자바는 class가 없어서 function 만들 때 object를 씀.
// undefined: 값이 지정되지 않음
// NaN: 존재하지 않는 데이터의 형태

var a = null;
console.log(a);

var b;
console.log(b);

var c = 0/0;
console.log(c);

// 비교연산자
// >, <. >=, <=, !=, ==, ===
// 결론부터 이야기하면 무조건 === 쓰세요

// ==은 데이터 값만 비교
console.log(1 == 1); // true
console.log(1 == "1"); // true

// ===은 데이터 값과 데이터 타입을 모두 비교
console.log(1 === 1); // true
console.log(1 === "1"); // false

// NaN
// 비교연산은 사용하지 않음
// 비교연산에서 NaN이 한번이라도 언급되면 무조건 false를 리턴함
console.log(NaN === NaN);

// 할당연산자
// +=, -=, *=, /=, %= ...
var a = 1;
a += 2;
console.log(a);

// 논리 연산자
// &&(and), ||(or)
console.log(true && false); // false
console.log(true || false); // true

// 조건문
if(false){
    console.log("hello");
}else if(true){
    console.log("dss");
}else{
    console.log("world");
}

// false로 간주되는 데이터
// null, undefined, NaN, 0, ""

//true로 간주되는 데이터
// [], {}

// 문제1. 점수를 입력하면 학점이 출력되는 코드를 작성
var point = 88;
if(point >= 90){
    console.log("A");
}else if(point >= 80){
    console.log("B")
}else if(point >= 70){
    console.log("C")
}else if(point >= 60){
    console.log("D")
}else if(point >= 50){
    console.log("E")
}else{
    console.log("F")
}

var point = 88;
var result = null;
if(point >= 90){
    result = "A";
}else if(point >= 80){
    result = "B";
}else if(point >= 70){
    result = "C";
}else if(point >= 60){
    result = "D"
}else if(point >= 50){
    result = "E"
}else{
    result = "F"
}
console.log(result);


// 반복문
// while, for, do while
// continue 와 break는 파이썬이랑 같음
var a = 10;
while(true){
    a ++;
    if(a === 12){
        continue;
    }
    if(a > 15){
        break;
    }
    console.log(a);
}


// for(초기값; 조건; 변수값 변경)
// 조건이 맞으면 반복문 실행되게 함.
for(var i=0; i<3; i++){
    console.log(i);
}

var i = 0
for(i; i<5; i++){
    console.log(i);
}

// 배열
var arr = ['a','b','c','d','e'];
console.log(arr[2]);
console.log(arr.length);
arr.push('f'); //python - append
console.log(arr);
arr.unshift('z'); //뒤에 추가
console.log(arr);
var result = arr.pop()
console.log(arr, result);

var result = arr.splice(2,1); // 2번에서 1개 자르기
console.log(arr, result);

var result = arr.splice(2,3); // 2번에서 3개 자르기
console.log(arr, result);


// 객체 - object
var obj = {};
obj.name = "doojin"; // 얘가 더 좋은 방법
 // obj.['familyName'] = "park";  // 가능은 하지만 지양하는 게 좋음
console.log(obj);



for(var key in obj){
    console.log(key, obj[key]);
}

var user = {
    name: 'doojin',
    age: 45,
    addr: 'seoul',

    skill: function(){
        console.log('coding')
    }
};


// 모듈 패턴
// OOP - 추상화, 캠슐화

// Module이라는 객체...... 추가해야 함
var Module = Module || {};
// Module에서..
(function(_Module){

    var _name = 'doojin';

    _Module.getName = function(){
        return _name;
    };
    _Module.setName = function(name){
        _name =  name;
    };
})(Module);

console.log(Module.getName());


// 함수
// 호이스팅 - hoisting : sum과 minus를 다르게 써놨는데 그래서 각각에서 뭐가 먼저 실행되는지가 다름
function sum(num1, num2){
    return num1 + num2;
}
var result = sum(1, 2);
console.log(result);

var minus = function(num1,num2){
    return num1 - num2;
};
var test = 1;

// 스코프
// 변수에 var을 붙이냐 안 붙이냐에 따라 다름. var 안 붙이면 전역.
var a = "dss1";
function disp(){
    a = "dss2";
    console.log(a); // dss2
}
disp();
console.log(a); // dss2

var a = "dss1";
function disp(){
    var a = "dss2";
    console.log(a); // dss2
}
disp();
console.log(a); // dss1

// 즉시실행함수, 익명함수
// 자바스크립트는 프론트엔드 언어
// 프론트엔드 언어는 코드가 다 노출됨
// 우리가 브라우저에서 함수를 마음대로 가져다가 쓸 수 있음
// 이를 방지하기 위해 즉시실행함수, 익명함수를 사용
// 문자열 사용시 ''를 이용해주세요. 이유는 html과 함께 많이 사용해서..
// html에서 ""를 사용하기 때문에 ''를 사용해줘야 에러를 줄일 수 있음
(function(){
    var name = 'doojin'
    var disp = function(){
        console.log(name);
    };
    disp();
})();

var name = 'doojin'
var disp = function(){
    console.log(name);
};
disp();


(function(){

}());

// callback
// 콜백함수 - 함수의 아규먼트로 함수를 받아서 모든 코드를 실행한 후에 아규먼트로 받은 함수를 실행
function getData(callback, num1, num2){
    var result = num1 + num2; // code
    callback(result); // 코드가 끝나고 특정 함수를 실행
}
function disp(number){
    console.log(result);
}
function sqrt(number){
    console.log(result*result);
}

//??????????

getData(disp, 2,3);
getData(sqrt, 2,3);

// 클로져(팩토리패턴으로 객체 생성), 프로토타입, es6 문법
