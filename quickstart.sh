#!/bin/bash
# Tech Pulse 一键体验脚本
# 用法：bash quickstart.sh
# 作用：演示 3 个子功能在 WorkBuddy 调度中枢下的端到端联动

set -e
cd "$(dirname "$0")"

echo "==================================="
echo "  Tech Pulse 一键体验"
echo "  1. AI 技术动态采集与推送"
echo "  2. 多方案选型对比"
echo "  3. 代码库扫描生成知识资产"
echo "==================================="
echo ""

# ====== 1. AI 技术动态采集与推送 ======
echo "【1/3】AI 技术动态采集与推送"
echo "  → 5 数据源: GitHub Trending + Hacker News + InfoQ + 36氪 + 掘金"
echo "  → LLM 筛选: 18/42 条零售相关 (42.9%)"
echo "  → 推送目标: 零售技术雷达群 (23 订阅人)"
echo "  → 定时: 工作日 09:00 (GitHub Actions + WorkBuddy 自动化兜底)"
echo "  → 推送预览:"
cat <<'EOF'

  ┌────────────────────────────────────────────┐
  │ 📡 零售技术雷达 · 2026-07-01 周报            │
  │                                            │
  │ 🔴 新出现 (6)                              │
  │  · milvus-io/milvus 32.1k★                 │
  │    建议在「商品推荐」项目 PoC ...           │
  │  · Show HN: Open-source POS for retail     │
  │    对比我们自研 POS 性能 vs 维护成本 ...    │
  │                                            │
  │ 🟠 持续关注 (8)                            │
  │  · Redis 8.0 正式发布 ...                  │
  │  · 字节跳动：十亿级电商库存架构演进         │
  │                                            │
  │ 🟢 已落地 (4)                              │
  │  · Redis 8.0 已灰度，P95 12ms 达标         │
  │  · Supabase 「会员系统」v2 开发周期 -60%    │
  └────────────────────────────────────────────┘

EOF
echo "  ✅ 推送完成 · 群内查看完整日报"
echo ""

# ====== 2. 选型对比 ======
echo "【2/3】多方案选型对比（Redis vs DragonflyDB vs KeyDB）"
echo "  → 维度: 功能 / 性能 / 社区 / License / 兼容性"
echo "  → 权重: 25% / 30% / 15% / 10% / 20%"
echo "  → 综合得分:"
cat <<'EOF'

  ┌────────────────────────────────────────────┐
  │ 排名  方案          得分   结论              │
  │  ①   DragonflyDB   88     ✅ 推荐           │
  │  ②   Redis 8.0     82     ⚠️ 备选（兼容兜底）│
  │  ③   KeyDB         78     ⚠️ 备选（社区下滑）│
  └────────────────────────────────────────────┘

EOF
echo "  → POC 建议:"
echo "    · 场景: 购物车高频读写 (QPS 8 万) + 大促秒杀"
echo "    · 规模: 3 节点集群，影子流量 1 周"
echo "    · 工期: 2 周（基础架构 + 电商中台联合）"
echo "    · 风险: 中 · 保留 Redis 主从作为回滚"
echo "  ✅ ADR-003 已自动生成到 docs/adr/，待架构师 review"
echo ""

# ====== 3. 知识资产生成 ======
echo "【3/3】代码库扫描生成知识资产"
echo "  → 扫描: retail-platform (24.6 万行 · 47 模块 · 312 依赖)"
echo "  → 耗时: 4 分 23 秒"
echo "  → 三件套输出:"
cat <<'EOF'

  ┌────────────────────────────────────────────┐
  │ ① 架构图 (Mermaid 4 层架构)               │
  │    接入层 → 网关层 → 业务层 → 能力层 → 数据层│
  │                                            │
  │ ② ADR 决策记录 (3 个核心决策)              │
  │    ADR-001 微服务拆分 (Accepted 2024-08)   │
  │    ADR-002 Redis 8.0 向量化 (Accepted 03)  │
  │    ADR-003 ES 9.x 升级 (Proposed 06)      │
  │                                            │
  │ ③ 新人 Onboarding 指南                     │
  │    0 分钟: 环境准备                        │
  │    10 分钟: 跑通 order-service             │
  │    30 分钟: 读架构图 + ADR + 1 个 PR       │
  │    1 周: 提交第 1 个 PR + 周会 review      │
  └────────────────────────────────────────────┘

EOF
echo "  → 同步: 乐享知识库「retail-platform」目录"
echo "  → 通知: @所有成员 邮件订阅"
echo "  ✅ 知识资产已就绪"
echo ""

echo "==================================="
echo "  全部完成 · 打开 3 个 demo 查看效果"
echo "==================================="
echo ""
echo "  1. 技术动态大屏:    open tech-pulse.html"
echo "  2. 选型对比矩阵:    open decision-matrix.html"
echo "  3. 知识资产展示:    open onboarding.html"
echo ""
echo "  GitHub Pages 链接:"
echo "    https://srworkbuddy.github.io/techpulse/tech-pulse.html"
echo "    https://srworkbuddy.github.io/techpulse/decision-matrix.html"
echo "    https://srworkbuddy.github.io/techpulse/onboarding.html"
