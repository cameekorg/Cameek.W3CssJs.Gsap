# Cameek.W3CssJs.Gsap

![NuGet](https://img.shields.io/nuget/v/Cameek.W3CssJs.Gsap?label=NuGet\&logo=nuget)
![.NET](https://img.shields.io/badge/.NET-8.0-blue?logo=dotnet)

**Cameek.W3CssJs.Gsap** is a Razor Class Library (RCL) providing static assets (JavaScript) for [GSAP (GreenSock Animation Platform)](https://greensock.com/gsap/). It facilitates easy integration of powerful animation capabilities into Blazor WebAssembly and Blazor Server applications.

---

## ✨ Features

* Includes GSAP Core and plugins:

  * **Draggable, DrawSVGPlugin, EaselPlugin, Flip, GSDevTools, InertiaPlugin, MotionPathPlugin, MorphSVGPlugin, Observer, Physics Plugins, PixiPlugin, ScrollTrigger, ScrollSmoother, ScrollToPlugin, SplitText, TextPlugin** and more.
* Easy integration for animations and interactions
* Hosted under `_content/Cameek.W3CssJs.Gsap` for straightforward referencing in Blazor apps
* Suitable for rich user experiences, interactive UIs, and animations in Blazor projects

---

## 📦 Installation

Install from NuGet:

```bash
dotnet add package Cameek.W3CssJs.Gsap --version 3.13.5
```

Or reference directly in your `.csproj`:

```xml
<PackageReference Include="Cameek.W3CssJs.Gsap" Version="3.13.5" />
```

---

## 🛠 Usage

In your `index.html` (Blazor WebAssembly) or `_Host.cshtml` (Blazor Server), include GSAP assets:

```html
<script src="_content/Cameek.W3CssJs.Gsap/js/gsap.min.js"></script>
<script src="_content/Cameek.W3CssJs.Gsap/js/ScrollTrigger.min.js"></script>
<script src="_content/Cameek.W3CssJs.Gsap/js/Draggable.min.js"></script>
<!-- include additional plugins as needed -->
```

### Example Usage

Basic GSAP animation in a Blazor component:

```razor
<div id="animatedBox">Animate me!</div>

@code {
    protected override async Task OnAfterRenderAsync(bool firstRender)
    {
        if (firstRender)
        {
            await JS.InvokeVoidAsync("gsap.to", "#animatedBox", new { duration = 2, x = 100 });
        }
    }
}
```

---

## 💡 Tip: Blazor JS Interop

Wrap GSAP calls in a Blazor-friendly JS interop method for cleaner Razor components:

```js
// wwwroot/scripts/site.js
window.animateBox = (selector) => {
  gsap.to(selector, { duration: 2, rotation: 360 });
};
```

Then use in Razor components:

```razor
@inject IJSRuntime JS

<div id="spinBox">Spin me!</div>

<button @onclick="Spin">Animate</button>

@code {
    async Task Spin()
    {
        await JS.InvokeVoidAsync("animateBox", "#spinBox");
    }
}
```

---

## 📄 License

Licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## 👤 Author

Created and maintained by [CameekOrg](https://github.com/cameekorg). This project is intended for use across internal Cameek solutions.

---

## 📬 Related Projects

* [Cameek.W3CssJs.PrismJs](https://www.nuget.org/packages/Cameek.W3CssJs.PrismJs) – PrismJS for Blazor syntax highlighting
* [GSAP (GreenSock Animation Platform)](https://greensock.com/gsap/) – Professional-grade JavaScript animation framework
