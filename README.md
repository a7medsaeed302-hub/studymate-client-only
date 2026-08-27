# Thanawyiah 🎓

**Thanawyiah** منصة مذاكرة عربية ثنائية اللغة لطلاب الثانوية والبكالوريا. تحوّل الدرس أو PDF أو الصورة أو الفيديو إلى ملزمة منظمة، ملخص، وكويز تفاعلي يقيس التذكر والفهم والتطبيق والتحليل والاستنتاج.

> هذه النسخة نموذج مستقل يعمل في المتصفح. للاستخدام الشخصي انسخ `api.config.example.js` إلى `api.config.js` محليًا وأضف المفاتيح، لكن لا ترفع هذا الملف إلى GitHub مطلقًا.

## التشغيل المحلي السريع

ضع مفاتيحك في `gemini.apiKeys` أو `openrouter.apiKeys` داخل `api.config.js`، وحدد `activeProvider`، ثم افتح `index.html` في متصفح حديث. تدعم الواجهة تدوير المفاتيح والنماذج والانتقال من Gemini إلى OpenRouter عند الحاجة.

## البناء عبر Lovable

المستودع جاهز ليكون مصدرًا واضحًا للبناء. اقرأ [LOVABLE.md](./LOVABLE.md)، ثم انسخ محتوى [lovable/START_PROMPT_AR.md](./lovable/START_PROMPT_AR.md) إلى Lovable. يحتوي مجلد `lovable/` على خارطة الواجهات والهندسة ومخطط Supabase ونظام التصميم.

| الملف | الغرض |
|---|---|
| `index.html` | النموذج السلوكي والبصري المرجعي للمنصة |
| `LOVABLE.md` | عقد المنتج والتنفيذ لفريق Lovable |
| `lovable/START_PROMPT_AR.md` | أمر بداية عربي جاهز للنسخ إلى Lovable |
| `lovable/ARCHITECTURE.md` | الصفحات والمكوّنات وتدفقات الاستخدام |
| `lovable/supabase_schema.sql` | مخطط بيانات آمن مع RLS |
| `lovable/design-tokens.json` | ألوان وخطوط ومسافات الهوية |
| `api.config.example.js` | مثال إعداد محلي بلا أسرار |

## الأمان

لا تستخدم نسخة العميل فقط للنشر العام إذا كانت مفاتيحك لها صلاحيات أو ميزانية غير محدودة. عند بناء النسخة الإنتاجية في Lovable، احفظ المفاتيح في Supabase Edge Function Secrets فقط، ولا تمررها إلى React أو localStorage أو الملفات العامة.
