Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:36645 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726536AbeLKLBl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Dec 2018 06:01:41 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 15/27] kconfig: remove redundant token defines
Date: Tue, 11 Dec 2018 20:00:58 +0900
Message-Id: <1544526070-16690-16-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1544526070-16690-1-git-send-email-yamada.masahiro@socionext.com>
References: <1544526070-16690-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ulf Magnusson <ulfalizer@gmail.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>

These are already defined as %left.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/zconf.y | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/scripts/kconfig/zconf.y b/scripts/kconfig/zconf.y
index 7a4bc58..020454b 100644
--- a/scripts/kconfig/zconf.y
+++ b/scripts/kconfig/zconf.y
@@ -69,11 +69,6 @@ static struct menu *current_menu, *current_entry;
 %token <id>T_ON
 %token <string> T_WORD
 %token <string> T_WORD_QUOTE
-%token T_UNEQUAL
-%token T_LESS
-%token T_LESS_EQUAL
-%token T_GREATER
-%token T_GREATER_EQUAL
 %token T_CLOSE_PAREN
 %token T_OPEN_PAREN
 %token T_EOL
-- 
2.7.4
