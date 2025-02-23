# JAVASCRIPT

## 1. logging
All methods
```js
console.log(console);
```

Assert
```js
console.assert(false, 'user is not logged in');
```

Using object { }
```js
const foo = 2;
const foo = 3;
console.log({ foo, bar });
```

Using table
```js
const foo = 2;
const foo = 3;
console.table([ foo, bar ]);
```

Using group
```js
console.table("shit dont work");
```

Using dir
```js
console.dir(screen);
```

Using count
```js
console.count("click");
```

Using time
```js
console.time();
```

Using timeLog
```js
console.timeLog();
```

Using trace
```js
function bottom() {
    function top() {
    console.trace("which function is calling me ?");
    }
    top();
}

bottom();
```

Using css
```js
console.log("%c Javascript is beatiful ", "color: pink; font-weight: bold; background-color: black;");
```

