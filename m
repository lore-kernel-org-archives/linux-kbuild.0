Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:44692 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732360AbfAHTfr (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 8 Jan 2019 14:35:47 -0500
From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 3.18 10/19] kconfig: fix memory leak when EOF is encountered in quotation
Date: Tue,  8 Jan 2019 14:35:22 -0500
Message-Id: <20190108193534.124555-10-sashal@kernel.org>
In-Reply-To: <20190108193534.124555-1-sashal@kernel.org>
References: <20190108193534.124555-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Sasha Levin <sashal@kernel.org>, linux-kbuild@vger.kernel.org

From: Masahiro Yamada <yamada.masahiro@socionext.com>

[ Upstream commit fbac5977d81cb2b2b7e37b11c459055d9585273c ]

An unterminated string literal followed by new line is passed to the
parser (with "multi-line strings not supported" warning shown), then
handled properly there.

On the other hand, an unterminated string literal at end of file is
never passed to the parser, then results in memory leak.

[Test Code]

  ----------(Kconfig begin)----------
  source "Kconfig.inc"

  config A
          bool "a"
  -----------(Kconfig end)-----------

  --------(Kconfig.inc begin)--------
  config B
          bool "b\No new line at end of file
  ---------(Kconfig.inc end)---------

[Summary from Valgrind]

  Before the fix:

    LEAK SUMMARY:
       definitely lost: 16 bytes in 1 blocks
       ...

  After the fix:

    LEAK SUMMARY:
       definitely lost: 0 bytes in 0 blocks
       ...

Eliminate the memory leak path by handling this case. Of course, such
a Kconfig file is wrong already, so I will add an error message later.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 scripts/kconfig/zconf.l | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/kconfig/zconf.l b/scripts/kconfig/zconf.l
index 6c62d93b4ffb..485b19a461f8 100644
--- a/scripts/kconfig/zconf.l
+++ b/scripts/kconfig/zconf.l
@@ -180,6 +180,8 @@ n	[A-Za-z0-9_]
 	}
 	<<EOF>>	{
 		BEGIN(INITIAL);
+		yylval.string = text;
+		return T_WORD_QUOTE;
 	}
 }
 
-- 
2.19.1
