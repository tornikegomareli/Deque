
<p align="center">
    <img src="https://imgtr.ee/images/2023/04/09/nvqrl.png" alt="Medium article banner" width="648" maxHeight="156" />
</p>

<p align="center">
    <img src="https://img.shields.io/badge/Swift-5.8-brightgreen.svg" />
    <a href="https://twitter.com/tornikegomareli">
        <img src="https://img.shields.io/badge/Contact-@tornikegomareli-orange" alt="Twitter: @tornikegomareli" />
    </a>
    <a href="https://www.linkedin.com/in/tornikegomareli/">
        <img src="https://img.shields.io/badge/Contact-Linkedin-orange" alt="Linkedin: @Linkedin" />
    </a>
</p>

Using a circular buffer as storage, the Deque custom collection type in Swift offers a double-ended queue data structure. At both ends of the queue, it enables efficient insertion and removal operations.

This implementation still requires some performance optimizations, such as lazy resizing and the use of a custom index type to prevent pointless range checks. Although I believe my Medium article, which is the reason for this, is doing its job in this context, I may add more improvements in the future, solely for educational uses.

Please refrain from using this data structure in your projects as it is a long way from being ready for production.



## Usage

To use Deque in your project, simply install it with SPM. Then, you can create a new instance of Deque with the desired capacity

```swift
var deque = Deque<Int>(capacity: 10)
deque.prepend(1)
deque.append(1)
deque.removeLast()
deque.removeFirst()
```

You can then use the append, prepend, removeFirst, and removeLast methods to add and remove elements from the deque.

Deque also conforms to the Collection protocol and Sequence Protocol, so you can use it in any context that expects a collection or Sequence.

## Contributing

This implementation is for educational purposes and created for an article. However, if you find any bugs or have any suggestions for improvements, feel free to submit an issue or pull request.
