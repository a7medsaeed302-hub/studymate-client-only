# أمر بداية جاهز للنسخ إلى Lovable

```text
ابنِ تطبيق ويب إنتاجي عربي/إنجليزي باسم Thanawyiah 🎓، وهو منصة مذاكرة لطلاب الثانوية والبكالوريا. استخدم React + TypeScript + Vite + Tailwind + shadcn/ui وSupabase (Auth, Database, Storage, Edge Functions). اقرأ ملفات LOVABLE.md وlovable/ARCHITECTURE.md وlovable/design-tokens.json وlovable/supabase_schema.sql في هذا المستودع قبل كتابة أي كود، واعتبر index.html نموذجًا سلوكيًا مرجعيًا فقط.

الهوية: «أطلس المذاكرة». اجعل الواجهة RTL افتراضيًا مع دعم LTR للمحتوى الإنجليزي. استخدم نيليًا عميقًا للثقة وذهبيًا أطلسيًا للإنجاز وخلفيات ورقية كريمية. اجعل مسار الدرس مصدر → تحليل → ملزمة → كويز → مراجعة عنصرًا ظاهرًا. تجنب واجهات SaaS العامة والخلفيات البنفسجية وخط Inter كخط وحيد.

المنتج: يسمح للطالب بلصق نص أو رفع PDF/صور/HTML أو إدخال رابط YouTube، ثم تحليل المصدر واكتشاف اللغة والمهارات والجودة. بعد ذلك ينتج: 1) كويز تفاعلي MCQ، 2) ملزمة قابلة للطباعة، أو 3) ملخص سريع. لكل سؤال احفظ question, choices, correctAnswer, explanation, sourceEvidence, skillArea, cognitiveLevel, qualityScore. يدعم الكويز التذكر والفهم والتطبيق والتحليل والاستنتاج، ويقدم تفسيرًا ودليلًا من المصدر بعد الحل.

الإنجليزية: ادعم Vocabulary & Context وGrammar & Usage وWord Formation & Derivatives وReading Comprehension وMixed Skills. لا تترجم الدرس الإنجليزي كاملًا؛ حافظ على الجمل والأمثلة والقطع الإنجليزية، واستخدم العربية للشرح فقط عند اختيار المستخدم ذلك.

الأمان: لا تستخدم أي مفتاح AI في الواجهة أو localStorage. أنشئ Supabase Edge Function باسم generate-study-content، واقرأ GEMINI_API_KEY وOPENROUTER_API_KEY من Secrets فقط. نفذ التحقق من نوع وحجم الملف، rate limiting، وتسجيلًا تشخيصيًا لا يحفظ المصدر أو المفتاح. استخدم مخطط قاعدة البيانات المرفق وRLS بحيث لا يرى المستخدم إلا بياناته.

ابدأ بهذه المراحل: (1) Auth + Onboarding، (2) Dashboard + Library ببيانات قاعدة حقيقية، (3) Source Upload + Analysis، (4) Edge Function + Quiz Player، (5) Study Guide + Print/Export، (6) اختبارات حالات النجاح والأخطاء والهاتف. لا تترك أزرارًا وهمية؛ إن لم تنفذ ميزة فأخفها بدلًا من عرض عنصر غير عامل.
```
