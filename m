Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nm26-vm7.access.bullet.mail.gq1.yahoo.com ([216.39.63.204]:43773
	"EHLO nm26-vm7.access.bullet.mail.gq1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753490Ab3IQXOy (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 17 Sep 2013 19:14:54 -0400
From: danielfsantos@att.net
Subject: [PATCH 4/5] lib: Add strerror and strerror_name functions
Date: Tue, 17 Sep 2013 18:08:36 -0500
Message-Id: <1379459317-13046-5-git-send-email-daniel.santos@pobox.com>
In-Reply-To: <1379459317-13046-1-git-send-email-daniel.santos@pobox.com>
References: <1379459317-13046-1-git-send-email-daniel.santos@pobox.com>
Reply-To: Daniel Santos <daniel.santos@pobox.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, David Howells <dhowells@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Michael Kerrisk <mtk.manpages@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, George Spelvin <linux@horizon.com>
Cc: Daniel Santos <daniel.santos@pobox.com>

Signed-off-by: Daniel Santos <daniel.santos@pobox.com>
---
 include/linux/string.h |  8 +++++++
 lib/string.c           | 60 ++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/include/linux/string.h b/include/linux/string.h
index ac889c5..76ce2ff 100644
--- a/include/linux/string.h
+++ b/include/linux/string.h
@@ -154,4 +154,12 @@ static inline const char *kbasename(const char *path)
 	return tail ? tail + 1 : path;
 }
 
+#ifdef CONFIG_STRERROR
+extern const char *strerror(int error);
+#endif
+
+#ifdef CONFIG_STRERROR_NAME
+extern const char *strerror_name(int error);
+#endif
+
 #endif /* _LINUX_STRING_H_ */
diff --git a/lib/string.c b/lib/string.c
index e5878de..7fd2704 100644
--- a/lib/string.c
+++ b/lib/string.c
@@ -27,6 +27,10 @@
 #include <linux/bug.h>
 #include <linux/errno.h>
 
+#if defined(CONFIG_STRERROR) || defined(CONFIG_STRERROR_NAME)
+# include <generated/error_strings.h>
+#endif
+
 #ifndef __HAVE_ARCH_STRNICMP
 /**
  * strnicmp - Case insensitive, length-limited string comparison
@@ -824,3 +828,59 @@ void *memchr_inv(const void *start, int c, size_t bytes)
 	return check_bytes8(start, value, bytes % 8);
 }
 EXPORT_SYMBOL(memchr_inv);
+
+#if defined(CONFIG_STRERROR) || defined(CONFIG_STRERROR_NAME)
+static const char *_strerror(int error, unsigned index)
+{
+	unsigned uerror = error < 0 ? -error : error;
+	const struct error_strings *es;
+	const struct error_strings *es_end = &error_strings[
+			sizeof(error_strings) / sizeof(*error_strings)];
+	const char *ret;
+	unsigned i;
+
+	for (es = error_strings; es != es_end; ++es) {
+		if (uerror >= es->first && uerror <= es->last)
+			break;
+	}
+
+	if (es == es_end)
+		return NULL;
+
+	for (i = es->first, ret = es->desc[index]; i < uerror; ++ret)
+		i += !*ret;
+
+	BUG_ON(i > es->last);
+	BUG_ON(i != uerror);
+
+	return *ret ? ret : NULL;
+}
+#endif /* defined(CONFIG_STRERROR) || defined(CONFIG_STRERROR_NAME) */
+
+#ifdef CONFIG_STRERROR
+/**
+ * strerror - Translates an error code into a description.
+ * @error:	The error to describe (may be positive or negative)
+ *
+ * Returns a pointer to the error description or NULL if none is found.
+ */
+const char *strerror(int error)
+{
+	return _strerror(error, 1);
+}
+EXPORT_SYMBOL(strerror);
+#endif
+
+#ifdef CONFIG_STRERROR_NAME
+/**
+ * strerror_name - Translates an error code into a name
+ * @error:	The error to describe (may be positive or negative)
+ *
+ * Returns a pointer to the error name or NULL if none is found.
+ */
+const char *strerror_name(int error)
+{
+	return _strerror(error, 0);
+}
+EXPORT_SYMBOL(strerror_name);
+#endif
-- 
1.8.1.5

