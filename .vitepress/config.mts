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
  themeConfig: {
    logo: '/logo/light.svg', 
    darkLogo: '/logo/dark.svg',
    head: [
      // 声明默认 Favicon（浏览器标签栏图标）
      {
        rel: 'icon',
        type: 'image/svg+xml',  // .svg 格式用此类型
        href: '/favicon.svg'
      }
    ],
    nav: [{"text":"53AI Hub","link":"/","activeMatch":"^/(?!studio|km)"},{"text":"53AI Studio","link":"/studio/","activeMatch":"^/studio/"},{"text":"53AI KM","link":"/km/","activeMatch":"^/km/"}],
    sidebar: {"/":[{"text":"入门","collapsible":true,"collapsed":false,"items":[{"text":"欢迎使用","link":"/入门/欢迎使用"},{"text":"技术特性","link":"/入门/技术特性"},{"text":"云服务","link":"/入门/云服务"},{"text":"本地部署","link":"/入门/本地部署"},{"text":"开源许可协议","link":"/入门/开源许可协议"},{"text":"产品路线图","link":"/入门/产品路线图"}]},{"text":"手册","collapsible":true,"collapsed":false,"items":[{"text":"站点配置","collapsible":true,"collapsed":true,"items":[{"text":"站点信息","link":"/手册/站点配置/站点信息"},{"text":"平台接入","link":"/手册/站点配置/平台接入"},{"text":"支付配置","link":"/手册/站点配置/支付配置"},{"text":"站点域名","link":"/手册/站点配置/站点域名"},{"text":"三方统计","link":"/手册/站点配置/三方统计"}]},{"text":"应用管理","collapsible":true,"collapsed":true,"items":[{"text":"智能体","link":"/手册/应用管理/智能体"},{"text":"提示词","link":"/手册/应用管理/提示词"},{"text":"AI产品","link":"/手册/应用管理/AI产品"}]},{"text":"运营管理","collapsible":true,"collapsed":true,"items":[{"text":"订单数据","link":"/手册/运营管理/订单数据"},{"text":"注册用户","link":"/手册/运营管理/注册用户"},{"text":"订阅服务","link":"/手册/运营管理/订阅服务"},{"text":"管理员","link":"/手册/运营管理/管理员"}]},{"text":"站点装修","collapsible":true,"collapsed":true,"items":[{"text":"模板风格","link":"/手册/站点装修/模板风格"},{"text":"Banner图","link":"/手册/站点装修/Banner图"},{"text":"导航管理","link":"/手册/站点装修/导航管理"}]},{"text":"用户前台","collapsible":true,"collapsed":true,"items":[{"text":"用户使用","link":"/手册/用户前台/用户使用"}]}]},{"text":"开发","collapsible":true,"collapsed":false,"items":[{"text":"全站后端","link":"/开发/全站后端"},{"text":"用户侧前端","link":"/开发/用户侧前端"},{"text":"管理侧前端","link":"/开发/管理侧前端"}]},{"text":"社区","collapsible":true,"collapsed":false,"items":[{"text":"成为贡献者","link":"/社区/成为贡献者"},{"text":"为文档做出贡献","link":"/社区/为文档做出贡献"},{"text":"需求支持","link":"/社区/需求支持"}]},{"text":"联系","collapsible":true,"collapsed":false,"items":[{"text":"联系我们","link":"/联系/联系我们"}]}],"/studio/":[{"text":"入门","collapsible":true,"collapsed":false,"items":[{"text":"欢迎使用","link":"/studio/入门/欢迎使用"}]}],"/km/":[{"text":"入门","collapsible":true,"collapsed":false,"items":[{"text":"欢迎使用","link":"/km/入门/欢迎使用"}]}]},
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
