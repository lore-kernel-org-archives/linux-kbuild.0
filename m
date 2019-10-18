Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f74.google.com ([209.85.221.74]:56913 "EHLO
        mail-wr1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395294AbfJRJb6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Oct 2019 05:31:58 -0400
Received: by mail-wr1-f74.google.com with SMTP id s9so2310573wrw.23
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Oct 2019 02:31:57 -0700 (PDT)
Date: Fri, 18 Oct 2019 10:31:39 +0100
In-Reply-To: <20191010151443.7399-1-maennich@google.com>
Message-Id: <20191018093143.15997-1-maennich@google.com>
Mime-Version: 1.0
References: <20191010151443.7399-1-maennich@google.com>
Subject: [PATCH v2 0/4] export/modpost: avoid renaming __ksymtab entries for
 symbol namespaces
From: Matthias Maennich <maennich@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: kernel-team@android.com, maennich@google.com, Jessica Yu <jeyu@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Martijn Coenen <maco@android.com>, Lucas De Marchi <lucas.de.marchi@gmail.com>, Shaun Ruffell <sruffell@sruffell.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org

The introduction of the symbol namespace patches changed the way symbols are
named in the ksymtab entries. That caused userland tools to fail (such as
kmod's depmod). As depmod is used as part of the kernel build it was worth
having another look whether this name change can be avoided.

The main purpose of this series is to restore the original ksymtab entry names.
For that to happen and to remove some rough edges around that, the relevant
parts in modpost got a small refactoring as to when and how namespaces are
evaluated and set in the symbol struct.

Eventually, the namespace values can be read from __kstrtabns_ entries and
their corresponding __ksymtab_strings values. That removes the need to carry
the namespace names within the (anyway unique) symbol name entries.

The last patch of this series is adopted from Masahiro [1]. By allowing 'no
namespace' to be represented as empty string, large chunks of
include/linux/export.h could be consolidated. Technically, this last patch is
not absolutely necessary to fix functionality. It addresses concerns about
maintainability and readability. While I strongly suggest sending all of the
patches for 5.4, the last one could possible deferred to the next merge window.

This patch applies to the modules-linus [2] branch.

Changes since v2:
 - restored correct authorship for [4/4]
 - add missing contributor tags
 - fixed typos and code style (spaces/tabs)

[1] https://lore.kernel.org/lkml/20190927093603.9140-5-yamada.masahiro@socionext.com/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/jeyu/linux.git/log/?h=modules-linus

Cc: Jessica Yu <jeyu@kernel.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Martijn Coenen <maco@android.com>
Cc: Lucas De Marchi <lucas.de.marchi@gmail.com>
Cc: Shaun Ruffell <sruffell@sruffell.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Will Deacon <will@kernel.org>
Cc: linux-kbuild@vger.kernel.org
Cc: linux-modules@vger.kernel.org


Masahiro Yamada (1):
  export: avoid code duplication in include/linux/export.h

Matthias Maennich (3):
  modpost: delegate updating namespaces to separate function
  modpost: make updating the symbol namespace explicit
  symbol namespaces: revert to previous __ksymtab name scheme

 include/linux/export.h | 97 +++++++++++++-----------------------------
 kernel/module.c        |  2 +-
 scripts/mod/modpost.c  | 59 ++++++++++++++++---------
 scripts/mod/modpost.h  |  1 +
 4 files changed, 71 insertions(+), 88 deletions(-)

Interdiff against v1:
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 7cf0065ac95f..0bf7eab80d9f 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -357,18 +357,21 @@ static const char *namespace_from_kstrtabns(struct elf_info *info,
 
 static void sym_update_namespace(const char *symname, const char *namespace)
 {
-       struct symbol *s = find_symbol(symname);
-       /* That symbol should have been created earlier and thus this is
-        * actually an assertion. */
-       if (!s) {
-               merror("Could not update namespace(%s) for symbol %s\n",
-                      namespace, symname);
-               return;
-       }
-
-       free(s->namespace);
-       s->namespace =
-	       namespace && namespace[0] ? NOFAIL(strdup(namespace)) : NULL;
+	struct symbol *s = find_symbol(symname);
+
+	/*
+	 * That symbol should have been created earlier and thus this is
+	 * actually an assertion.
+	 */
+	if (!s) {
+		merror("Could not update namespace(%s) for symbol %s\n",
+		       namespace, symname);
+		return;
+	}
+
+	free(s->namespace);
+	s->namespace =
+		namespace && namespace[0] ? NOFAIL(strdup(namespace)) : NULL;
 }
 
 /**
-- 
2.23.0.866.gb869b98d4c-goog
