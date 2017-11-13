Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:27616 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752307AbdKMKnK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Nov 2017 05:43:10 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] frv: .gitignore: ignore vmlinux.lds
Date: Mon, 13 Nov 2017 19:43:00 +0900
Message-Id: <1510569780-28332-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/frv/kernel/.gitignore | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 arch/frv/kernel/.gitignore

diff --git a/arch/frv/kernel/.gitignore b/arch/frv/kernel/.gitignore
new file mode 100644
index 0000000..c5f676c
--- /dev/null
+++ b/arch/frv/kernel/.gitignore
@@ -0,0 +1 @@
+vmlinux.lds
-- 
2.7.4

