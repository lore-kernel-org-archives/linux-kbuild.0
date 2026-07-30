Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08A440245F
	for <linux-kbuild@vger.kernel.org>; Thu, 30 Jul 2026 09:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785405140; cv=none; b=otgK5xYqsyWMnsAQdrbuo3Qm7ux89ZJoJSuGouThE4PI2e5J3wTlGtcqjFq2cD8CWG3CkWJpJzlGKcRTLacvWOBIyOJrpHx0f5NZF1F7SURV7+RlIcdAZx0h3fIERDPR43h669RKmD6rfV2aEa+252JOe13mu0ZAWJXGOzGtiOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785405140; c=relaxed/simple;
	bh=/HY7fnLh53Zs2jxtM1EJ5NEaruYHlQKhwRoNe5zl8xE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GMYml0ENB/Y5dykz8waCjgBRIyUs5zYS53mF7riVVImHnAzdJWu6xcnuBF7HhVZi68i9J6hi3doERwThULcjISf2cjBZt8I8lOXMwzGrdpHLx4WKArBtxzttYg4bKj3oikcyEEqKeORnpS2vO5bhKRMsqULp8mZo2DqXjE7+t9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZvE5zMBU; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZvE5zMBU"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785405135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cqpHbX6O+wq4uUM8GthAMfc1LxysxLGzlyvuogdVZA8=;
	b=ZvE5zMBU/tgIhEkeYp0WAtqVXJI1sJsi4E5SBYImZzjUPwUE9+lMy8c8GvqKSpfvMjOnTC
	n8Q0Mc2RcHczK5A+3R5/JwVZDPhK6JhKsmaXxEIw6vaCJfmM/P+Mm+okAaHFE/Pp4r8YNx
	TrnlBTFZAiTHBb2Crju0Zl3C9ikwO3U=
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
Subject: [PATCH v4 3/4] tools/list: Add mutable iterator variants
Date: Thu, 30 Jul 2026 17:50:35 +0800
Message-ID: <20260730095041.35715-4-kaitao.cheng@linux.dev>
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

The tools tree carries its own copy of the list helpers, but it does not
provide the mutable iterator variants available to in-kernel users. Tools
therefore still need to declare and pass a temporary cursor when removing
the current entry during iteration, even when the loop body never uses it.

This commit complements the work to add support for mutable iterator
variants. Add the list and hlist *_mutable() iterator variants to the
tools copy. Keep the temporary cursor in a uniquely named local variable
while preserving the removal-safe iteration semantics.

Keep the existing *_safe() variants for callers that need to access or
reset the temporary cursor, and clarify the distinction in their
documentation. Provide a __UNIQUE_ID fallback because the tools compiler
headers do not define it.

Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
---
 tools/include/linux/compiler.h |   2 +
 tools/include/linux/list.h     | 184 +++++++++++++++++++++++++++++++--
 2 files changed, 180 insertions(+), 6 deletions(-)

diff --git a/tools/include/linux/compiler.h b/tools/include/linux/compiler.h
index f2f54b038168..9edbb09d67f3 100644
--- a/tools/include/linux/compiler.h
+++ b/tools/include/linux/compiler.h
@@ -242,6 +242,8 @@ static __always_inline void __write_once_size(volatile void *p, void *res, int s
 #define ___PASTE(a, b) a##b
 #define __PASTE(a, b) ___PASTE(a, b)
 
+#define __UNIQUE_ID(name) __PASTE(__UNIQUE_ID_, __PASTE(name, __PASTE(_, __COUNTER__)))
+
 #ifndef OPTIMIZER_HIDE_VAR
 /* Make the optimizer believe the variable can be manipulated arbitrarily. */
 #define OPTIMIZER_HIDE_VAR(var)						\
diff --git a/tools/include/linux/list.h b/tools/include/linux/list.h
index a692ff7aed5c..28e42aaee062 100644
--- a/tools/include/linux/list.h
+++ b/tools/include/linux/list.h
@@ -439,25 +439,59 @@ static inline void list_splice_tail_init(struct list_head *list,
 
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
 	for (pos = (head)->next, n = pos->next; pos != (head); \
 		pos = n, n = pos->next)
 
+#define __list_for_each_mutable(pos, tmp, head)				\
+	for (typeof(pos) tmp = (pos = (head)->next)->next;		\
+	     pos != (head); pos = tmp, tmp = pos->next)
+
 /**
- * list_for_each_prev_safe - iterate over a list backwards safe against removal of list entry
+ * list_for_each_mutable - iterate over a list safe against removal of the
+ *	current entry with an internal temporary cursor
+ * @pos:	the &struct list_head to use as a loop cursor.
+ * @head:	the head for your list.
+ */
+#define list_for_each_mutable(pos, head)				\
+	__list_for_each_mutable(pos, __UNIQUE_ID(next), head)
+
+/**
+ * list_for_each_prev_safe - iterate over a list backwards safe against removal
+ *	of the current entry with a caller-provided temporary cursor
  * @pos:	the &struct list_head to use as a loop cursor.
  * @n:		another &struct list_head to use as temporary storage
  * @head:	the head for your list.
+ *
+ * If the caller does not need to access the temporary cursor, use
+ * list_for_each_prev_mutable() instead.
  */
 #define list_for_each_prev_safe(pos, n, head) \
 	for (pos = (head)->prev, n = pos->prev; \
 	     pos != (head); \
 	     pos = n, n = pos->prev)
 
+#define __list_for_each_prev_mutable(pos, tmp, head)			\
+	for (typeof(pos) tmp = (pos = (head)->prev)->prev;		\
+	     pos != (head); pos = tmp, tmp = pos->prev)
+
+/**
+ * list_for_each_prev_mutable - iterate over a list backwards safe against
+ *	removal of the current entry with an internal temporary cursor
+ * @pos:	the &struct list_head to use as a loop cursor.
+ * @head:	the head for your list.
+ */
+#define list_for_each_prev_mutable(pos, head)				\
+	__list_for_each_prev_mutable(pos, __UNIQUE_ID(prev), head)
+
 /**
  * list_for_each_entry	-	iterate over list of given type
  * @pos:	the type * to use as a loop cursor.
@@ -532,11 +566,15 @@ static inline void list_splice_tail_init(struct list_head *list,
 	     pos = list_next_entry(pos, member))
 
 /**
- * list_for_each_entry_safe - iterate over list of given type safe against removal of list entry
+ * list_for_each_entry_safe - iterate over list of given type safe against
+ *	removal of the current entry with a caller-provided temporary cursor
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
@@ -544,15 +582,35 @@ static inline void list_splice_tail_init(struct list_head *list,
 	     &pos->member != (head); 					\
 	     pos = n, n = list_next_entry(n, member))
 
+#define __list_for_each_entry_mutable(pos, tmp, head, member)		\
+	for (typeof(pos) tmp = list_next_entry(pos =			\
+		list_first_entry(head, typeof(*pos), member), member);	\
+	     &pos->member != (head);					\
+	     pos = tmp, tmp = list_next_entry(tmp, member))
+
+/**
+ * list_for_each_entry_mutable - iterate over a list safe against removal of
+ *	the current entry with an internal temporary cursor
+ * @pos:	the type * to use as a loop cursor.
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ */
+#define list_for_each_entry_mutable(pos, head, member)			\
+	__list_for_each_entry_mutable(pos, __UNIQUE_ID(next), head, member)
+
 /**
  * list_for_each_entry_safe_continue - continue list iteration safe against removal
+ *	of the current entry with a caller-provided temporary cursor
  * @pos:	the type * to use as a loop cursor.
  * @n:		another type * to use as temporary storage
  * @head:	the head for your list.
  * @member:	the name of the list_head within the struct.
  *
  * Iterate over list of given type, continuing after current point,
- * safe against removal of list entry.
+ * safe against removal of the current entry.
+ *
+ * If the caller does not need to access the temporary cursor, use
+ * list_for_each_entry_mutable_continue() instead.
  */
 #define list_for_each_entry_safe_continue(pos, n, head, member) 		\
 	for (pos = list_next_entry(pos, member), 				\
@@ -560,30 +618,78 @@ static inline void list_splice_tail_init(struct list_head *list,
 	     &pos->member != (head);						\
 	     pos = n, n = list_next_entry(n, member))
 
+#define __list_for_each_entry_mutable_continue(pos, tmp, head, member)	\
+	for (typeof(pos) tmp = list_next_entry(pos =			\
+		list_next_entry(pos, member), member);			\
+	     &pos->member != (head);					\
+	     pos = tmp, tmp = list_next_entry(tmp, member))
+
+/**
+ * list_for_each_entry_mutable_continue - continue list iteration safe against
+ *	removal of the current entry with an internal temporary cursor
+ * @pos:	the type * to use as a loop cursor.
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Iterate over list of given type, continuing after current point,
+ * safe against removal of the current entry.
+ */
+#define list_for_each_entry_mutable_continue(pos, head, member)		\
+	__list_for_each_entry_mutable_continue(pos,			\
+					       __UNIQUE_ID(next),	\
+					       head, member)
+
 /**
  * list_for_each_entry_safe_from - iterate over list from current point safe against removal
+ *	of the current entry with a caller-provided temporary cursor
  * @pos:	the type * to use as a loop cursor.
  * @n:		another type * to use as temporary storage
  * @head:	the head for your list.
  * @member:	the name of the list_head within the struct.
  *
  * Iterate over list of given type from current point, safe against
- * removal of list entry.
+ * removal of the current entry.
+ *
+ * If the caller does not need to access the temporary cursor, use
+ * list_for_each_entry_mutable_from() instead.
  */
 #define list_for_each_entry_safe_from(pos, n, head, member) 			\
 	for (n = list_next_entry(pos, member);					\
 	     &pos->member != (head);						\
 	     pos = n, n = list_next_entry(n, member))
 
+#define __list_for_each_entry_mutable_from(pos, tmp, head, member)	\
+	for (typeof(pos) tmp = list_next_entry(pos, member);		\
+	     &pos->member != (head);					\
+	     pos = tmp, tmp = list_next_entry(tmp, member))
+
+/**
+ * list_for_each_entry_mutable_from - iterate over list from current point safe
+ *	against removal of the current entry with an internal temporary cursor
+ * @pos:	the type * to use as a loop cursor.
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Iterate over list of given type from current point, safe against
+ * removal of the current entry.
+ */
+#define list_for_each_entry_mutable_from(pos, head, member)		\
+	__list_for_each_entry_mutable_from(pos, __UNIQUE_ID(next),	\
+					   head, member)
+
 /**
  * list_for_each_entry_safe_reverse - iterate backwards over list safe against removal
+ *	of the current entry with a caller-provided temporary cursor
  * @pos:	the type * to use as a loop cursor.
  * @n:		another type * to use as temporary storage
  * @head:	the head for your list.
  * @member:	the name of the list_head within the struct.
  *
  * Iterate backwards over list of given type, safe against removal
- * of list entry.
+ * of the current entry.
+ *
+ * If the caller does not need to access the temporary cursor, use
+ * list_for_each_entry_mutable_reverse() instead.
  */
 #define list_for_each_entry_safe_reverse(pos, n, head, member)		\
 	for (pos = list_last_entry(head, typeof(*pos), member),		\
@@ -591,6 +697,27 @@ static inline void list_splice_tail_init(struct list_head *list,
 	     &pos->member != (head); 					\
 	     pos = n, n = list_prev_entry(n, member))
 
+#define __list_for_each_entry_mutable_reverse(pos, tmp, head, member)	\
+	for (typeof(pos) tmp = list_prev_entry(pos =			\
+		list_last_entry(head, typeof(*pos), member), member);	\
+	     &pos->member != (head);					\
+	     pos = tmp, tmp = list_prev_entry(tmp, member))
+
+/**
+ * list_for_each_entry_mutable_reverse - iterate backwards over list safe
+ *	against removal of the current entry with an internal temporary cursor
+ * @pos:	the type * to use as a loop cursor.
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Iterate backwards over list of given type, safe against removal
+ * of the current entry.
+ */
+#define list_for_each_entry_mutable_reverse(pos, head, member)		\
+	__list_for_each_entry_mutable_reverse(pos,			\
+					      __UNIQUE_ID(prev),		\
+					      head, member)
+
 /**
  * list_safe_reset_next - reset a stale list_for_each_entry_safe loop
  * @pos:	the loop cursor used in the list_for_each_entry_safe loop
@@ -717,10 +844,33 @@ static inline void hlist_move_list(struct hlist_head *old,
 #define hlist_for_each(pos, head) \
 	for (pos = (head)->first; pos ; pos = pos->next)
 
+/**
+ * hlist_for_each_safe - iterate over a hlist safe against removal of the
+ *	current entry with a caller-provided temporary cursor
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
+	for (typeof(pos) tmp = (pos = (head)->first) ? pos->next : NULL;\
+	     pos; pos = tmp, tmp = pos ? pos->next : NULL)
+
+/**
+ * hlist_for_each_mutable - iterate over a hlist safe against removal of the
+ *	current entry with an internal temporary cursor
+ * @pos:	the &struct hlist_node to use as a loop cursor.
+ * @head:	the head for your hlist.
+ */
+#define hlist_for_each_mutable(pos, head)				\
+	__hlist_for_each_mutable(pos, __UNIQUE_ID(next), head)
+
 #define hlist_entry_safe(ptr, type, member) \
 	({ typeof(ptr) ____ptr = (ptr); \
 	   ____ptr ? hlist_entry(____ptr, type, member) : NULL; \
@@ -757,17 +907,39 @@ static inline void hlist_move_list(struct hlist_head *old,
 	     pos = hlist_entry_safe((pos)->member.next, typeof(*(pos)), member))
 
 /**
- * hlist_for_each_entry_safe - iterate over list of given type safe against removal of list entry
+ * hlist_for_each_entry_safe - iterate over list of given type safe against
+ *	removal of the current entry with a caller-provided temporary cursor
  * @pos:	the type * to use as a loop cursor.
  * @n:		another &struct hlist_node to use as temporary storage
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
+		pos->member.next : NULL;					\
+	     pos;							\
+	     pos = hlist_entry_safe(tmp, typeof(*pos), member),		\
+		tmp = pos ? pos->member.next : NULL)
+
+/**
+ * hlist_for_each_entry_mutable - iterate over hlist safe against removal of
+ *	the current entry with an internal temporary cursor
+ * @pos:	the type * to use as a loop cursor.
+ * @head:	the head for your hlist.
+ * @member:	the name of the hlist_node within the struct.
+ */
+#define hlist_for_each_entry_mutable(pos, head, member)			\
+	__hlist_for_each_entry_mutable(pos, __UNIQUE_ID(next), head, member)
+
 /**
  * list_del_range - deletes range of entries from list.
  * @begin: first element in the range to delete from the list.
-- 
2.43.0

