Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0441400987
	for <linux-kbuild@vger.kernel.org>; Thu, 30 Jul 2026 09:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785405133; cv=none; b=Hvlhs+zGMs10xQlvwbXbTMRLijZ5uGBJDHFMWn1v7XUi0kp6XG2W8FiW1o4P51GGqvC+y0l2ZyLxNx1mljrL0+wyzreR8vMgbjrx/Xe1ADPyVmb8xAVSXmEHRZfW39aD6CosvgTVovrvknqU5S4QVM1QuhwrD8AcWDs1gPJqn/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785405133; c=relaxed/simple;
	bh=YcODGCSgOvrohTfG9+XZROul8nGtIBK5OqTVgdkSBzk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a5NmX8Csw6v+qjA9ceawhBzYbIWPrlO1xnngGUbSz2qh5IgRllddsRtpwI7/Z/P/subs615srhrtFOY30hEosRZozGdQCj5IWty89AhcsfbNs8F5tlLWg3HNsnPrmTdeajrh+CDGXukJlLJgmFs/IaRtorXwEULGLby0k4IBC8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FSiJq570; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FSiJq570"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785405127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/yZhCLhfWTwjmgAAWhSa0xUKrCeGcjz7qsSUe10el/8=;
	b=FSiJq570BPAciKnncOR/H7Sk34aue4gVkz8WbJYgtpJ48haaV6qeodU/FhfNMgvuAFlgMq
	cdeIvFJz0RvoTAimEottkSdrZG0qaqaonXoAsr7GxyxnSjU+YtJyE/JHZ0vsFusYTJhA+G
	eFMGMw0ICF90vyVR9MvPENONd0WX0oY=
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
Subject: [PATCH v4 2/4] llist: Add mutable iterator variants
Date: Thu, 30 Jul 2026 17:50:34 +0800
Message-ID: <20260730095041.35715-3-kaitao.cheng@linux.dev>
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

The llist_for_each_safe() and llist_for_each_entry_safe() helpers allow
the current entry to be removed while iterating, but require callers to
declare and pass a temporary cursor. Most callers do not access that
cursor directly, so exposing it adds unnecessary boilerplate.

Add mutable variants that keep the temporary cursor in a uniquely named
local variable inside the macro while preserving removal-safe iteration
semantics.

Keep the existing *_safe() variants for callers that need to access or
reset the temporary cursor, and update their documentation to clarify
which interface to use.

Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
---
 include/linux/llist.h | 67 ++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 63 insertions(+), 4 deletions(-)

diff --git a/include/linux/llist.h b/include/linux/llist.h
index 413249764f7b..559058a8d4a0 100644
--- a/include/linux/llist.h
+++ b/include/linux/llist.h
@@ -145,7 +145,7 @@ static inline bool llist_on_list(const struct llist_node *node)
 
 /**
  * llist_for_each_safe - iterate over some deleted entries of a lock-less list
- *			 safe against removal of list entry
+ *	safe against entry removal with a caller-provided temporary cursor
  * @pos:	the &struct llist_node to use as a loop cursor
  * @n:		another &struct llist_node to use as temporary storage
  * @node:	the first entry of deleted list entries
@@ -158,10 +158,36 @@ static inline bool llist_on_list(const struct llist_node *node)
  * traverse order is from the newest to the oldest added entry.  If
  * you want to traverse from the oldest to the newest, you must
  * reverse the order by yourself before traversing.
+ *
+ * If the caller does not need to access the temporary cursor, use
+ * llist_for_each_mutable() instead.
  */
 #define llist_for_each_safe(pos, n, node)			\
 	for ((pos) = (node); (pos) && ((n) = (pos)->next, true); (pos) = (n))
 
+#define __llist_for_each_mutable(pos, tmp, node)			\
+	for (typeof(pos) tmp = ((pos) = (node)) ? (pos)->next : NULL;	\
+	     (pos);							\
+	     (pos) = tmp, tmp = (pos) ? (pos)->next : NULL)
+
+/**
+ * llist_for_each_mutable - iterate over some deleted entries of a lock-less
+ *	list safe against entry removal with an internal temporary cursor
+ * @pos:	the &struct llist_node to use as a loop cursor
+ * @node:	the first entry of deleted list entries
+ *
+ * In general, some entries of the lock-less list can be traversed
+ * safely only after being deleted from list, so start with an entry
+ * instead of list head.
+ *
+ * If being used on entries deleted from lock-less list directly, the
+ * traverse order is from the newest to the oldest added entry.  If
+ * you want to traverse from the oldest to the newest, you must
+ * reverse the order by yourself before traversing.
+ */
+#define llist_for_each_mutable(pos, node)				\
+	__llist_for_each_mutable(pos, __UNIQUE_ID(next), node)
+
 /**
  * llist_for_each_entry - iterate over some deleted entries of lock-less list of given type
  * @pos:	the type * to use as a loop cursor.
@@ -183,8 +209,9 @@ static inline bool llist_on_list(const struct llist_node *node)
 	     (pos) = llist_entry((pos)->member.next, typeof(*(pos)), member))
 
 /**
- * llist_for_each_entry_safe - iterate over some deleted entries of lock-less list of given type
- *			       safe against removal of list entry
+ * llist_for_each_entry_safe - iterate over some deleted entries of a lock-less
+ *	list of given type safe against entry removal with a caller-provided
+ *	temporary cursor
  * @pos:	the type * to use as a loop cursor.
  * @n:		another type * to use as temporary storage
  * @node:	the first entry of deleted list entries.
@@ -198,13 +225,45 @@ static inline bool llist_on_list(const struct llist_node *node)
  * traverse order is from the newest to the oldest added entry.  If
  * you want to traverse from the oldest to the newest, you must
  * reverse the order by yourself before traversing.
+ *
+ * If the caller does not need to access the temporary cursor, use
+ * llist_for_each_entry_mutable() instead.
  */
 #define llist_for_each_entry_safe(pos, n, node, member)			       \
 	for (pos = llist_entry((node), typeof(*pos), member);		       \
 	     member_address_is_nonnull(pos, member) &&			       \
-	        (n = llist_entry(pos->member.next, typeof(*n), member), true); \
+	     (n = llist_entry(pos->member.next, typeof(*n), member), true);    \
 	     pos = n)
 
+#define __llist_for_each_entry_mutable(pos, tmp, node, member)			\
+	for (typeof(pos) tmp =							\
+		((pos) = llist_entry((node), typeof(*(pos)), member),		\
+		member_address_is_nonnull(pos, member) ?			\
+		llist_entry((pos)->member.next, typeof(*(pos)), member) : NULL);\
+	     member_address_is_nonnull(pos, member);				\
+	     (pos) = tmp, tmp = member_address_is_nonnull(pos, member) ?	\
+		llist_entry((pos)->member.next, typeof(*(pos)), member) : NULL)
+
+/**
+ * llist_for_each_entry_mutable - iterate over some deleted entries of a
+ *	lock-less list of given type safe against entry removal with an internal
+ *	temporary cursor
+ * @pos:	the type * to use as a loop cursor.
+ * @node:	the first entry of deleted list entries.
+ * @member:	the name of the llist_node with the struct.
+ *
+ * In general, some entries of the lock-less list can be traversed
+ * safely only after being removed from list, so start with an entry
+ * instead of list head.
+ *
+ * If being used on entries deleted from lock-less list directly, the
+ * traverse order is from the newest to the oldest added entry.  If
+ * you want to traverse from the oldest to the newest, you must
+ * reverse the order by yourself before traversing.
+ */
+#define llist_for_each_entry_mutable(pos, node, member)			\
+	__llist_for_each_entry_mutable(pos, __UNIQUE_ID(next), node, member)
+
 /**
  * llist_empty - tests whether a lock-less list is empty
  * @head:	the list to test
-- 
2.43.0

