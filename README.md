### 1.5 技术动态与知识沉淀

## 基本信息

- **适用场景**：技术雷达自动采集与定向推送、技术选型决策辅助（多方案对比 + POC 路径）、项目代码库扫描生成架构文档 / ADR / Onboarding 入职手册、团队知识资产沉淀与传承、企业内部技术博客聚合。
- **技术栈**：前端 HTML5 + CSS3 + JavaScript（ECharts 雷达图 / Chart.js 趋势图 · Mermaid 架构图 · Marked 渲染 Markdown）；后端 Python 3.13（BeautifulSoup / feedparser / GitHub REST API）+ Node.js 22（@octokit/rest）；存储 SQLite / 腾讯文档 / 乐享知识库；调度 WorkBuddy 自动化任务 + crontab + GitHub Actions。

## 核心功能

- **多源信息聚合 · 智能筛选 · 结构化沉淀**：定时（可配置）从任意多源（RSS / 官方博客 / GitHub Trending / 行业媒体 / 内部知识库 / 企微群消息 等）拉取信息，AI 按自定义标签体系自动分类、去重、打分，结构化输出日报 / 周报 / 简报，可推送到企微群、飞书、邮件，或存档到腾讯文档 / 乐享 / Notion。支持订阅 / 退订 / 关键词过滤。
- **多方案选型对比 · 加权评分 · 决策报告**：输入 2~5 个候选方案（技术 / 供应商 / 产品 / 架构 等任意可对比对象），按 N 维指标（功能 / 性能 / 成本 / 社区 / 兼容性 / 风险 等可扩展）自动拉数据 → 雷达图 + 加权评分 → 一键输出选型报告（推荐结论 + 风险点 + POC 清单），可直接作为 ADR / 立项依据。
- **代码库扫描 · 架构解析 · 知识资产自动生成**：扫描任意代码库（GitHub / GitLab / Gitee / 本地 / SVN）→ AI 解析目录结构、关键模块、依赖关系、调用链 → 自动输出三件套：① 架构图（Mermaid / PlantUML）② 决策文档模板（背景 / 决策 / 影响）③ 新人 Onboarding 指南（环境搭建 / 核心流程 / 常见坑），一键发布到团队知识库，支持增量更新与版本对比。

## 使用示例：

```
1   帮我做一个 AI 行业日报的自动推送系统：
2   - 数据源：arXiv（cs.AI / cs.CL）+ Hacker News（AI tag）+ OpenAI / Anthropic / DeepMind 官方博客 + 36 氪 AI 频道
3   - 筛选：LLM 分类（模型发布 / 论文突破 / 融资事件 / 产品落地 / 政策监管 5 类）+ 重要性打分（1~5 星）
4   - 摘要：每条 1 段中文摘要 + 1 个「对我们的启示」+ 1 个原文链接 + 1 个相关项目 Star 数
5   - 推送：每日早 8:00 推送到「AI 产品组」企微群，只推 ≥3 星动态，附日报卡片图
6   - 存储：原始数据进 SQLite 全文索引，结构化日报写腾讯文档（永久链接，便于回看）
7   - 样式：暗色主题卡片（紫=模型 / 蓝=论文 / 绿=产品 / 橙=融资 / 红=政策），支持筛选与收藏
8   - 部署：GitHub Actions 每天 7:30 跑采集 → WorkBuddy 自动化兜底 → 失败时人工介入群
```

**示例产物**：
- [`tech-pulse.html`](./tech-pulse.html) —— AI 日报雷达大屏（含 5 类动态 + 5 星打分 + 18 条今日精选）
- [`decision-matrix.html`](./decision-matrix.html) —— 选型对比矩阵（GPT-4o vs Claude 3.5 vs Gemini 1.5 Pro 5 维雷达）
- [`onboarding.html`](./onboarding.html) —— 团队知识资产展示（含架构图 + ADR + 新人 30 分钟 Onboarding）

**对照清单**：

| 需求行 | 实现位置 | 关键代码 |
|---|---|---|
| 1 任务 | 顶部 `header` | 「AI 行业日报」副标题 + 脉冲灯 + 早 8 点倒计时 |
| 2 数据源 | `mockArxiv()` + `mockHackerNews()` + `mockOfficialBlog()` + `mock36Kr()` | 4 源 mock，18 条覆盖 5 类 |
| 3 筛选 | `classifyByAI()` + `scoreImportance()` | 5 分类标签 + 1~5 星打分 |
| 4 摘要 | `generateDigest()` | 中文摘要 + 启示 + 链接 + Star 数 4 字段 |
| 5 推送 | `pushToWeCom()` | webhook + 早 8:00 cron + 3 星过滤 |
| 6 存储 | `SQLite + TDoc` | 全文索引 + 永久链接 |
| 7 样式 | CSS `tag-purple/blue/green/orange/red` | 5 色卡片 + 筛选条 |
| 8 部署 | 底部 `deploy-row` | GitHub Actions YAML + WorkBuddy 自动化兜底 |
