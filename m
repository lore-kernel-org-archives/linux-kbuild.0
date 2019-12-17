Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:29448 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726141AbfLQLwc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Dec 2019 06:52:32 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kconfig: remove ---help--- from documentation
Date: Tue, 17 Dec 2019 20:51:51 +0900
Message-Id: <20191217115151.12465-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ulf Magnusson <ulfalizer@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

Commit 84af7a6194e4 ("checkpatch: kconfig: prefer 'help' over
'---help---'"), scripts/checkpatch.pl warns the use of ---help---.

This still exists, but new code should avoid using it.
Let's stop advertising it in documentation.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/kconfig-language.rst | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
index 74bef19f69f0..231e6a64957f 100644
--- a/Documentation/kbuild/kconfig-language.rst
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -196,14 +196,11 @@ applicable everywhere (see syntax).
   or equal to the first symbol and smaller than or equal to the second
   symbol.
 
-- help text: "help" or "---help---"
+- help text: "help"
 
   This defines a help text. The end of the help text is determined by
   the indentation level, this means it ends at the first line which has
   a smaller indentation than the first line of the help text.
-  "---help---" and "help" do not differ in behaviour, "---help---" is
-  used to help visually separate configuration logic from help within
-  the file as an aid to developers.
 
 - misc options: "option" <symbol>[=<value>]
 
-- 
2.17.1
