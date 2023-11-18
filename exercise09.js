// Exercise 9: Data Manipulation
//   - After fetching data in Exercise 8, filter out and log posts written by a specific user.
//   - Implement this both with and without Async/Await.


// Fetch API without Async/Await
fetch("https://jsonplaceholder.typicode.com/todos/55")
    .then(response => response.json())
    .then(data => {
        console.log("Fetch API without Async/Await")
        console.log(`User${data.userId} has written an article on the title "${data.title}"`)
    })
    .catch(error => console.error("Error fetching data:", error.message));


// Fetch API with Async/Await - no error    
async function filterOutPosts() {
    try
    {
        const url = "https://jsonplaceholder.typicode.com/todos/55"
        const response = await fetch(url)
        const data = await response.json()
        console.log("Fetch API with Async/Await")
        console.log(`User${data.userId} has written an article on the title "${data.title}"`)
    } catch (error)    
    {
        console.error(error.message)
    }
}

// calling async functions
filterOutPosts()
