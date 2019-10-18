Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f74.google.com ([209.85.221.74]:54706 "EHLO
        mail-wr1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409753AbfJRJcD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Oct 2019 05:32:03 -0400
Received: by mail-wr1-f74.google.com with SMTP id e14so2312516wrm.21
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Oct 2019 02:32:00 -0700 (PDT)
Date: Fri, 18 Oct 2019 10:31:40 +0100
In-Reply-To: <20191018093143.15997-1-maennich@google.com>
Message-Id: <20191018093143.15997-2-maennich@google.com>
Mime-Version: 1.0
References: <20191010151443.7399-1-maennich@google.com> <20191018093143.15997-1-maennich@google.com>
Subject: [PATCH v2 1/4] modpost: delegate updating namespaces to separate function
From: Matthias Maennich <maennich@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: kernel-team@android.com, maennich@google.com, Jessica Yu <jeyu@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Martijn Coenen <maco@android.com>, Lucas De Marchi <lucas.de.marchi@gmail.com>, Shaun Ruffell <sruffell@sruffell.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org

Let the function 'sym_update_namespace' take care of updating the
namespace for a symbol. While this currently only replaces one single
location where namespaces are updated, in a following patch, this
function will get more call sites.

The function signature is intentionally close to sym_update_crc and
taking the name by char* seems like unnecessary work as the symbol has
to be looked up again. In a later patch of this series, this concern
will be addressed.

This function ensures that symbol::namespace is either NULL or has a
valid non-empty value. Previously, the empty string was considered 'no
namespace' as well and this lead to confusion.

Acked-by: Will Deacon <will@kernel.org>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Matthias Maennich <maennich@google.com>
---
 scripts/mod/modpost.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 4d2cdb4d71e3..dbfa3997136b 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -362,6 +362,25 @@ static char *sym_extract_namespace(const char **symname)
 	return namespace;
 }
 
+static void sym_update_namespace(const char *symname, const char *namespace)
+{
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
+}
+
 /**
  * Add an exported symbol - it may have already been added without a
  * CRC, in this case just update the CRC
@@ -383,8 +402,7 @@ static struct symbol *sym_add_exported(const char *name, const char *namespace,
 			s->module = mod;
 		}
 	}
-	free(s->namespace);
-	s->namespace = namespace ? strdup(namespace) : NULL;
+	sym_update_namespace(name, namespace);
 	s->preloaded = 0;
 	s->vmlinux   = is_vmlinux(mod->name);
 	s->kernel    = 0;
@@ -2196,7 +2214,7 @@ static int check_exports(struct module *mod)
 		else
 			basename = mod->name;
 
-		if (exp->namespace && exp->namespace[0]) {
+		if (exp->namespace) {
 			add_namespace(&mod->required_namespaces,
 				      exp->namespace);
 
-- 
2.23.0.866.gb869b98d4c-goog
