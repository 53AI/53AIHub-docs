#!/bin/bash

# 自动将docs.json导航tabs转换为VitePress config.mts
# 依赖: jq
set -e

DOCS_JSON="./docs.json"
OUTPUT="./.vitepress/config.mts"

if ! command -v jq &> /dev/null; then
  echo "❌ jq未安装，请先安装 jq" >&2
  exit 1
fi
if [ ! -f "$DOCS_JSON" ]; then
  echo "❌ 未找到 $DOCS_JSON" >&2
  exit 1
fi

echo "🔄 解析docs.json..."

# 生成nav
NAV=$(jq -c '
.navigation.tabs | map({
  text: .tab,
  link: (if .tab == "53AI Hub" then "/" else if .tab == "53AI Studio" then "/studio/" else if .tab == "53AI KM" then "/km/" else "/" end end end),
  activeMatch: (if .tab == "53AI Hub" then "^/(?!studio|km)" else if .tab == "53AI Studio" then "^/studio/" else if .tab == "53AI KM" then "^/km/" else "^/" end end end)
})
' "$DOCS_JSON")

# 生成sidebar，一级分组collapsed: false，二级分组collapsed: true
SIDEBAR=$(jq -c '
.navigation.tabs | map({
  (if .tab == "53AI Hub" then "/" else if .tab == "53AI Studio" then "/studio/" else if .tab == "53AI KM" then "/km/" else "/" end end end):
    (.groups | map({
      text: .group,
      collapsible: true,
      collapsed: false,
      items: (
        .pages | map(
          if type == "string" then
            { text: (. | split("/") | last | gsub(".md$"; "")), link: . }
          else
            { text: .group, collapsible: true, collapsed: true, items: (.pages | map({ text: (. | split("/") | last | gsub(".md$"; "")), link: . })) }
          end
        )
      )
    }))
}) | add
' "$DOCS_JSON")

# 读取标题
TITLE=$(jq -r '.name // "53AI"' "$DOCS_JSON")

echo "✅ 生成nav和sidebar"

# 输出config.mts
cat > "$OUTPUT" <<EOF
import { defineConfig } from 'vitepress'

// https://vitepress.dev/reference/site-config
// 此文件由 convert-config.sh 自动生成，请勿手动修改
export default defineConfig({
  lang: 'zh',
  title: " ",
  description: "53AI知识库",
  srcDir: '.',
//  locales: {
//    root: {
//      label: '中文',
//      lang: 'zh',
//    },
//    en: {
//      label: 'English',
//      lang: 'en',
//      link: '/en',
//    }
//  },
  ignoreDeadLinks: [
    // 忽略所有包含 "localhost" 的链接
    /localhost/,
    /127.0.0.1/,
    /192.168.1/,
    // 或精确忽略特定链接
    "http://localhost:3000"
  ],
  themeConfig: {
    logo: '/logo/light.svg', 
    darkLogo: '/logo/dark.svg',
    head: [
      // 声明默认 Favicon（浏览器标签栏图标）
      {
        rel: 'icon',
        type: 'image/svg+xml',  // .svg 格式用此类型
        href: '/favicon.svg'
      },
      // 百度统计
      {
        script: [
          'var _hmt = _hmt || [];',
          '(function() {',
          '  var hm = document.createElement("script");',
          '  hm.src = "https://hm.baidu.com/hm.js?2909a807282d29537229722a2ac6b45e";',
          '  var s = document.getElementsByTagName("script")[0];',
          '  s.parentNode.insertBefore(hm, s);',
          '})();'
        ]
      }
    ],
    nav: $NAV,
    sidebar: $SIDEBAR,
    search: {
      provider: 'local',
      locales: {
        locales: {
          zh: {
            translations: {
              button: {
                buttonText: '搜索文档',
                buttonAriaLabel: '搜索文档'
              },
              modal: {
                noResultsText: '无法找到相关结果',
                resetButtonTitle: '清除查询条件',
                footer: {
                  selectText: '选择',
                  navigateText: '切换'
                }
              }
            }
          }
        }
      }
    },
    socialLinks: [
      { icon: 'github', link: 'https://github.com/53AI/53AIHub' }
    ]
  }
})
EOF

echo "🎉 config.mts已生成: $OUTPUT"
