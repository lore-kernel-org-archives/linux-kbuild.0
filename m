Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from userp2130.oracle.com ([156.151.31.86]:59996 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727160AbfHMGLc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Aug 2019 02:11:32 -0400
From: Knut Omang <knut.omang@oracle.com>
Subject: [RFC 04/19] ktf: An implementation of a generic associative array container
Date: Tue, 13 Aug 2019 08:09:19 +0200
Message-Id: <6fb12b13002454d5bcba407cbd51c1ee9ecf3ec6.1565676440.git-series.knut.omang@oracle.com>
In-Reply-To: <cover.92d76bb4f6dcedc971d0b72a49e8e459a98bca54.1565676440.git-series.knut.omang@oracle.com>
References: <cover.92d76bb4f6dcedc971d0b72a49e8e459a98bca54.1565676440.git-series.knut.omang@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shreyans Devendra Doshi <0xinfosect0r@gmail.com>, Alan Maguire <alan.maguire@oracle.com>, Brendan Higgins <brendanhiggins@google.com>, Kevin Hilman <khilman@baylibre.com>, Hidenori Yamaji <hidenori.yamaji@sony.com>, Frank Rowand <frowand.list@gmail.com>, Timothy Bird <Tim.Bird@sony.com>, Luis Chamberlain <mcgrof@kernel.org>, Theodore Ts'o <tytso@mit.edu>, Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>, Knut Omang <knut.omang@oracle.com>

This container is mapping from an index datatype to a "value"
datatatype, using rbtree for the implementation.
This datatype is used for various purposes by ktf to
store and find data related to the actual test cases.

ktf_map.c:       Implementation of a kernel version independent std::map like API
ktf_map.h:       simple objects with key lookup to be inlined into a

Signed-off-by: Knut Omang <knut.omang@oracle.com>
---
 tools/testing/selftests/ktf/kernel/ktf_map.c | 261 ++++++++++++++++++++-
 tools/testing/selftests/ktf/kernel/ktf_map.h | 154 ++++++++++++-
 2 files changed, 415 insertions(+)
 create mode 100644 tools/testing/selftests/ktf/kernel/ktf_map.c
 create mode 100644 tools/testing/selftests/ktf/kernel/ktf_map.h

diff --git a/tools/testing/selftests/ktf/kernel/ktf_map.c b/tools/testing/selftests/ktf/kernel/ktf_map.c
new file mode 100644
index 0000000..78ae5fb
--- /dev/null
+++ b/tools/testing/selftests/ktf/kernel/ktf_map.c
@@ -0,0 +1,261 @@
+/*
+ * Copyright (c) 2017, Oracle and/or its affiliates. All rights reserved.
+ *    Author: Knut Omang <knut.omang@oracle.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0
+ *
+ * ktf_map.c: Implementation of a kernel version independent std::map like API
+ *   (made abstract to allow impl to change)
+ */
+
+#include "ktf_map.h"
+#include "ktf.h"
+
+void ktf_map_init(struct ktf_map *map, ktf_map_elem_comparefn elem_comparefn,
+		  ktf_map_elem_freefn elem_freefn)
+{
+	map->root = RB_ROOT;
+	map->size = 0;
+	map->elem_comparefn = elem_comparefn;
+	map->elem_freefn = elem_freefn;
+	spin_lock_init(&map->lock);
+}
+
+int ktf_map_elem_init(struct ktf_map_elem *elem, const char *key)
+{
+	memcpy(elem->key, key, KTF_MAX_KEY);
+	/* For strings that are too long, ensure truncation at
+	 * KTF_MAX_NAME == KTF_MAX_KEY - 1 length:
+	 */
+	elem->key[KTF_MAX_NAME] = '\0';
+	elem->map = NULL;
+	kref_init(&elem->refcount);
+	return 0;
+}
+
+/* A convenience unsigned int compare function as an alternative
+ * to the string compare:
+ */
+int ktf_uint_compare(const char *ac, const char *bc)
+{
+	unsigned int a = *((unsigned int *)ac);
+	unsigned int b = *((unsigned int *)bc);
+
+	return a > b ? 1 : (a < b ? -1 : 0);
+}
+EXPORT_SYMBOL(ktf_uint_compare);
+
+/* Copy "elem"s key representation into "name".  For cases where no
+ * compare function is defined - i.e. string keys - just copy string,
+ * otherwise name is hexascii of first 8 bytes of key.
+ */
+char *
+ktf_map_elem_name(struct ktf_map_elem *elem, char *name)
+{
+	if (!name)
+		return NULL;
+
+	if (!elem || !elem->map)
+		(void)strlcpy(name, "<none>", KTF_MAX_NAME);
+	else if (!elem->map->elem_comparefn)
+		(void)strlcpy(name, elem->key, KTF_MAX_NAME);
+	else
+		(void)snprintf(name, KTF_MAX_NAME, "'%*ph'", 8, elem->key);
+
+	return name;
+}
+
+/* Called when refcount of elem is 0. */
+static void ktf_map_elem_release(struct kref *kref)
+{
+	struct ktf_map_elem *elem = container_of(kref, struct ktf_map_elem,
+						 refcount);
+	struct ktf_map *map = elem->map;
+	char name[KTF_MAX_KEY];
+
+	tlog(T_DEBUG_V, "Releasing %s, %s free function",
+	     ktf_map_elem_name(elem, name),
+	     map && map->elem_freefn ? "calling" : "no");
+	if (map && map->elem_freefn)
+		map->elem_freefn(elem);
+}
+
+void ktf_map_elem_put(struct ktf_map_elem *elem)
+{
+	char name[KTF_MAX_KEY];
+
+	tlog(T_DEBUG_V, "Decreasing refcount for %s to %d",
+	     ktf_map_elem_name(elem, name),
+	     refcount_read(&elem->refcount.refcount) - 1);
+	kref_put(&elem->refcount, ktf_map_elem_release);
+}
+
+void ktf_map_elem_get(struct ktf_map_elem *elem)
+{
+	char name[KTF_MAX_KEY];
+
+	tlog(T_DEBUG_V, "Increasing refcount for %s to %d",
+	     ktf_map_elem_name(elem, name),
+	     refcount_read(&elem->refcount.refcount) + 1);
+	kref_get(&elem->refcount);
+}
+
+struct ktf_map_elem *ktf_map_find(struct ktf_map *map, const char *key)
+{
+	struct rb_node *node;
+	unsigned long flags;
+
+	/* may be called in interrupt context */
+	spin_lock_irqsave(&map->lock, flags);
+	node = map->root.rb_node;
+
+	while (node) {
+		struct ktf_map_elem *elem = container_of(node, struct ktf_map_elem, node);
+		int result;
+
+		if (map->elem_comparefn)
+			result = map->elem_comparefn(key, elem->key);
+		else
+			result = strncmp(key, elem->key, KTF_MAX_KEY);
+
+		if (result < 0) {
+			node = node->rb_left;
+		} else if (result > 0) {
+			node = node->rb_right;
+		} else {
+			ktf_map_elem_get(elem);
+			spin_unlock_irqrestore(&map->lock, flags);
+			return elem;
+		}
+	}
+	spin_unlock_irqrestore(&map->lock, flags);
+	return NULL;
+}
+
+/* Find the first map elem in 'map' */
+struct ktf_map_elem *ktf_map_find_first(struct ktf_map *map)
+{
+	struct ktf_map_elem *elem = NULL;
+	struct rb_node *node;
+	unsigned long flags;
+
+	spin_lock_irqsave(&map->lock, flags);
+	node = rb_first(&map->root);
+	if (node) {
+		elem = container_of(node, struct ktf_map_elem, node);
+		ktf_map_elem_get(elem);
+	}
+	spin_unlock_irqrestore(&map->lock, flags);
+	return elem;
+}
+
+/* Find the next element in the map after 'elem' if any */
+struct ktf_map_elem *ktf_map_find_next(struct ktf_map_elem *elem)
+{
+	struct ktf_map_elem *next = NULL;
+	struct ktf_map *map = elem->map;
+	struct rb_node *node;
+	unsigned long flags;
+
+	if (!elem->map)
+		return NULL;
+	spin_lock_irqsave(&map->lock, flags);
+	node = rb_next(&elem->node);
+
+	/* Assumption here - we don't need ref to elem any more.
+	 * Common usage pattern is
+	 *
+	 * for (elem = ktf_map_elem_first(map); elem != NULL;
+	 *      elem = ktf_map_find_next(elem))
+	 *
+	 * but if other use cases occur we may need to revisit.
+	 * This assumption allows us to define our _for_each macros
+	 * and still manage refcounts.
+	 */
+	ktf_map_elem_put(elem);
+
+	if (node) {
+		next = container_of(node, struct ktf_map_elem, node);
+		ktf_map_elem_get(next);
+	}
+	spin_unlock_irqrestore(&map->lock, flags);
+	return next;
+}
+
+int ktf_map_insert(struct ktf_map *map, struct ktf_map_elem *elem)
+{
+	struct rb_node **newobj, *parent = NULL;
+	unsigned long flags;
+
+	spin_lock_irqsave(&map->lock, flags);
+	newobj = &map->root.rb_node;
+	while (*newobj) {
+		struct ktf_map_elem *this = container_of(*newobj, struct ktf_map_elem, node);
+		int result;
+
+		if (map->elem_comparefn)
+			result = map->elem_comparefn(elem->key, this->key);
+		else
+			result = strncmp(elem->key, this->key, KTF_MAX_KEY);
+
+		parent = *newobj;
+		if (result < 0) {
+			newobj = &((*newobj)->rb_left);
+		} else if (result > 0) {
+			newobj = &((*newobj)->rb_right);
+		} else {
+			spin_unlock_irqrestore(&map->lock, flags);
+			return -EEXIST;
+		}
+	}
+
+	/* Add newobj node and rebalance tree. */
+	rb_link_node(&elem->node, parent, newobj);
+	rb_insert_color(&elem->node, &map->root);
+	elem->map = map;
+	map->size++;
+	/* Bump reference count for map reference */
+	ktf_map_elem_get(elem);
+	spin_unlock_irqrestore(&map->lock, flags);
+	return 0;
+}
+
+void ktf_map_remove_elem(struct ktf_map *map, struct ktf_map_elem *elem)
+{
+	if (elem) {
+		rb_erase(&elem->node, &map->root);
+		map->size--;
+		ktf_map_elem_put(elem);
+	}
+}
+
+struct ktf_map_elem *ktf_map_remove(struct ktf_map *map, const char *key)
+{
+	struct ktf_map_elem *elem;
+	unsigned long flags;
+
+	elem = ktf_map_find(map, key);
+	spin_lock_irqsave(&map->lock, flags);
+	ktf_map_remove_elem(map, elem);
+	spin_unlock_irqrestore(&map->lock, flags);
+	return elem;
+}
+
+void ktf_map_delete_all(struct ktf_map *map)
+{
+	struct ktf_map_elem *elem;
+	struct rb_node *node;
+	unsigned long flags;
+
+	spin_lock_irqsave(&map->lock, flags);
+	do {
+		node = rb_first(&(map)->root);
+		if (node) {
+			rb_erase(node, &(map)->root);
+			map->size--;
+			elem = container_of(node, struct ktf_map_elem, node);
+			ktf_map_elem_put(elem);
+		}
+	} while (node);
+	spin_unlock_irqrestore(&map->lock, flags);
+}
diff --git a/tools/testing/selftests/ktf/kernel/ktf_map.h b/tools/testing/selftests/ktf/kernel/ktf_map.h
new file mode 100644
index 0000000..1c8ae9b
--- /dev/null
+++ b/tools/testing/selftests/ktf/kernel/ktf_map.h
@@ -0,0 +1,154 @@
+/*
+ * Copyright (c) 2017, Oracle and/or its affiliates. All rights reserved.
+ *    Author: Knut Omang <knut.omang@oracle.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0
+ *
+ * ktf_map.h: simple objects with key lookup to be inlined into a
+ *    larger object
+ */
+
+#ifndef _KTF_MAP_H
+#define _KTF_MAP_H
+#include <linux/kref.h>
+#include <linux/version.h>
+#include <linux/rbtree.h>
+
+#define	KTF_MAX_KEY 64
+#define KTF_MAX_NAME (KTF_MAX_KEY - 1)
+
+struct ktf_map_elem;
+
+/* Compare function called to compare element keys - optional and if
+ * not specified we revert to string comparison.  Should return < 0
+ * if first key < second, > 0 if first key > second, and 0 if they are
+ * identical.
+ */
+typedef int (*ktf_map_elem_comparefn)(const char *, const char *);
+
+/* A convenience unsigned int compare function as an alternative
+ * to the string compare:
+ */
+int ktf_uint_compare(const char *a, const char *b);
+
+/* Free function called when elem refcnt is 0 - optional and of course for
+ * dynamically-allocated elems only.
+ */
+typedef void (*ktf_map_elem_freefn)(struct ktf_map_elem *);
+
+struct ktf_map {
+	struct rb_root root; /* The rb tree holding the map */
+	size_t size;	     /* Current size (number of elements) of the map */
+	spinlock_t lock;     /* held for map lookup etc */
+	ktf_map_elem_comparefn elem_comparefn; /* Key comparison function */
+	ktf_map_elem_freefn elem_freefn; /* Free function */
+};
+
+struct ktf_map_elem {
+	struct rb_node node;	      /* Linkage for the map */
+	char key[KTF_MAX_KEY+1] __aligned(8);
+		/* Key of the element - must be unique within the same map */
+	struct ktf_map *map;  /* owning map */
+	struct kref refcount; /* reference count for element */
+};
+
+#define __KTF_MAP_INITIALIZER(_mapname, _elem_comparefn, _elem_freefn) \
+        { \
+		.root = RB_ROOT, \
+		.size = 0, \
+		.lock = __SPIN_LOCK_UNLOCKED(_mapname), \
+		.elem_comparefn = _elem_comparefn, \
+		.elem_freefn = _elem_freefn, \
+	}
+
+#define DEFINE_KTF_MAP(_mapname, _elem_comparefn, _elem_freefn) \
+	struct ktf_map _mapname = __KTF_MAP_INITIALIZER(_mapname, _elem_comparefn, _elem_freefn)
+
+void ktf_map_init(struct ktf_map *map, ktf_map_elem_comparefn elem_comparefn,
+	ktf_map_elem_freefn elem_freefn);
+
+/* returns 0 upon success or -errno upon error */
+int ktf_map_elem_init(struct ktf_map_elem *elem, const char *key);
+
+/* increase/reduce reference count to element.  If count reaches 0, the
+ * free function associated with map (if any) is called.
+ */
+void ktf_map_elem_get(struct ktf_map_elem *elem);
+void ktf_map_elem_put(struct ktf_map_elem *elem);
+
+char *ktf_map_elem_name(struct ktf_map_elem *elem, char *name);
+
+/* Insert a new element in map - return 0 iff 'elem' was inserted or -1 if
+ * the key already existed - duplicates are not insterted.
+ */
+int ktf_map_insert(struct ktf_map *map, struct ktf_map_elem *elem);
+
+/* Find and return the element with 'key' */
+struct ktf_map_elem *ktf_map_find(struct ktf_map *map, const char *key);
+
+/* Find the first map elem in 'map' with reference count increased. */
+struct ktf_map_elem *ktf_map_find_first(struct ktf_map *map);
+
+/* Find the next element in the map after 'elem' if any.  Decreases refcount
+ * for "elem" and increases it for returned map element - this helps manage
+ * reference counts when iterating over map elements.
+ */
+struct ktf_map_elem *ktf_map_find_next(struct ktf_map_elem *elem);
+
+/* Remove the element 'key' from the map and return a pointer to it with
+ * refcount increased.
+ */
+struct ktf_map_elem *ktf_map_remove(struct ktf_map *map, const char *key);
+
+/* Remove specific element elem from the map. Refcount is not increased
+ * as caller must already have had a reference.
+ */
+void ktf_map_remove_elem(struct ktf_map *map, struct ktf_map_elem *elem);
+
+void ktf_map_delete_all(struct ktf_map *map);
+
+static inline size_t ktf_map_size(struct ktf_map *map) {
+	return map->size;
+}
+
+static inline bool ktf_map_empty(struct ktf_map *map) {
+	return map->size == 0;
+}
+
+/* Gets first entry with refcount of entry increased for caller. */
+#define ktf_map_first_entry(_map, _type, _member) \
+	ktf_map_empty(_map) ? NULL : \
+	container_of(ktf_map_find_first(_map), _type, _member)
+
+/* Gets next elem after "pos", decreasing refcount for pos and increasing
+ * it for returned entry.
+ */
+#define ktf_map_next_entry(_pos, _member) ({ \
+	struct ktf_map_elem *_e = ktf_map_find_next(&(_pos)->_member); \
+        _e ? container_of(_e, typeof(*_pos), _member) : NULL; \
+})
+
+/* Iterates over map elements, incrementing refcount for current element and
+ * decreasing it when we iterate to the next element.  Important - if you
+ * break out of the loop via break/return, ensure ktf_map_elem_put(pos)
+ * is called for current element since we have a reference to it for the
+ * current loop body iteration.
+ */
+#define ktf_map_for_each(pos, map)	\
+	for (pos = ktf_map_find_first(map); pos != NULL; pos = ktf_map_find_next(pos))
+
+/* Iterate over map elements in similar manner as above but using
+ * container_of() wrappers to work with the type embedding a
+ * "struct ktf_map_elem".
+ */
+#define ktf_map_for_each_entry(_pos, _map, _member) \
+	for (_pos = ktf_map_first_entry(_map, typeof(*_pos), _member);	\
+	     _pos != NULL; \
+	     _pos = ktf_map_next_entry(_pos, _member))
+
+#define ktf_map_find_entry(_map, _key, _type, _member) ({	\
+	struct ktf_map_elem *_entry = ktf_map_find(_map, _key);	\
+        _entry ? container_of(_entry, _type, _member) : NULL; \
+})
+
+#endif
-- 
git-series 0.9.1
