Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:53264 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388689AbeLUDM6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Dec 2018 22:12:58 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/3] scripts: remove unnecessary ihex2fw and check-lc_ctypes from .gitignore
Date: Fri, 21 Dec 2018 12:12:39 +0900
Message-Id: <1545361961-31990-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Commit c512d2544c68 ("gitignore: ignore scripts/ihex2fw") was unneeded
because ihex2fw was generated in firmware/ instead of scripts/ at
that time. I guess it was accidentally added because ihex2fw.c was
pushed back and forth between those two directories according to
8b249b6856f1 ("fix modules_install via NFS") and 556b0f58bbcd (Revert
"fix modules_install via NFS"). Of course, you may cross file-moves
during git-bisect, but we do not generally add removed binaries to
the .gitignore file.

check-lc_ctype was removed by commit cb43fb5775df ("docs: remove
DocBook from the building system").

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/.gitignore | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/.gitignore b/scripts/.gitignore
index 12d302d..17f8cef 100644
--- a/scripts/.gitignore
+++ b/scripts/.gitignore
@@ -6,9 +6,7 @@ conmakehash
 kallsyms
 pnmtologo
 unifdef
-ihex2fw
 recordmcount
-check-lc_ctype
 sortextable
 asn1_compiler
 extract-cert
-- 
2.7.4
