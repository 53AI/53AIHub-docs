![53AIHub](https://oss.ibos.cn/53ai/common/53AIHub_banner.png)

<div>
<a href="https://hub.53ai.com">云服务</a> ·
<a href="https://hub.53ai.com/">独立部署</a> ·
<a href="https://docs.53ai.com/53AIHub">产品文档</a> ·
<a href="https://langgpt.53ai.com">演示站</a>

</div>

**53AIHub** 是一款开源的AI门户，零门槛实现对智能体、提示词与AI工具的发布与运营，让你快速搭建生产级的AI门户。它实现了无缝对接字节扣子、腾讯元器、Dify、FastGPT、53AI Studio等智能体开发平台和阿里百炼、火山引擎、百度千帆等MaaS平台。

以下是其核心功能列表： </br> </br>

**1. 平台接入**:
主流的智能体开发平台、云计算平台、大模型平台的接入。

**2. 应用管理**:
支持智能体、提示词、AI工具的发布、管理、分组、排序、使用权限等设置。

**3. 用户订阅**:
设置不同级别的订阅权限及订阅价格。

**4. 用户运营**:
支持注册用户、内部用户两类用户的运营，可以管理和查看用户登录、使用记录。

**5. 数据分析**:
支持从用户、分组、部门、平台四个维度进行数据分析。

**6. 独立域名**:
上传https证书后，支持绑定独立域名。

**7. 自定义界面**:
可选择站点模板及风格，并进行自定义界面。

## 功能比较

<table style="width:100%;">
  <tr>
    <th align="center">功能</th>
    <th align="center">53AI Hub</th>
    <th align="center">NextChat</th>
    <th align="center">lobehub</th>
    <th align="center">Cherry Studio</th>
  </tr>
  <tr>
    <td align="center">自定义界面</td>
    <td align="center">多风格及样式</td>
    <td align="center">固定风格</td>
    <td align="center">固定风格</td>
    <td align="center">固定风格</td>
  </tr>
  <tr>
    <td align="center">使用权限</td>
    <td align="center">企业级权限</td>
    <td align="center">无</td>
    <td align="center">无</td>
    <td align="center">无</td>
  </tr>
  <tr>
    <td align="center">智能体接入</td>
    <td align="center">✅</td>
    <td align="center">❌</td>
    <td align="center">❌</td>
    <td align="center">❌</td>
  </tr>
  <tr>
    <td align="center">大模型接入</td>
    <td align="center">✅</td>
    <td align="center">✅</td>
    <td align="center">✅</td>
    <td align="center">✅</td>
  </tr>
  <tr>
    <td align="center">注册用户</td>
    <td align="center">✅</td>
    <td align="center">✅</td>
    <td align="center">✅</td>
    <td align="center">✅</td>
  </tr>
  <tr>
    <td align="center">内部用户</td>
    <td align="center">✅</td>
    <td align="center">❌</td>
    <td align="center">❌</td>
    <td align="center">❌</td>
  </tr>
  <tr>
    <td align="center">单点登录</td>
    <td align="center">企微、钉钉、飞书</td>
    <td align="center">❌</td>
    <td align="center">❌</td>
    <td align="center">❌</td>
  </tr>
  <tr>
    <td align="center">本地部署</td>
    <td align="center">✅</td>
    <td align="center">✅</td>
    <td align="center">✅</td>
    <td align="center">✅</td>
  </tr>
</table>

## 使用 53AI Hub

* **云服务 </br>**
  我们提供[ 53AI Hub 云服务](https://hub.53ai.com)，用户可以在线申请开通。云服务包含免费版、标准版和企业版，企业版提供了53AI Hub的全部功能，在免费版本中支持接入10个智能体及100个注册用户。
* **社区版</br>**
  人员规模小于200人或营业收入低于5000万的中小企业和创业团队可以将免费使用社区版
  使用这个[入门指南](#快速启动)快速在您自己的服务器上运行 53AI Hub。
  阅读这个[产品文档](https://docs.53ai.com)进行进一步的参考和更深入的了解。
* **旗舰版</br>**
  我们提供可以私有化部署且打通企微、钉钉、飞书组织架构的旗舰版，如果您需要个性化定制功能。可以给我们发送[电子邮件](mailto\:hub@53ai.com?subject=\[GitHub]商业授权)讨论你企业的个性化需求。 </br>

## 保持领先

在 GitHub 上给 53AI Hub Star，我们更新产品你将第一时间收到新版本更新的通知。

## 安装社区版

### 系统要求

在安装 53AI Hub 之前，请确保您的服务器满足以下最低系统要求：

* CPU >= 1 Core
* RAM >= 2 GiB

### 快速启动

启动 53AI Hub 服务器的最简单方法是运行我们的 [docker-compose.yml](docker/docker-compose.yaml) 文件。在运行安装命令之前，请确保您的机器上安装了 [Docker](https://docs.docker.com/get-docker/) 和 [Docker Compose](https://docs.docker.com/compose/install/)：

```bash
cd docker
cp .env.example .env
docker compose up -d
```

运行后，可以在浏览器上访问 [`http://localhost:3000`](http://localhost:3000) 进入 53AI Hub 站点后台并开始初始化安装操作。

### 自定义配置

如果您需要自定义配置，请参考 `.env.example`文件中的注释，复制一个改名为 `.env`并更新文件中对应的值。
此外，您可能需要根据您的具体部署环境和需求对 `docker-compose.yaml`文件本身进行调整，例如更改镜像版本、端口映射或卷挂载。完成任何更改后，请重新运行 `docker-compose up -d`。您可以在此处找到可用环境变量的完整列表。

## Contributing

对于那些想要贡献代码的人，请参阅我们的贡献指南。
同时，请考虑通过社交媒体、活动和会议来支持 53AI Hub 的分享。

> 我们正在寻找贡献者来帮助将 53AI Hub 翻译成除了中文和英文之外的其他语言。如果您有兴趣帮助，请通过微信社群联系我们。

## 社区与支持

我们欢迎您为 53AI 做出贡献，以帮助改善 53AI。包括：提交代码、问题、新想法，或分享您基于 53AI 创建的有趣且有用的 AI 应用程序。同时，我们也欢迎您在不同的活动、会议和社交媒体上分享 53AI。

* [Github Discussion](https://github.com/53ai/53aihub/discussions)👉：分享您的应用程序并与社区交流。
* [GitHub Issues](https://github.com/53ai/53aihub/issues)👉：使用 53AI Hub 时遇到的错误和问题，请参阅[贡献指南](CONTRIBUTING.md)。
* [邮件支持](mailto\:hello@53ai.com?subject=\[GitHub]Questions)👉：关于使用 53AI Hub 的问题。
* [Discord](https://discord.gg/FngNHpbcY7)👉：分享您的应用程序并与社区交流。
* 微信社群👉：分享您的 AI 门户并与社区交流。
* [商业许可](mailto\:business@53ai.com?subject=\[GitHub]Business%20License%20Inquiry)。👉：有关商业用途许可 53AI 的商业咨询。

## 合规认证

53AI 已获取以下认证：

* **ISO/IEC 27001:2022  Certification**
* **ISO 9001:2015**

## 安全问题

为了保护您的隐私，请避免在 GitHub 上发布安全问题。发送问题至 <security@53ai.com>，我们将为您做更细致的解答。

## License

本仓库遵循 [53AI Open Source License](LICENSE) 开源协议，该许可证本质上是 Apache 2.0，但有一些额外的限制。
