Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835253FC5BE
	for <linux-kbuild@vger.kernel.org>; Thu, 30 Jul 2026 09:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785405125; cv=none; b=QICpo83yvU7ofLnJMhPefweXnImX/wF/weA2S3x7PYyfmj5JyIsCk7ab5tChGcxdIvOiQy0GUPysYld8tRK/GzGLef1PQPsrzkp6SyUgoPdoFXzNfSh1Od50jdbldxPmrzN/MvVH7RimAmhbr+VxQa7+ERtxZ2EMw6K2+Ehnb3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785405125; c=relaxed/simple;
	bh=zlyr+r/YTogNPxWGfoZqZcgPakTVwq1Ne16gJlEwTfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lroBAaryq859WF1845z/XsDjEBQrEBAsiD06oFqT4p4d2YkFrGHqCrE1xth7qzJAeFUSVzbqZ2T4yfRxtxl5hv7J8jTkBg4RLQ0ZWylYip9CuWoDrTHedviVYoP3bLqbtnuXUTi1FuR4m2+m3Yj3IyTinjaBj9AD26gsZhXD5fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=K6DUHt5q; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="K6DUHt5q"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785405119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nKi/FzTy1mqYQNs0ejXxXVLcSkWtLo7PgWnA/p8PpcQ=;
	b=K6DUHt5qJ+pxb2pbwJpXLmnaSQY7yT9rnOu9D8Z+99Fh565/8kCatsrPWQYghSpR+ZWxs7
	2abMOjBOIf/RGHdVG668iIoZA3CYc+rVJnrkPeN5lTM3W5Ht0BBgWkRAVfZGcCR1v3M1gP
	NsMq5N97+l1rjh+oTQie52+2w8H4fxo=
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
Subject: [PATCH v4 1/4] list: Add mutable iterator variants
Date: Thu, 30 Jul 2026 17:50:33 +0800
Message-ID: <20260730095041.35715-2-kaitao.cheng@linux.dev>
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

The list_for_each*_safe() helpers allow the current entry to be removed
while iterating, but require callers to declare and pass a temporary
cursor. Most callers never use that cursor directly, so exposing it adds
boilerplate and leaks an implementation detail into each call site.

Add *_mutable() variants for list and hlist iterators. These variants
keep the temporary cursor in a uniquely named local variable inside the
macro while preserving the removal-safe iteration semantics.

Keep the existing *_safe() variants for callers that need to access or
reset the temporary cursor, and update their documentation to clarify
which interface to use.

Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
---
 include/linux/list.h | 180 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 175 insertions(+), 5 deletions(-)

diff --git a/include/linux/list.h b/include/linux/list.h
index 09d979976b3b..373b08b929d3 100644
--- a/include/linux/list.h
+++ b/include/linux/list.h
@@ -765,26 +765,62 @@ static inline void list_splice_tail_init(struct list_head *list,
 
 /**
  * list_for_each_safe - iterate over a list safe against removal of list entry
+ *	with a caller-provided temporary cursor
  * @pos:	the &struct list_head to use as a loop cursor.
  * @n:		another &struct list_head to use as temporary storage
  * @head:	the head for your list.
+ *
+ * If the caller does not need to access the temporary cursor, use
+ * list_for_each_mutable() instead.
  */
 #define list_for_each_safe(pos, n, head) \
 	for (pos = (head)->next, n = pos->next; \
 	     !list_is_head(pos, (head)); \
 	     pos = n, n = pos->next)
 
+#define __list_for_each_mutable(pos, tmp, head)				\
+	for (typeof(pos) tmp = (pos = (head)->next)->next;		\
+	     !list_is_head(pos, (head));				\
+	     pos = tmp, tmp = pos->next)
+
+/**
+ * list_for_each_mutable - iterate over a list safe against entry removal
+ *	with an internal temporary cursor
+ * @pos:	the &struct list_head to use as a loop cursor.
+ * @head:	the head for your list.
+ */
+#define list_for_each_mutable(pos, head)				\
+	__list_for_each_mutable(pos, __UNIQUE_ID(next), head)
+
 /**
- * list_for_each_prev_safe - iterate over a list backwards safe against removal of list entry
+ * list_for_each_prev_safe - iterate over a list backwards safe against removal
+ *	of list entry with a caller-provided temporary cursor
  * @pos:	the &struct list_head to use as a loop cursor.
  * @n:		another &struct list_head to use as temporary storage
  * @head:	the head for your list.
+ *
+ * If the caller does not need to access the temporary cursor, use
+ * list_for_each_prev_mutable() instead.
  */
 #define list_for_each_prev_safe(pos, n, head) \
 	for (pos = (head)->prev, n = pos->prev; \
 	     !list_is_head(pos, (head)); \
 	     pos = n, n = pos->prev)
 
+#define __list_for_each_prev_mutable(pos, tmp, head)			\
+	for (typeof(pos) tmp = (pos = (head)->prev)->prev;		\
+	     !list_is_head(pos, (head));				\
+	     pos = tmp, tmp = pos->prev)
+
+/**
+ * list_for_each_prev_mutable - iterate over a list backwards safe against entry
+ *	removal with an internal temporary cursor
+ * @pos:	the &struct list_head to use as a loop cursor.
+ * @head:	the head for your list.
+ */
+#define list_for_each_prev_mutable(pos, head)				\
+	__list_for_each_prev_mutable(pos, __UNIQUE_ID(prev), head)
+
 /**
  * list_count_nodes - count nodes in the list
  * @head:	the head for your list.
@@ -896,11 +932,15 @@ static inline size_t list_count_nodes(struct list_head *head)
 	     pos = list_prev_entry(pos, member))
 
 /**
- * list_for_each_entry_safe - iterate over list of given type safe against removal of list entry
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
@@ -908,8 +948,25 @@ static inline size_t list_count_nodes(struct list_head *head)
 	     !list_entry_is_head(pos, head, member); 			\
 	     pos = n, n = list_next_entry(n, member))
 
+#define __list_for_each_entry_mutable(pos, tmp, head, member)		\
+	for (typeof(pos) tmp = list_next_entry(pos =			\
+		list_first_entry(head, typeof(*pos), member), member);	\
+	     !list_entry_is_head(pos, head, member);			\
+	     pos = tmp, tmp = list_next_entry(tmp, member))
+
+/**
+ * list_for_each_entry_mutable - iterate over a list safe against entry removal
+ *	with an internal temporary cursor
+ * @pos:	the type * to use as a loop cursor.
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ */
+#define list_for_each_entry_mutable(pos, head, member)			\
+	__list_for_each_entry_mutable(pos, __UNIQUE_ID(next), head, member)
+
 /**
  * list_for_each_entry_safe_continue - continue list iteration safe against removal
+ *	with a caller-provided temporary cursor
  * @pos:	the type * to use as a loop cursor.
  * @n:		another type * to use as temporary storage
  * @head:	the head for your list.
@@ -917,6 +974,9 @@ static inline size_t list_count_nodes(struct list_head *head)
  *
  * Iterate over list of given type, continuing after current point,
  * safe against removal of list entry.
+ *
+ * If the caller does not need to access the temporary cursor, use
+ * list_for_each_entry_mutable_continue() instead.
  */
 #define list_for_each_entry_safe_continue(pos, n, head, member) 		\
 	for (pos = list_next_entry(pos, member), 				\
@@ -924,8 +984,28 @@ static inline size_t list_count_nodes(struct list_head *head)
 	     !list_entry_is_head(pos, head, member);				\
 	     pos = n, n = list_next_entry(n, member))
 
+#define __list_for_each_entry_mutable_continue(pos, tmp, head, member)	\
+	for (typeof(pos) tmp = list_next_entry(pos =			\
+		list_next_entry(pos, member), member);			\
+	     !list_entry_is_head(pos, head, member);			\
+	     pos = tmp, tmp = list_next_entry(tmp, member))
+
 /**
- * list_for_each_entry_safe_from - iterate over list from current point safe against removal
+ * list_for_each_entry_mutable_continue - continue list iteration safe against
+ *	removal with an internal temporary cursor
+ * @pos:	the type * to use as a loop cursor.
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Iterate over list of given type, continuing after current point,
+ * safe against removal of list entry.
+ */
+#define list_for_each_entry_mutable_continue(pos, head, member)		\
+	__list_for_each_entry_mutable_continue(pos, __UNIQUE_ID(next), head, member)
+
+/**
+ * list_for_each_entry_safe_from - iterate over list from current point safe
+ *	against removal with a caller-provided temporary cursor
  * @pos:	the type * to use as a loop cursor.
  * @n:		another type * to use as temporary storage
  * @head:	the head for your list.
@@ -933,14 +1013,36 @@ static inline size_t list_count_nodes(struct list_head *head)
  *
  * Iterate over list of given type from current point, safe against
  * removal of list entry.
+ *
+ * If the caller does not need to access the temporary cursor, use
+ * list_for_each_entry_mutable_from() instead.
  */
 #define list_for_each_entry_safe_from(pos, n, head, member) 			\
 	for (n = list_next_entry(pos, member);					\
 	     !list_entry_is_head(pos, head, member);				\
 	     pos = n, n = list_next_entry(n, member))
 
+#define __list_for_each_entry_mutable_from(pos, tmp, head, member)	\
+	for (typeof(pos) tmp = list_next_entry(pos, member);		\
+	     !list_entry_is_head(pos, head, member);			\
+	     pos = tmp, tmp = list_next_entry(tmp, member))
+
+/**
+ * list_for_each_entry_mutable_from - iterate over list from current point safe
+ *	against removal with an internal temporary cursor
+ * @pos:	the type * to use as a loop cursor.
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Iterate over list of given type from current point, safe against
+ * removal of list entry.
+ */
+#define list_for_each_entry_mutable_from(pos, head, member)		\
+	__list_for_each_entry_mutable_from(pos,	__UNIQUE_ID(next), head, member)
+
 /**
- * list_for_each_entry_safe_reverse - iterate backwards over list safe against removal
+ * list_for_each_entry_safe_reverse - iterate backwards over list safe against
+ *	removal with a caller-provided temporary cursor
  * @pos:	the type * to use as a loop cursor.
  * @n:		another type * to use as temporary storage
  * @head:	the head for your list.
@@ -948,6 +1050,9 @@ static inline size_t list_count_nodes(struct list_head *head)
  *
  * Iterate backwards over list of given type, safe against removal
  * of list entry.
+ *
+ * If the caller does not need to access the temporary cursor, use
+ * list_for_each_entry_mutable_reverse() instead.
  */
 #define list_for_each_entry_safe_reverse(pos, n, head, member)		\
 	for (pos = list_last_entry(head, typeof(*pos), member),		\
@@ -955,6 +1060,25 @@ static inline size_t list_count_nodes(struct list_head *head)
 	     !list_entry_is_head(pos, head, member); 			\
 	     pos = n, n = list_prev_entry(n, member))
 
+#define __list_for_each_entry_mutable_reverse(pos, tmp, head, member)	\
+	for (typeof(pos) tmp = list_prev_entry(pos =			\
+		list_last_entry(head, typeof(*pos), member), member);	\
+	     !list_entry_is_head(pos, head, member);			\
+	     pos = tmp, tmp = list_prev_entry(tmp, member))
+
+/**
+ * list_for_each_entry_mutable_reverse - iterate backwards over list safe
+ *	against removal with an internal temporary cursor
+ * @pos:	the type * to use as a loop cursor.
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Iterate backwards over list of given type, safe against removal
+ * of list entry.
+ */
+#define list_for_each_entry_mutable_reverse(pos, head, member)		\
+	__list_for_each_entry_mutable_reverse(pos, __UNIQUE_ID(prev), head, member)
+
 /**
  * list_safe_reset_next - reset a stale list_for_each_entry_safe loop
  * @pos:	the loop cursor used in the list_for_each_entry_safe loop
@@ -1185,10 +1309,34 @@ static inline void hlist_splice_init(struct hlist_head *from,
 #define hlist_for_each(pos, head) \
 	for (pos = (head)->first; pos ; pos = pos->next)
 
+/**
+ * hlist_for_each_safe - iterate over a hlist safe against entry removal
+ *	with a caller-provided temporary cursor
+ * @pos:	the &struct hlist_node to use as a loop cursor.
+ * @n:		another &struct hlist_node to use as temporary storage.
+ * @head:	the head for your hlist.
+ *
+ * If the caller does not need to access the temporary cursor, use
+ * hlist_for_each_mutable() instead.
+ */
 #define hlist_for_each_safe(pos, n, head) \
 	for (pos = (head)->first; pos && ({ n = pos->next; 1; }); \
 	     pos = n)
 
+#define __hlist_for_each_mutable(pos, tmp, head)			\
+	for (typeof(pos) tmp = (pos = (head)->first) ? pos->next : NULL; \
+	     pos;							\
+	     pos = tmp, tmp = pos ? pos->next : NULL)
+
+/**
+ * hlist_for_each_mutable - iterate over a hlist safe against entry removal
+ *	with an internal temporary cursor
+ * @pos:	the &struct hlist_node to use as a loop cursor.
+ * @head:	the head for your hlist.
+ */
+#define hlist_for_each_mutable(pos, head)				\
+	__hlist_for_each_mutable(pos, __UNIQUE_ID(next), head)
+
 #define hlist_entry_safe(ptr, type, member) \
 	({ typeof(ptr) ____ptr = (ptr); \
 	   ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
@@ -1225,17 +1373,39 @@ static inline void hlist_splice_init(struct hlist_head *from,
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
+	     pos = hlist_entry_safe((tmp), typeof(*pos), member),	\
+		tmp = pos ? pos->member.next : NULL)
+
+/**
+ * hlist_for_each_entry_mutable - iterate over hlist safe against entry removal
+ *	with an internal temporary cursor
+ * @pos:	the type * to use as a loop cursor.
+ * @head:	the head for your hlist.
+ * @member:	the name of the hlist_node within the struct.
+ */
+#define hlist_for_each_entry_mutable(pos, head, member)			\
+	__hlist_for_each_entry_mutable(pos, __UNIQUE_ID(next), head, member)
+
 /**
  * hlist_count_nodes - count nodes in the hlist
  * @head:	the head for your hlist.
-- 
2.43.0

