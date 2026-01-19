# C# Async and Await

C# provides the `async` and `await` keywords to simplify asynchronous programming, making it easier to write non-blocking code that performs long-running operations (like network requests, file I/O, or database queries) without freezing the application's user interface or consuming excessive threads.

## Key Concepts

*   **`async` keyword:** Used to mark a method as asynchronous. An `async` method can contain `await` expressions. It typically returns a `Task` or `Task<TResult>`.
*   **`await` keyword:** Used within an `async` method to pause the execution of that method until the awaited asynchronous operation completes. While the `async` method is paused, control is returned to the caller, allowing the UI to remain responsive or other tasks to run.
*   **`Task` and `Task<TResult>`:** Represent an asynchronous operation. `Task` is used for methods that don't return a value, while `Task<TResult>` is used for methods that return a value of type `TResult`.

## How it Works (Simplified)

When `await` is encountered, if the awaited `Task` is not yet complete, the `async` method is suspended, and control returns to the caller. When the `Task` completes, the remainder of the `async` method (the continuation) is scheduled to run.

## Example

```csharp
using System;
using System.Net.Http;
using System.Threading.Tasks;

public class AsyncExample
{
    public static async Task Main(string[] args)
    {
        Console.WriteLine("Starting asynchronous operation...");
        string content = await DownloadContentAsync("https://www.example.com");
        Console.WriteLine($"Content downloaded (first 100 chars):\n{content.Substring(0, 100)}...");
        Console.WriteLine("Asynchronous operation finished.");
    }

    public static async Task<string> DownloadContentAsync(string url)
    {
        using (HttpClient client = new HttpClient())
        {
            // await pauses this method until the HTTP request completes
            string content = await client.GetStringAsync(url);
            return content;
        }
    }
}
```

In this example, `Main` method calls `DownloadContentAsync`. When `await client.GetStringAsync(url)` is hit, `DownloadContentAsync` pauses, and `Main` continues. Once `GetStringAsync` completes, `DownloadContentAsync` resumes, and then `Main` continues after its own `await` completes.

