# هندسة Thanawyiah المقترحة لـLovable

## البنية

| الطبقة | التقنية | المسؤولية |
|---|---|---|
| الواجهة | React, TypeScript, Tailwind, shadcn/ui | الصفحات والتفاعل وRTL/LTR والطباعة |
| الحالة | TanStack Query + Zustand أو Context صغير | بيانات الجلسة والمكتبة وطلبات التوليد |
| الخلفية | Supabase Auth, Postgres, Storage | المستخدمون والمصادر والمحتوى والمكتبة |
| الذكاء الاصطناعي | Supabase Edge Function | التحقق من الطلب، اختيار المزوّد، التوليد، إعادة المحاولة، التحقق من JSON |
| الملفات | Supabase Storage | PDF والصور وملفات المصدر مع روابط موقعة |

## المكونات الأساسية

`AppShell`, `LessonPath`, `SourceComposer`, `SourceAnalysisCard`, `CurriculumPicker`, `GenerationSettings`, `QuizPlayer`, `QuestionExplanation`, `StudyGuideReader`, `PrintToolbar`, `LibraryFilters`, `EmptyState`, `LoadingState`, `ErrorState`.

## عقود البيانات

```ts
type CognitiveLevel = 'recall' | 'understanding' | 'application' | 'analysis' | 'inference';
type SkillArea = 'vocabulary' | 'grammar' | 'word_formation' | 'reading' | 'mixed' | 'subject_specific';

type QuizQuestion = {
  id: string;
  question: string;
  choices: string[];
  correctAnswer: number;
  explanation: string;
  sourceEvidence: string;
  skillArea: SkillArea;
  cognitiveLevel: CognitiveLevel;
  qualityScore: number;
};
```

## تدفق التوليد

يرفع المستخدم المصدر إلى Storage، ثم يسجل صفًا في `study_sources`. تستخرج الواجهة metadata أولية، وترسل معرف المصدر فقط إلى Edge Function. تستدعي الدالة النص أو الملف المصرح به من Storage، تبني البرومبت وفق المنهج واللغة، تطلب JSON منظّمًا، تتحقق منه عبر Zod، ثم تحفظ النتيجة في `quizzes` أو `study_guides`. لا تمرر ملفات base64 الكبيرة أو مفتاح API عبر العميل عندما تصبح النسخة إنتاجية.

## اختبار القبول

اكتب اختبارات مكوّنات للأسئلة والتنقل وRTL/LTR، واختبارات تكامل لمسار: تسجيل حساب → رفع نص → توليد كويز تجريبي عبر mock → حل الكويز → حفظ المحاولة في المكتبة. اختبر كذلك فشل التوليد وحجم الملف غير المقبول وانتهاء الجلسة.
