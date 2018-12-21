Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:53265 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731785AbeLUDM6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Dec 2018 22:12:58 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/3] firmware: remove unnecessary patterns in .gitignore
Date: Fri, 21 Dec 2018 12:12:40 +0900
Message-Id: <1545361961-31990-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1545361961-31990-1-git-send-email-yamada.masahiro@socionext.com>
References: <1545361961-31990-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Commit df85b2d767aa ("firmware: Restore support for built-in firmware")
should not have restored this .gitignore blindly.

What git should ignore is merely *.gen.S now.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 firmware/.gitignore | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/firmware/.gitignore b/firmware/.gitignore
index d9c6901..9c8bdb9 100644
--- a/firmware/.gitignore
+++ b/firmware/.gitignore
@@ -1,6 +1 @@
 *.gen.S
-*.fw
-*.bin
-*.csp
-*.dsp
-ihex2fw
-- 
2.7.4
