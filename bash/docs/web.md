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

##### quote
```
<p>WWF's goal is to: <q>Build a future where people live in harmony with nature.</q></p>
```

##### abbreviation
```
<p>The <abbr title="World Health Organization">WHO</abbr> was founded in 1948.</p>
```

##### blockquote
```
<p>Here is a quote from WWF's website:</p>
<blockquote cite="http://www.worldwildlife.org/who/index.html">
For 60 years, WWF has worked to help people and nature thrive. As the world's leading conservation organization, WWF works in nearly 100 countries. At every level, we collaborate with people around the world to develop and deliver innovative solutions that protect communities, wildlife, and the places in which they live.
</blockquote>
```

##### address ( italic )
```
<address>
Written by John Doe.<br>
Visit us at:<br>
Example.com<br>
Box 564, Disneyland<br>
USA
</address>
```

##### Cite ( italic )
```
<p><cite>The Scream</cite> by Edvard Munch. Painted in 1893.</p>
```

##### Bidirection Override
```
<bdo dir="rtl">This text will be written from right to left</bdo>
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

#### 3. Comment
```
<!-- Write your comments here -->
```
```
<!--
Write your comments here
-->
```

#### 4. Color

Basic colors
* DodgerBlue
* Tomato
* MediumSeaGreen
* Orange
* Gray
* SlateBlue
* Violet
* LightGray

##### 1. Background color
```
<h1 style="background-color:DodgerBlue;">Hello World</h1>
<p style="background-color:Tomato;">Lorem ipsum...</p>
```

##### 2. Text color
```
<h1 style="color:Tomato;">Hello World</h1>
<p style="color:DodgerBlue;">Lorem ipsum...</p>
<p style="color:MediumSeaGreen;">Ut wisi enim...</p>
```

##### 3. Border Color
```
<h1 style="border:2px solid Tomato;">Hello World</h1>
<h1 style="border:2px solid DodgerBlue;">Hello World</h1>
<h1 style="border:2px solid Violet;">Hello World</h1>
```

##### 4. Color Values
```
<h1 style="background-color:rgb(255, 99, 71);">...</h1>
<h1 style="background-color:#ff6347;">...</h1>
<h1 style="background-color:hsl(9, 100%, 64%);">...</h1>

<h1 style="background-color:rgba(255, 99, 71, 0.5);">...</h1>
<h1 style="background-color:hsla(9, 100%, 64%, 0.5);">...</h1>
```

#### 5. Form
##### 1. Form elements 
* <input>
* <label>
* <select>
* <textarea>
* <button>
* <fieldset>
* <legend>
* <datalist>
* <output>
* <option>
* <optgroup>

##### 2. Input elements 
* <input type="button">
* <input type="checkbox">
* <input type="color">
* <input type="date">
* <input type="datetime-local">
* <input type="email">
* <input type="file">
* <input type="hidden">
* <input type="image">
* <input type="month">
* <input type="number">
* <input type="password">
* <input type="radio">
* <input type="range">
* <input type="reset">
* <input type="search">
* <input type="submit">
* <input type="tel">
* <input type="text">
* <input type="time">
* <input type="url">
* <input type="week">


### 2. CSS
##### dot ( class )
```
.App {
  text-align: center;
}
```

##### hash ( id )
```
#App-Logo {
  text-align: center;
}
```

##### padding
The CSS padding property defines a padding (space) between the text and the border.
```
p {
  border: 2px solid powderblue;
  padding: 30px;
}
```

##### margin
The CSS margin property defines a margin (space) outside the border.
```
p {
  border: 2px solid powderblue;
  margin: 50px;
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

