/* انسخ هذا الملف باسم api.config.js ثم أضف مفاتيحك محليًا. */
window.STUDYMATE_API_CONFIG = {
  activeProvider: "gemini",
  requestTimeoutMs: 90000,
  maxRetriesPerKey: 1,
  gemini: { apiKeys: ["", ""], models: ["gemini-2.5-flash", "gemini-2.5-flash-lite"] },
  openrouter: {
    apiKeys: ["", ""],
    models: ["google/gemini-2.5-flash", "openai/gpt-4.1-mini"],
    appUrl: "",
    appName: "Thanawyiah"
  }
};
