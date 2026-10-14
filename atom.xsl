<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:atom="http://www.w3.org/2005/Atom">
  <xsl:output method="html" encoding="utf-8" indent="yes"/>

  <xsl:template match="/">
    <html lang="zh-CN">
      <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title><xsl:value-of select="atom:feed/atom:title"/> · RSS</title>
        <link rel="icon" href="/img/bg/ely.png"/>
        <style>
          :root {
            --bg: #f7f7f8;
            --card: #ffffff;
            --fg: #21232a;
            --muted: #6b7280;
            --line: #e5e7eb;
            --accent: #ee6a5f;
          }
          @media (prefers-color-scheme: dark) {
            :root {
              --bg: #1a1b1e;
              --card: #25262b;
              --fg: #e6e6e6;
              --muted: #9ca3af;
              --line: #35363c;
            }
          }
          * { box-sizing: border-box; }
          body {
            margin: 0;
            padding: 2rem 1rem 4rem;
            background: var(--bg);
            color: var(--fg);
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI",
                         "PingFang SC", "Hiragino Sans GB", "Microsoft YaHei",
                         Roboto, Helvetica, Arial, sans-serif;
            line-height: 1.7;
          }
          .wrap { max-width: 760px; margin: 0 auto; }
          .note {
            background: var(--card);
            border: 1px solid var(--line);
            border-left: 3px solid var(--accent);
            border-radius: 6px;
            padding: .9rem 1.1rem;
            font-size: .9rem;
            color: var(--muted);
            margin-bottom: 2rem;
          }
          .note code {
            background: rgba(128, 128, 128, .16);
            padding: .1rem .35rem;
            border-radius: 3px;
            font-size: .86em;
            word-break: break-all;
          }
          header { border-bottom: 1px solid var(--line); padding-bottom: 1.25rem; margin-bottom: 1.5rem; }
          h1 { font-size: 1.7rem; margin: 0 0 .4rem; }
          h1 a { color: var(--fg); text-decoration: none; }
          h1 a:hover { color: var(--accent); }
          .sub { color: var(--muted); margin: 0; font-size: .95rem; }
          .entry {
            background: var(--card);
            border: 1px solid var(--line);
            border-radius: 8px;
            padding: 1.1rem 1.3rem;
            margin-bottom: 1rem;
          }
          .entry h2 { font-size: 1.12rem; margin: 0 0 .3rem; }
          .entry h2 a { color: var(--fg); text-decoration: none; }
          .entry h2 a:hover { color: var(--accent); }
          .date { color: var(--muted); font-size: .82rem; margin: 0 0 .5rem; }
          .summary { color: var(--muted); font-size: .93rem; }
          .summary blockquote {
            margin: 0;
            padding-left: .9rem;
            border-left: 2px solid var(--line);
          }
          .summary p { margin: .3rem 0; }
          .cats { margin-top: .6rem; }
          .cats span {
            display: inline-block;
            font-size: .75rem;
            color: var(--muted);
            border: 1px solid var(--line);
            border-radius: 999px;
            padding: .05rem .6rem;
            margin-right: .35rem;
          }
          footer { margin-top: 2rem; text-align: center; color: var(--muted); font-size: .85rem; }
          footer a { color: var(--accent); }
        </style>
      </head>
      <body>
        <div class="wrap">
          <div class="note">
            这是一个 <strong>RSS 订阅源</strong>，不是普通网页。把本页地址
            <code><xsl:value-of select="atom:feed/atom:link[@rel='self']/@href"/></code>
            复制到 RSS 阅读器即可订阅更新。
          </div>

          <header>
            <h1>
              <a href="{atom:feed/atom:link[not(@rel)]/@href}">
                <xsl:value-of select="atom:feed/atom:title"/>
              </a>
            </h1>
            <p class="sub"><xsl:value-of select="atom:feed/atom:subtitle"/></p>
          </header>

          <xsl:for-each select="atom:feed/atom:entry">
            <div class="entry">
              <h2>
                <a href="{atom:link/@href}">
                  <xsl:value-of select="atom:title"/>
                </a>
              </h2>
              <p class="date"><xsl:value-of select="substring(atom:published, 1, 10)"/></p>
              <xsl:if test="atom:summary">
                <div class="summary">
                  <xsl:value-of select="atom:summary" disable-output-escaping="yes"/>
                </div>
              </xsl:if>
              <xsl:if test="atom:category">
                <div class="cats">
                  <xsl:for-each select="atom:category">
                    <span><xsl:value-of select="@term"/></span>
                  </xsl:for-each>
                </div>
              </xsl:if>
            </div>
          </xsl:for-each>

          <footer>
            <a href="{atom:feed/atom:link[not(@rel)]/@href}">返回首页</a>
          </footer>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
