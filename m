Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f196.google.com ([209.85.214.196]:37177 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727208AbfLIIT2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Dec 2019 03:19:28 -0500
From: Thomas Hebb <tommyhebb@gmail.com>
Subject: [PATCH 2/4] kconfig: don't crash on NULL expressions in expr_eq()
Date: Mon,  9 Dec 2019 00:19:17 -0800
Message-Id: <2f42719235f9250ed10209982543f99f4fd41d61.1575879069.git.tommyhebb@gmail.com>
In-Reply-To: <cover.1575879069.git.tommyhebb@gmail.com>
References: <cover.1575879069.git.tommyhebb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: Thomas Hebb <tommyhebb@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>

NULL expressions are taken to always be true, as implemented by the
expr_is_yes() macro and by several other functions in expr.c. As such,
they ought to be valid inputs to expr_eq(), which compares two
expressions.

Signed-off-by: Thomas Hebb <tommyhebb@gmail.com>
---
 scripts/kconfig/expr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index 77ffff3a053c..8284444cc3fa 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -254,6 +254,11 @@ static int expr_eq(struct expr *e1, struct expr *e2)
 {
 	int res, old_count;
 
+	/* A NULL expr is taken to be yes, but there's also a different way to
+	 * represent yes. expr_is_yes() checks for either representation. */
+	if (!e1 || !e2)
+		return expr_is_yes(e1) && expr_is_yes(e2);
+
 	if (e1->type != e2->type)
 		return 0;
 	switch (e1->type) {
-- 
2.24.0
