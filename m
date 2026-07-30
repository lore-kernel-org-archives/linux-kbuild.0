Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C47B408017
	for <linux-kbuild@vger.kernel.org>; Thu, 30 Jul 2026 09:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785405148; cv=none; b=WPci65sjI8uWDOBn684VzSTsRH0H7W8r6og/BcrYi6G+5y+yYB1syuOgQXxEP06t3Cbvwril7MNTY2hePqH6Ds0Sqgd8m7pQvJSkjswqj0hdgZHXctAoCSbzxYmyZ37n1seqMrvyzFYvjY3GeUrK7fYS94Y0MAwziLaMUPP941A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785405148; c=relaxed/simple;
	bh=g41LPGlnsDih4SbTsmtxbI2yU3X3+FVOF4ti+MCeimU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=js0ddpoe7GD2O/1kuiNwCpfMlPdjxlVChaG727zZiI+XG229rQle/gPgKmIMOLx7oxxEi2xMcku4h2xx5W71oHMunXV34IOAyD5Moj7Zd/D6L/wGfM5FK8MCvZjq0S6nuwZbnGH+LAQybCKnfR08s9QWjxIgc5YsZauKVcZ9/Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iw5TG7Vv; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iw5TG7Vv"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785405144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TRG4Zw+fd32dwmDHtovGrWaB11wnJdHnHih5cbrfc0g=;
	b=iw5TG7VvBMUvRbogNUesI9ryROp6ySyACamlFeJolZ7aBu+pXR658l8IKsq1Ld3blkXJr6
	j4IM1Yk+lWQCqGojd/LnP+Ep0uerK7PKfqP76nj7mUsRdz4ifvpzwFw6DO74eYh47ImwL3
	BeDkxHFRMyQ4pR/2bILY4c4RN7K/BZI=
From: Kaitao Cheng <kaitao.cheng@linux.dev>
To: David Laight <david.laight.linux@gmail.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Hildenbrand <david@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Nicolas Schier <nsc@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	David Howells <dhowells@redhat.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Kaitao Cheng <chengkaitao@kylinos.cn>,
	Andrew Morton <akpm@linux-foundation.org>,
	Philipp Stanner <phasta@kernel.org>,
	Alex Williamson <alex@shazbot.org>,
	David Matlack <dmatlack@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"Joy H . J . Lee" <rkr0k0r@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ian Rogers <irogers@google.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Swapnil Sapkal <swapnil.sapkal@amd.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/4] scripts/list: Add mutable iterator variants
Date: Thu, 30 Jul 2026 17:50:36 +0800
Message-ID: <20260730095041.35715-5-kaitao.cheng@linux.dev>
In-Reply-To: <20260730095041.35715-1-kaitao.cheng@linux.dev>
References: <20260730095041.35715-1-kaitao.cheng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Kaitao Cheng <chengkaitao@kylinos.cn>

The kernel has added mutable iterator variants, so sync the scripts/list
implementation accordingly. The safe iterators require callers to declare
and pass a temporary cursor even when the loop body only needs to remove
the current entry.

Add list_for_each_entry_mutable() and hlist_for_each_entry_mutable() so
callers can use removal-safe iteration without exposing the temporary
cursor. Keep the existing safe variants for users that need direct access
to the cursor, and document the distinction.

Add local __PASTE() and __UNIQUE_ID() helpers to generate the internal
cursor name, matching the format used by include/linux/compiler.h.

Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
---
 scripts/include/list.h | 56 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 54 insertions(+), 2 deletions(-)

diff --git a/scripts/include/list.h b/scripts/include/list.h
index 8bdcaadca709..ff1c84339344 100644
--- a/scripts/include/list.h
+++ b/scripts/include/list.h
@@ -9,6 +9,16 @@
 /* Are two types/vars the same type (ignoring qualifiers)? */
 #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
 
+#ifndef __PASTE
+/* Indirect macros required for expanded argument pasting, eg. __LINE__. */
+#define ___PASTE(a, b) a##b
+#define __PASTE(a, b) ___PASTE(a, b)
+#endif
+
+#ifndef __UNIQUE_ID
+#define __UNIQUE_ID(name) __PASTE(__UNIQUE_ID_, __PASTE(name, __PASTE(_, __COUNTER__)))
+#endif
+
 /**
  * container_of - cast a member of a structure out to the containing structure
  * @ptr:	the pointer to the member.
@@ -298,11 +308,15 @@ static inline int list_empty(const struct list_head *head)
 	     pos = list_prev_entry(pos, member))
 
 /**
- * list_for_each_entry_safe - iterate over list of given type. Safe against removal of list entry
+ * list_for_each_entry_safe - iterate over list of given type safe against
+ *	removal of list entry with a caller-provided temporary cursor
  * @pos:	the type * to use as a loop cursor.
  * @n:		another type * to use as temporary storage
  * @head:	the head for your list.
  * @member:	the name of the list_head within the struct.
+ *
+ * If the caller does not need to access the temporary cursor, use
+ * list_for_each_entry_mutable() instead.
  */
 #define list_for_each_entry_safe(pos, n, head, member)			\
 	for (pos = list_first_entry(head, typeof(*pos), member),	\
@@ -310,6 +324,22 @@ static inline int list_empty(const struct list_head *head)
 	     !list_entry_is_head(pos, head, member);			\
 	     pos = n, n = list_next_entry(n, member))
 
+#define __list_for_each_entry_mutable(pos, tmp, head, member)		\
+	for (typeof(pos) tmp = list_next_entry(pos =			\
+		list_first_entry(head, typeof(*pos), member), member);	\
+	     !list_entry_is_head(pos, head, member);			\
+	     pos = tmp, tmp = list_next_entry(tmp, member))
+
+/**
+ * list_for_each_entry_mutable - iterate over a list safe against removal of
+ *	list entry with an internal temporary cursor
+ * @pos:	the type * to use as a loop cursor.
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ */
+#define list_for_each_entry_mutable(pos, head, member)			\
+	__list_for_each_entry_mutable(pos, __UNIQUE_ID(next), head, member)
+
 /*
  * Double linked lists with a single pointer list head.
  * Mostly useful for hash tables where the two pointer list head is
@@ -414,15 +444,37 @@ static inline void hlist_add_head(struct hlist_node *n, struct hlist_head *h)
 	     pos = hlist_entry_safe((pos)->member.next, typeof(*(pos)), member))
 
 /**
- * hlist_for_each_entry_safe - iterate over list of given type safe against removal of list entry
+ * hlist_for_each_entry_safe - iterate over list of given type safe against
+ *	removal of list entry with a caller-provided temporary cursor
  * @pos:	the type * to use as a loop cursor.
  * @n:		a &struct hlist_node to use as temporary storage
  * @head:	the head for your list.
  * @member:	the name of the hlist_node within the struct.
+ *
+ * If the caller does not need to access the temporary cursor, use
+ * hlist_for_each_entry_mutable() instead.
  */
 #define hlist_for_each_entry_safe(pos, n, head, member) 		\
 	for (pos = hlist_entry_safe((head)->first, typeof(*pos), member);\
 	     pos && ({ n = pos->member.next; 1; });			\
 	     pos = hlist_entry_safe(n, typeof(*pos), member))
 
+#define __hlist_for_each_entry_mutable(pos, tmp, head, member)		\
+	for (struct hlist_node *tmp = (pos =				\
+		hlist_entry_safe((head)->first, typeof(*pos), member)) ? \
+		pos->member.next : NULL;				\
+	     pos;							\
+	     pos = hlist_entry_safe(tmp, typeof(*pos), member),		\
+		tmp = pos ? pos->member.next : NULL)
+
+/**
+ * hlist_for_each_entry_mutable - iterate over hlist safe against removal of
+ *	list entry with an internal temporary cursor
+ * @pos:	the type * to use as a loop cursor.
+ * @head:	the head for your hlist.
+ * @member:	the name of the hlist_node within the struct.
+ */
+#define hlist_for_each_entry_mutable(pos, head, member)			\
+	__hlist_for_each_entry_mutable(pos, __UNIQUE_ID(next), head, member)
+
 #endif /* LIST_H */
-- 
2.43.0

