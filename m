Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:18674 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730454AbfILLpQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Sep 2019 07:45:16 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] genksyms: convert to SPDX License Identifier for lex.l and parse.y
Date: Thu, 12 Sep 2019 20:45:07 +0900
Message-Id: <20190912114507.6699-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

I used the C comment style (/* ... */) for the flex and bison files
as in Kconfig (scripts/kconfig/{lexer.l,parser.y})

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/genksyms/lex.l   | 32 ++++++++++----------------------
 scripts/genksyms/parse.y | 32 ++++++++++----------------------
 2 files changed, 20 insertions(+), 44 deletions(-)

diff --git a/scripts/genksyms/lex.l b/scripts/genksyms/lex.l
index d29c774f51b6..e265c5d96861 100644
--- a/scripts/genksyms/lex.l
+++ b/scripts/genksyms/lex.l
@@ -1,25 +1,13 @@
-/* Lexical analysis for genksyms.
-   Copyright 1996, 1997 Linux International.
-
-   New implementation contributed by Richard Henderson <rth@tamu.edu>
-   Based on original work by Bjorn Ekwall <bj0rn@blox.se>
-
-   Taken from Linux modutils 2.4.22.
-
-   This program is free software; you can redistribute it and/or modify it
-   under the terms of the GNU General Public License as published by the
-   Free Software Foundation; either version 2 of the License, or (at your
-   option) any later version.
-
-   This program is distributed in the hope that it will be useful, but
-   WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-   General Public License for more details.
-
-   You should have received a copy of the GNU General Public License
-   along with this program; if not, write to the Free Software Foundation,
-   Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.  */
-
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Lexical analysis for genksyms.
+ * Copyright 1996, 1997 Linux International.
+ *
+ * New implementation contributed by Richard Henderson <rth@tamu.edu>
+ * Based on original work by Bjorn Ekwall <bj0rn@blox.se>
+ *
+ * Taken from Linux modutils 2.4.22.
+ */
 
 %{
 
diff --git a/scripts/genksyms/parse.y b/scripts/genksyms/parse.y
index 1ebcf52cd0f9..e22b42245bcc 100644
--- a/scripts/genksyms/parse.y
+++ b/scripts/genksyms/parse.y
@@ -1,25 +1,13 @@
-/* C global declaration parser for genksyms.
-   Copyright 1996, 1997 Linux International.
-
-   New implementation contributed by Richard Henderson <rth@tamu.edu>
-   Based on original work by Bjorn Ekwall <bj0rn@blox.se>
-
-   This file is part of the Linux modutils.
-
-   This program is free software; you can redistribute it and/or modify it
-   under the terms of the GNU General Public License as published by the
-   Free Software Foundation; either version 2 of the License, or (at your
-   option) any later version.
-
-   This program is distributed in the hope that it will be useful, but
-   WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-   General Public License for more details.
-
-   You should have received a copy of the GNU General Public License
-   along with this program; if not, write to the Free Software Foundation,
-   Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.  */
-
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * C global declaration parser for genksyms.
+ * Copyright 1996, 1997 Linux International.
+ *
+ * New implementation contributed by Richard Henderson <rth@tamu.edu>
+ * Based on original work by Bjorn Ekwall <bj0rn@blox.se>
+ *
+ * This file is part of the Linux modutils.
+ */
 
 %{
 
-- 
2.17.1
