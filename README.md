<div align="center">
  <a href="https://www.53ai.com/products/53AIHub"><img alt="Product Introduction Page" src="https://oss.ibos.cn/53ai/common/53AIHub_banner.png"></a>
</div>

<div align="center">
<a href="./README.md"><img alt="README in English" src="https://img.shields.io/badge/English-d9d9d9"></a>
<a href="./README_CN.md"><img alt="Simplified Chinese README" src="https://img.shields.io/badge/简体中文-d9d9d9"></a>
<a href="./README_JA.md"><img alt="Japanese README" src="https://img.shields.io/badge/日本語-d9d9d9"></a>
</div>

<div>
<a href="https://hub.53ai.com">Cloud Service</a> ·
<a href="https://docs.53ai.com/%E5%85%A5%E9%97%A8/%E6%9C%AC%E5%9C%B0%E9%83%A8%E7%BD%B2">Local Deployment</a> ·
<a href="https://docs.53ai.com/">Documentation</a> ·
<a href="https://aihub.53ai.com">Demo Site</a>
</div>

**53AI Hub** is an **open-source AI portal**. It enables you to quickly build a production-level AI portal to publish and operate AI agents, prompts, and AI tools. It supports seamless integration with development platforms like **Coze, Dify, FastGPT, RAGFlow, and 53AI Studio**, and cloud platforms such as **Aliyun , Tencent Cloud , and Baidu Cloud**, helping developers and enterprises build production-ready AI portals without complex integrations. Even users with no technical background can participate easily, significantly lowering the barrier to AI adoption.

Key features include:

**1. Platform Integration**:
Connect with mainstream AI agent development platforms, cloud platforms, and LLM platforms. Choose from site templates and styles, and customize the interface.

**2. Application Management**:
Manage and publish AI agents, prompts, and tools. Set up grouping, sorting, and access permissions.

**3. User Operations**:
Operate both registered and internal users, view login and usage logs.

**4. Independent Deployment**:
Supports one-click deployment on both cloud and local environments, and binding to a custom domain name.

## Product Comparison


| Feature            | 53AI Hub                | NextChat    | lobehub     | Cherry Studio |
| ------------------ | ----------------------- | ----------- | ----------- | ------------- |
| Custom Interface   | Multiple styles         | Fixed style | Fixed style | Fixed style   |
| Access Permissions | Enterprise-grade        | None        | None        | None          |
| Agent Integration  | ✅                      | ❌          | ❌          | ❌            |
| LLM Integration    | ✅                      | ✅          | ✅          | ✅            |
| Registered Users   | ✅                      | ✅          | ✅          | ✅            |
| Internal Users     | ✅                      | ❌          | ❌          | ❌            |
| SSO Support        | WeCom, DingTalk, Feishu | ❌          | ❌          | ❌            |
| Local Deployment   | ✅                      | ✅          | ✅          | ✅            |

## Usage

* **Cloud Service**
  Visit [53AI Hub Cloud Service](https://hub.53ai.com) to apply. The cloud service includes Free, Standard, and Enterprise editions. The Enterprise version offers all features, and the Free version supports 10 agents and 100 registered users.
* **Community Open Source Edition**
  Refer to our [Getting Started Guide](https://docs.53ai.com/%E5%85%A5%E9%97%A8/%E6%AC%A2%E8%BF%8E%E4%BD%BF%E7%94%A8) for quick local deployment and our [Documentation](https://docs.53ai.com) for in-depth usage.
* **Enterprise Customized Edition**
  We offer enterprise custom versions with features like integration with WeCom, DingTalk, and Feishu org structures. For custom needs, contact us via [email](mailto:hub@53ai.com?subject=[GitHub]Customization).

## Installing the Community Edition

### System Requirements

Minimum configuration for installing 53AI Hub:

* CPU ≥ 1 Core
* RAM ≥ 2 GiB

### Quick Installation

The easiest way to install the community edition is by using our [docker-compose.yml](docker/docker-compose.yaml). Make sure Docker and Docker Compose are installed:

```bash
cd docker
cp .env.example .env
docker compose up -d
```

Then visit [`http://localhost`](http://localhost) to access the admin panel and begin setup.

### Custom Configuration

Refer to the comments in `.env.example`, copy and rename it to `.env`, and edit the values. You may also modify `docker-compose.yaml` for things like image versions, port mappings, or volume mounts. After changes, rerun `docker-compose up -d`.

## Contributing

> We're seeking contributors to help translate 53AI Hub into more languages. Interested? Get in touch!

We welcome your contributions—whether code, ideas, or issues. Feel free to share 53AI Hub at events, in talks, or on social media.

* [GitHub Discussion](https://github.com/53ai/53aihub/discussions): Share your apps and ideas with the community.
* [GitHub Issues](https://github.com/53ai/53aihub/issues): Report bugs or problems.

## Compliance Certifications

53AI has obtained the following certifications:

* **ISO/IEC 27001:2022 – Information Security Management Systems**
* **ISO 9001:2015 – Quality Management Systems**

## License

This repository is licensed under the [53AI Open Source License](https://docs.53ai.com/%E5%85%A5%E9%97%A8/%E5%BC%80%E6%BA%90%E8%AE%B8%E5%8F%AF%E5%8D%8F%E8%AE%AE), which is based on Apache 2.0 with additional restrictions.

## Follow Us

Star 53AI Hub on GitHub to get notified about updates and new releases.
