export default {
  port: Number(process.env.PORT ?? 3000),
  fetch(req) {
    const url = new URL(req.url);
    const now = new Date().toISOString();
    return new Response(
      `
      <html>
        <main>
          <img src="https://bun.sh/logo@2x.png" style="height: 48px;" alt="bun logo" />
          <h1>Basic example of Bun</h1>
          <div>Rendered at: ${now}</div>
          <div>This is ${url.toString()}.</div>
        </main>
      </html>`,
      {
        headers: {
          "Content-Type": "text/html",
        },
      }
    );
  },
};
