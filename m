Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:38303 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727768AbgEQJtf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 May 2020 05:49:35 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 05/29] modpost: re-add warning about missing *.mod file
Date: Sun, 17 May 2020 18:48:35 +0900
Message-Id: <20200517094859.2376211-6-masahiroy@kernel.org>
In-Reply-To: <20200517094859.2376211-1-masahiroy@kernel.org>
References: <20200517094859.2376211-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Jessica Yu <jeyu@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

This reverts 4be40e22233c ("kbuild: do not emit src version warning for
non-modules").

I do not fully understand what that commit addressed, but commit
91341d4b2c19 ("kbuild: introduce new option to enhance section mismatch
analysis") introduced partial section checks by using modpost. built-in.o
was parsed by modpost. Even modules had a problem because *.mod files
were created after the modpost check.

Commit b7dca6dd1e59 ("kbuild: create *.mod with full directory path and
remove MODVERDIR") stopped doing that. Now that modpost is only invoked
after the directory descend, *.mod files should always exist at the
modpost stage. If not, something went wrong, which should be warned.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/sumversion.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/mod/sumversion.c b/scripts/mod/sumversion.c
index f9aa532d93cf..f9df0b1863f1 100644
--- a/scripts/mod/sumversion.c
+++ b/scripts/mod/sumversion.c
@@ -402,9 +402,11 @@ void get_src_version(const char *modname, char sum[], unsigned sumlen)
 		 (int)strlen(modname) - 1, modname);
 
 	buf = read_text_file(filelist);
-	if (!buf)
-		/* not a module or .mod file missing - ignore */
+	if (!buf) {
+		warn("failed to open %s. cannot calculate checksum\n",
+		     filelist);
 		return;
+	}
 
 	pos = buf;
 	firstline = get_line(&pos);
-- 
2.25.1
