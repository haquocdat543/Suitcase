# WEB

## 1. Basic
### 1. HTML
#### 1. Elements
##### head
```
<header> Content </header>
```

##### body
```
<body> Content </body>
```

##### title
```
<title> Content </title>
```

##### heading 1 ( Largest )
```
<h1> Content </h1>
```

##### heading 2 ( Second largest )
```
<h2> Content </h2>
```

##### heading N ( N largest )
```
<hN> Content </hN>
```

##### bold
```
<b> Content </b>
```
```
<b>This text is bold</b>
```

##### italic
```
<i> Content </i>
```
```
<i>This text is italic</i>
```

##### emphasized
```
<em>This text is emphasized</em>
```

##### strong
```
<strong> Content </strong>
```

##### small
```
<small> Content </small>
```
```
<small>This is some smaller text.</small>
```

##### mark ( yellow background )
```
<p>Do not forget to buy <mark>milk</mark> today.</p>
```

##### delete ( middle line through text )
```
<p>My favorite color is <del>blue</del> red.</p>
```

##### insert ( underline throught text )
```
<p>My favorite color is <del>blue</del> <ins>red</ins>.</p>
```

##### subscripted ( appears half a character below the normal line )
```
<p>This is <sup>superscripted</sup> text.</p>
```

##### superscripted ( appears half a character above the normal line, )
```
<p>This is <sup>superscripted</sup> text.</p>
```

##### paragraph
```
<p> Content </p>
```
```
<p
title="I'm a tooltip"
>
This is a paragraph.
</p>
```
* The value of the title attribute will be displayed as a tooltip when you mouse over the element:

##### horizontal rule
```
<hr>
```
```
<h1>This is heading 1</h1>
<p>This is some text.</p>
<hr>
<h2>This is heading 2</h2>
<p>This is some other text.</p>
<hr>
```

##### break line
```
<br>
```
```
<p>This is<br>a paragraph<br>with line breaks.</p>
```

##### button
```
<button> Content </button>
```
Attribute:

* onClick:
```
<button onClick={handleClick}> Click me</button>
```

##### img
```
<img
src=./link/to/image
alt="Alternative_Text"
/>
```
* src: image source
* alt: alternative text
  * The alt attribute should reflect the `image content`, so users who `cannot see` the image get `an understanding` of what the image contains:
* width: width
* height: height

* If we try to display an image that `does not exist`, the value of the `alt attribute` will be `displayed instead`

##### HTML link
```
<a
href="https://www.w3schools.com"
>
This is a link
</a>
```

#### 2. Attributes
##### name ( name of element ):
```
name=NavBar
```

##### className ( class of element ):
```
className=NavBar
```

##### id ( id of element ):
```
id=Navigation-Bar
```

##### placeholder ( text inside a button or input field ):
```
placeholder="Your Name"
```

##### css ( css directly inside element ):
```
css={{ padding: "2px 4px 2px" }}
```

##### style:
```
<tagname style="property:value;">
```
Eg ( background-color ):

```
<body style="background-color:powderblue;">

<h1>This is a heading</h1>
<p>This is a paragraph.</p>

</body>
```

Eg ( color ):
```
<h1 style="color:blue;">This is a heading</h1>
<p style="color:red;">This is a paragraph.</p>
```

Eg ( font-family ):
```
<h1 style="font-family:verdana;">This is a heading with verdana</h1>
<p style="font-family:courier;">This is a paragraph with courier.</p>
```

Eg ( font-size ):
```
<h1 style="font-size:300%;">This is a heading</h1>
<p style="font-size:160%;">This is a paragraph.</p>
```

Eg ( text-align ):
```
<h1 style="text-align:center;">Centered Heading</h1>
<p style="text-align:center;">Centered paragraph.</p>
```

### 2. CSS
* . mean class
```
.App {
  text-align: center;
}
```

* # mean id
```
.App {
  text-align: center;
}
```

### 3. JAVASCRIPT
#### function
```
const function_name = () => {
  function_logic_block
  return return_value
}
```
___
## 2. Common framwork
### 1. ReactJS
#### 1. Initialize project
```
npx create-react-app ${project_name}
```

#### 2. useState 
```
const [count, setCount] = useState();
```
* `count` and `setCount` can be anything.

#### 3. useEffect
#### 4. useMemo
#### 5. useCallback
#### 5. useRef
#### 6. useReducer
#### 7. useTransition
#### 8. useDefferedValue
#### 8. useContext

### 2. AngularJS

### 3. VueJS
___
## 3. Common library
### 1. Express
```
npm install express
```

### 2. Axios
```
npm install axios
```

### 3. Lodash
```
npm install lodash
```

### 4. Mongoose
```
npm install mongoose
```

### 5. UUID
```
npm install uuid
```

