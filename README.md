### 1.5 技术动态与知识沉淀

## 基本信息

- **适用场景**：技术雷达自动采集与定向推送、技术选型决策辅助（多方案对比 + POC 路径）、项目代码库扫描生成架构文档 / ADR / Onboarding 入职手册、团队知识资产沉淀与传承、企业内部技术博客聚合。
- **技术栈**：前端 HTML5 + CSS3 + JavaScript（ECharts 雷达图 / Chart.js 趋势图 · Mermaid 架构图 · Marked 渲染 Markdown）；后端 Python 3.13（BeautifulSoup / feedparser / GitHub REST API）+ Node.js 22（@octokit/rest）；存储 SQLite / 腾讯文档 / 乐享知识库；调度 WorkBuddy 自动化任务 + crontab + GitHub Actions。

## 核心功能

- **AI 智能采集与筛选技术动态**：定时（每日早 9 点）从 GitHub Trending / Hacker News / InfoQ / 36 氪 / 掘金等多源拉取技术动态，AI 按零售业务标签（推荐系统 / 库存算法 / 私域 / POS / 小程序）自动筛选与去重，结构化生成日报并推送到对应技术小组的企微群，可订阅 / 退订。
- **多维度选型对比矩阵 & POC 建议**：输入 2~5 个候选方案（如 Redis vs DragonflyDB vs KeyDB），从功能 / 性能 / 社区活跃度 / License 友好度 / 与现有栈兼容性 5 个维度自动拉数据生成雷达图与加权评分，输出选型报告（推荐结论 + 风险点 + POC 清单），可直接作为 ADR 决策依据。
- **代码库扫描自动生成知识资产**：扫描项目代码库（GitHub / GitLab / 本地）→ AI 解析目录结构 / 关键类 / 模块依赖 → 自动输出三件套：① 架构图（Mermaid）② ADR 模板（背景 / 决策 / 影响）③ 新人 Onboarding 指南（10 分钟跑通 + 30 分钟理解），一键存档到乐享知识库对应项目文件夹。

## 使用示例：

```
1   帮我做一个技术动态与知识沉淀的周报推送：
2   - 数据源：GitHub Trending（Python 区）+ Hacker News（Show HN）+ InfoQ 架构专栏
3   - 筛选：用 LLM 识别「零售相关」标签（推荐/库存/私域/小程序/数字门店）
4   - 摘要：每条 3 行中文摘要 + 1 个应用建议 + 1 个相关项目 Star 数
5   - 推送：每周一 9:00 推送到「零售技术雷达」企微群，@相关订阅人
6   - 存储：原始数据进 SQLite，结构化周报写腾讯文档（按月归档）
7   - 样式：彩色卡片（红=新出现/橙=持续关注/绿=已落地），支持点击展开原文
8   - 部署：GitHub Actions 定时触发 + WorkBuddy 自动化兜底，结果双通道通知
```

**示例产物**：
- [`tech-pulse.html`](./tech-pulse.html) —— 技术动态雷达大屏（含 GitHub Trending + Hacker News 真实数据 mock）
- [`decision-matrix.html`](./decision-matrix.html) —— 选型对比矩阵（Redis vs DragonflyDB vs KeyDB 5 维雷达）
- [`onboarding.html`](./onboarding.html) —— 代码库扫描生成的知识资产展示（含架构图 + ADR + Onboarding）

**对照清单**：

| 需求行 | 实现位置 | 关键代码 |
|---|---|---|
| 1 任务 | 顶部 `header` | 「零售技术雷达」副标题 + 脉冲灯 |
| 2 数据源 | `mockTrending()` + `mockHackerNews()` | 20 条 GitHub + 10 条 HN 真实标签 mock |
| 3 筛选 | `filterRetail()` LLM 标签识别 | 关键词 + 向量双通道打分 |
| 4 摘要 | `generateDigest()` | 3 行摘要 + 应用建议 + Star 数 |
| 5 推送 | `pushToWeCom()` | webhook + @订阅人占位符 |
| 6 存储 | `SQLite + TDoc` | 月归档 + 月度复盘 |
| 7 样式 | CSS `tag-red/orange/green` | 与截图完全一致 |
| 8 部署 | 底部 `deploy-row` | GitHub Actions YAML + WorkBuddy 自动化 |
