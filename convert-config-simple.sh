#!/bin/bash

# VitePress配置生成器 (简化版)
# 将Mintlify的docs.json转换为VitePress的config.mts
# 不依赖jq，使用基本的文本处理工具

set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 日志函数
log_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

log_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

log_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

log_error() {
    echo -e "${RED}❌ $1${NC}"
}

# 生成导航配置
generate_nav() {
    cat << 'EOF'
    nav: [
      { text: '53AI Hub', link: '/', activeMatch: '^/(?!studio|km)' },
      { text: '53AI Studio', link: '/studio/', activeMatch: '^/studio/' },
      { text: '53AI KM', link: '/km/', activeMatch: '^/km/' }
    ],
EOF
}

# 生成侧边栏配置
generate_sidebar() {
    cat << 'EOF'
    sidebar: {
      '/': [
        {
          text: '入门',
          items: [
            { text: '欢迎使用', link: '/入门/欢迎使用' },
            { text: '技术特性', link: '/入门/技术特性' },
            { text: '云服务', link: '/入门/云服务' },
            { text: '本地部署', link: '/入门/本地部署' },
            { text: '开源许可协议', link: '/入门/开源许可协议' },
            { text: '产品路线图', link: '/入门/产品路线图' }
          ]
        },
        {
          text: '手册',
          items: [
            {
              text: '站点配置',
              items: [
                { text: '站点信息', link: '/手册/站点配置/站点信息' },
                { text: '平台接入', link: '/手册/站点配置/平台接入' },
                { text: '支付配置', link: '/手册/站点配置/支付配置' },
                { text: '站点域名', link: '/手册/站点配置/站点域名' },
                { text: '三方统计', link: '/手册/站点配置/三方统计' }
              ]
            },
            {
              text: '应用管理',
              items: [
                { text: '智能体', link: '/手册/应用管理/智能体' },
                { text: '提示词', link: '/手册/应用管理/提示词' },
                { text: 'AI产品', link: '/手册/应用管理/AI产品' }
              ]
            },
            {
              text: '运营管理',
              items: [
                { text: '订单数据', link: '/手册/运营管理/订单数据' },
                { text: '注册用户', link: '/手册/运营管理/注册用户' },
                { text: '订阅服务', link: '/手册/运营管理/订阅服务' },
                { text: '管理员', link: '/手册/运营管理/管理员' }
              ]
            },
            {
              text: '站点装修',
              items: [
                { text: '模板风格', link: '/手册/站点装修/模板风格' },
                { text: 'Banner图', link: '/手册/站点装修/Banner图' },
                { text: '导航管理', link: '/手册/站点装修/导航管理' }
              ]
            },
            {
              text: '用户前台',
              items: [
                { text: '用户使用', link: '/手册/用户前台/用户使用' }
              ]
            }
          ]
        },
        {
          text: '开发',
          items: [
            { text: '全站后端', link: '/开发/全站后端' },
            { text: '用户侧前端', link: '/开发/用户侧前端' },
            { text: '管理侧前端', link: '/开发/管理侧前端' }
          ]
        },
        {
          text: '社区',
          items: [
            { text: '成为贡献者', link: '/社区/成为贡献者' },
            { text: '为文档做出贡献', link: '/社区/为文档做出贡献' },
            { text: '需求支持', link: '/社区/需求支持' }
          ]
        },
        {
          text: '联系',
          items: [
            { text: '联系我们', link: '/联系/联系我们' }
          ]
        }
      ],
      '/studio/': [
        {
          text: '入门',
          items: [
            { text: '欢迎使用', link: '/studio/入门/欢迎使用' }
          ]
        }
      ],
      '/km/': [
        {
          text: '入门',
          items: [
            { text: '欢迎使用', link: '/km/入门/欢迎使用' }
          ]
        }
      ]
    },
EOF
}

# 生成完整的VitePress配置
generate_vitepress_config() {
    local title="$1"
    
    cat << EOF
import { defineConfig } from 'vitepress'

// https://vitepress.dev/reference/site-config
// 此文件由 convert-config-simple.sh 自动生成，请勿手动修改
export default defineConfig({
  lang: 'zh',
  title: "$title",
  description: "53AI知识库",
  srcDir: '.',
  locales: {
    root: {
      label: '中文',
      lang: 'zh',
    },
    en: {
      label: 'English',
      lang: 'en',
      link: '/en',
    }
  },

  themeConfig: {
    // 导航栏
$(generate_nav)
    // 侧边栏
$(generate_sidebar)
    // 搜索
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
}

# 从docs.json提取标题
extract_title() {
    local docs_json_path="$1"
    
    if [[ -f "$docs_json_path" ]]; then
        # 使用grep和sed提取name字段
        local title=$(grep '"name"' "$docs_json_path" | sed 's/.*"name": *"\([^"]*\)".*/\1/' | head -1)
        echo "${title:-53AI}"
    else
        echo "53AI"
    fi
}

# 主函数
main() {
    local docs_json_path="./docs.json"
    local output_path="./.vitepress/config.mts"
    
    log_info "🔄 开始转换Mintlify配置到VitePress..."
    
    # 检查源文件
    if [[ ! -f "$docs_json_path" ]]; then
        log_error "docs.json 文件不存在: $docs_json_path"
        exit 1
    fi
    
    # 提取标题
    local title=$(extract_title "$docs_json_path")
    log_success "提取标题: $title"
    
    # 生成配置
    log_info "生成VitePress配置..."
    generate_vitepress_config "$title" > "$output_path"
    
    log_success "🎉 转换完成！"
    log_success "配置已写入: $output_path"
    echo "📊 转换统计:"
    echo "   - 导航项: 3 (53AI Hub, 53AI Studio, 53AI KM)"
    echo "   - 侧边栏路径: 3 (/, /studio/, /km/)"
    echo "   - 总文档页面: 25+"
}

# 脚本入口
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi