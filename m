Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F754746A3;
	Fri,  7 Aug 2026 16:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786120197; cv=none; b=rnkMEx9ZuSwVmWtphH5ypxn+YEwzXPDU+9ExzqzYbeGiXFN+oc3n1hvlMhVULxTXsty2lLd9JtS+WshTgBdpHOL1nmwAA63Aslc0ov+3O4neniTebChRaFVO0atb5PA8tRbTBmD4+KcS7HE9pc5+FCnis3bNPkv2tZpHCXYdv7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786120197; c=relaxed/simple;
	bh=PUA+vCvTfmfOFW1/uln3K2ruNfo/Xm5M7RrcGpZTVYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WaeOkrOEccYaycAkXAKVDj4l4K3+v+kuycY8kbSzfDK5HlXMlNAumPBlSyPzV0Nw7T74jD79VUUboRQCKdi8c5FyYjsmxvqJahqnEtvM1RpC6ODRraaBT8jSjPAeC/tUmJfsYbjMo7WS2sI54Df6C9JMDv0k283nlnaRRzS/jps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xztkuktq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xztkuktq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786120196; x=1817656196;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PUA+vCvTfmfOFW1/uln3K2ruNfo/Xm5M7RrcGpZTVYc=;
  b=XztkuktqQLftT7nk0zZKg6ZvSmi6S4s51aN142QHEAxFEz6koc5qyzKy
   TRVaWd19tHucFS3kNU+Q/RJWTf+IJz7YFZgxR/u4htzrixdKAAihz566+
   GJYSSjfTNYkipJP8Z9dHMBUYktwAFWGqoUnUxNjJ+nYSeKPlDq2dlsSNn
   BakmcH3jM4mofGZ59wXwHGVzc9DEcQYbKdOEmUWScfIJwpFhF4yWgDrvU
   rta/ivIee2wnFlds+/BvrmBEpX51E1m7mXMb9ndqmjhKkpoVTmFWSUXaI
   NHToMPApVQ4VufX9wopMid8+GgqIYpRfMOOxSzRDeRpRI7F104VqhcFkf
   Q==;
X-CSE-ConnectionGUID: KJsqz/+FQnCgTUSqTOOTxQ==
X-CSE-MsgGUID: WtO8N4PRSDOCqFCLh+RinA==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86493101"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="86493101"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 09:29:56 -0700
X-CSE-ConnectionGUID: tjxhk8+wQOuVFdtBTJYu3w==
X-CSE-MsgGUID: sOtpln6ORk6ecojs5/4CJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="258585317"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.152])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 09:29:53 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	jani.nikula@intel.com
Subject: [PATCH 1/2] modpost: add module as parameter to modpost_log()
Date: Fri,  7 Aug 2026 19:29:40 +0300
Message-ID: <f27bd8810f0ef12fb86068f0190e4e0afa81e0fa.1786120005.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1786120005.git.jani.nikula@intel.com>
References: <cover.1786120005.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit

modpost has a lot of error logging with module name, but the module name
is logged in a plethora of ways. Add struct module * parameter to
modpost_log(), and wrappers mod_warn() and mod_error(), to allow logging
with a unified module name, if provided.

If the module is provided, the messages will be of the format:

(ERROR|WARNING): modpost: (modname.ko|vmlinux): message

Actual conversion is done separately.

Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 scripts/mod/modpost.c | 12 +++++++++---
 scripts/mod/modpost.h |  8 ++++----
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index a7b72a81d248..240b45ff92f8 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -74,7 +74,7 @@ static unsigned int nr_unresolved;
 
 #define MODULE_NAME_LEN (64 - sizeof(Elf_Addr))
 
-void modpost_log(bool is_error, const char *fmt, ...)
+void modpost_log(bool is_error, struct module *mod, const char *fmt, ...)
 {
 	va_list arglist;
 
@@ -87,11 +87,17 @@ void modpost_log(bool is_error, const char *fmt, ...)
 
 	fprintf(stderr, "modpost: ");
 
+	if (mod)
+		fprintf(stderr, "%s%s: ", mod->name, mod->is_vmlinux ? "" : ".ko");
+
 	va_start(arglist, fmt);
 	vfprintf(stderr, fmt, arglist);
 	va_end(arglist);
 }
 
+#define mod_warn(mod, fmt, args...)	modpost_log(false, mod, fmt, ##args)
+#define mod_error(mod, fmt, args...)	modpost_log(true, mod, fmt, ##args)
+
 static inline bool strends(const char *str, const char *postfix)
 {
 	if (strlen(str) < strlen(postfix))
@@ -1772,7 +1778,7 @@ static void check_exports(struct module *mod)
 		exp = find_symbol(s->name);
 		if (!exp) {
 			if (!s->weak && nr_unresolved++ < MAX_UNRESOLVED_REPORTS)
-				modpost_log(!warn_unresolved,
+				modpost_log(!warn_unresolved, NULL,
 					    "\"%s\" [%s.ko] undefined!\n",
 					    s->name, mod->name);
 			continue;
@@ -1792,7 +1798,7 @@ static void check_exports(struct module *mod)
 
 		if (!verify_module_namespace(exp->namespace, basename) &&
 		    !contains_namespace(&mod->imported_namespaces, exp->namespace)) {
-			modpost_log(!allow_missing_ns_imports,
+			modpost_log(!allow_missing_ns_imports, NULL,
 				    "module %s uses symbol %s from namespace %s, but does not import it.\n",
 				    basename, exp->name, exp->namespace);
 			add_namespace(&mod->missing_namespaces, exp->namespace);
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index 2aecb8f25c87..d5f6d82837d5 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -223,8 +223,8 @@ char *read_text_file(const char *filename);
 char *get_line(char **stringp);
 void *sym_get_data(const struct elf_info *info, const Elf_Sym *sym);
 
-void __attribute__((format(printf, 2, 3)))
-modpost_log(bool is_error, const char *fmt, ...);
+void __attribute__((format(printf, 3, 4)))
+modpost_log(bool is_error, struct module *mod, const char *fmt, ...);
 
 /*
  * warn - show the given message, then let modpost continue running, still
@@ -239,6 +239,6 @@ modpost_log(bool is_error, const char *fmt, ...);
  * fatal - show the given message, and bail out immediately. This should be
  *         used when there is no point to continue running modpost.
  */
-#define warn(fmt, args...)	modpost_log(false, fmt, ##args)
-#define error(fmt, args...)	modpost_log(true, fmt, ##args)
+#define warn(fmt, args...)	modpost_log(false, NULL, fmt, ##args)
+#define error(fmt, args...)	modpost_log(true, NULL, fmt, ##args)
 #define fatal(fmt, args...)	do { error(fmt, ##args); exit(1); } while (1)
-- 
2.47.3

