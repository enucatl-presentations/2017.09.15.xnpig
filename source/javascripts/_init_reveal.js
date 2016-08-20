// Full list of configuration options available at:
// https://github.com/hakimel/reveal.js#configuration
Reveal.initialize({
    controls: true,
    progress: true,
    history: true,
    center: false,
    slideNumber: 'c/t',
    transition: 'none', // none/fade/slide/convex/concave/zoom
    // Optional reveal.js plugins
    dependencies: [
        { src: 'vendor/reveal/lib/js/classList.js', condition: function() { return !document.body.classList; } },
        { src: 'vendor/reveal/plugin/markdown/marked.js', condition: function() { return !!document.querySelector( '[data-markdown]' ); } },
        { src: 'vendor/reveal/plugin/markdown/markdown.js', condition: function() { return !!document.querySelector( '[data-markdown]' ); } },
        { src: 'vendor/reveal/plugin/highlight/highlight.js', async: true, condition: function() { return !!document.querySelector( 'pre code' ); }, callback: function() { hljs.initHighlightingOnLoad(); } },
        { src: 'vendor/reveal/plugin/zoom-js/zoom.js', async: true },
        { src: 'vendor/reveal/plugin/notes/notes.js', async: true },
        { src: 'vendor/reveal/plugin/math/math.js', async: true }
    ],
});
