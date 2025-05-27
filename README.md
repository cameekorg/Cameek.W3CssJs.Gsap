# Cameek.W3CssJs.PrismJs

![NuGet](https://img.shields.io/nuget/v/Cameek.W3CssJs.PrismJs?label=NuGet&logo=nuget)
![.NET](https://img.shields.io/badge/.NET-8.0-blue?logo=dotnet)

**Cameek.W3CssJs.PrismJs** is a Razor Class Library (RCL) that contains static assets (CSS and JavaScript) for the [PrismJS](https://prismjs.com/) syntax highlighting engine. It is intended to be referenced from other Blazor or Razor ASP.NET Core projects to enable easy syntax highlighting integration.

This library supports both Blazor WebAssembly and Blazor Server applications.

---

## ✨ Features

- Includes PrismJS core + several languages (C#, XML, JSON, JavaScript, Shell, Java)
- Includes PrismJS plugin for **line numbers**
- Easy-to-use Razor component integration
- Ideal for code display, tutorials, or documentation in Blazor apps
- Hosted under `_content/Cameek.W3CssJs.PrismJs` for use via static asset references

---

## 📦 Installation

Install from NuGet:

```bash
dotnet add package Cameek.W3CssJs.PrismJs --version 1.30.0
```

Or reference it in your `.csproj`:

```xml
<PackageReference Include="Cameek.W3CssJs.PrismJs" Version="1.30.0" />
```

---

## 🛠 Usage

1. In your `index.html` (Blazor WebAssembly) or `_Host.cshtml` (Blazor Server), include:

```html
<link href="_content/Cameek.W3CssJs.PrismJs/css/prism.min.css" rel="stylesheet" />
<link href="_content/Cameek.W3CssJs.PrismJs/css/prism-line-numbers.min.css" rel="stylesheet" />

<link href="_content/Cameek.W3CssJs.PrismJs/css/prism.min.css" rel="stylesheet" />
<link href="_content/Cameek.W3CssJs.PrismJs/css/prism-line-numbers.min.css" rel="stylesheet" />

<script src="_content/Cameek.W3CssJs.PrismJs/js/prism.min.js"></script>
<script src="_content/Cameek.W3CssJs.PrismJs/js/prism-line-numbers.min.js"></script>
<script src="_content/Cameek.W3CssJs.PrismJs/js/prism-bash.min.js"></script>
<script src="_content/Cameek.W3CssJs.PrismJs/js/prism-batch.min.js"></script>
<script src="_content/Cameek.W3CssJs.PrismJs/js/prism-c.min.js"></script>
<script src="_content/Cameek.W3CssJs.PrismJs/js/prism-cpp.min.js"></script>
<script src="_content/Cameek.W3CssJs.PrismJs/js/prism-csharp.min.js"></script>
<script src="_content/Cameek.W3CssJs.PrismJs/js/prism-css.min.js"></script>
<script src="_content/Cameek.W3CssJs.PrismJs/js/prism-java.min.js"></script>
<script src="_content/Cameek.W3CssJs.PrismJs/js/prism-javascript.min.js"></script>
<script src="_content/Cameek.W3CssJs.PrismJs/js/prism-json.min.js"></script>
<script src="_content/Cameek.W3CssJs.PrismJs/js/prism-kotlin.min.js"></script>
<script src="_content/Cameek.W3CssJs.PrismJs/js/prism-php.min.js"></script>
<script src="_content/Cameek.W3CssJs.PrismJs/js/prism-powershell.min.js"></script>
<script src="_content/Cameek.W3CssJs.PrismJs/js/prism-properties.min.js"></script>
<script src="_content/Cameek.W3CssJs.PrismJs/js/prism-python.min.js"></script>
<script src="_content/Cameek.W3CssJs.PrismJs/js/prism-ruby.min.js"></script>
<script src="_content/Cameek.W3CssJs.PrismJs/js/prism-shell-session.min.js"></script>
<script src="_content/Cameek.W3CssJs.PrismJs/js/prism-sql.min.js"></script>
<script src="_content/Cameek.W3CssJs.PrismJs/js/prism-xml-doc.min.js"></script>
<script src="_content/Cameek.W3CssJs.PrismJs/js/prism-yaml.min.js"></script>
```

2. Use PrismJS-friendly markup:

```html
<pre class="line-numbers">
  <code class="language-csharp">
    public class HelloWorld
    {
        public void Greet() => Console.WriteLine("Hello PrismJS");
    }
  </code>
</pre>
```

You may need to call `Prism.highlightAll()` using JS interop when loading dynamic content.

---

## 💡 Tip: Use with Custom Blazor Component

Consider wrapping this with your own Razor component:

```razor
<CodeBlockSyntax Language="csharp">
@("public void Run() { Console.WriteLine(\"OK\"); }")
</CodeBlockSyntax>
```

Where the component applies the `language-*` class and triggers JS highlighting automatically.

---

## 📄 License

Licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## 👤 Author

Created and maintained by [CameekOrg](https://github.com/cameekorg). This project is intended for use across internal Cameek solutions.

---

## 📬 Related Projects

- [Cameek.W3CssJs.Bootstrap](https://www.nuget.org/packages/Cameek.W3CssJs.Bootstrap) – Bootstrap 5 packaged for Blazor apps
- [PrismJS](https://prismjs.com/) – Lightweight, extensible syntax highlighter

