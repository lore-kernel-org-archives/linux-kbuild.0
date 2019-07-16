Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f202.google.com ([209.85.210.202]:46284 "EHLO
        mail-pf1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732382AbfGPJnT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jul 2019 05:43:19 -0400
Received: by mail-pf1-f202.google.com with SMTP id g21so12038606pfb.13
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Jul 2019 02:43:18 -0700 (PDT)
Date: Tue, 16 Jul 2019 02:42:47 -0700
In-Reply-To: <20190716094302.180360-1-brendanhiggins@google.com>
Message-Id: <20190716094302.180360-4-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190716094302.180360-1-brendanhiggins@google.com>
Subject: [PATCH v10 03/18] kunit: test: add string_stream a std::stream like
 string builder
From: Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: frowand.list@gmail.com, gregkh@linuxfoundation.org, jpoimboe@redhat.com, keescook@google.com, kieran.bingham@ideasonboard.com, mcgrof@kernel.org, peterz@infradead.org, robh@kernel.org, sboyd@kernel.org, shuah@kernel.org, tytso@mit.edu, yamada.masahiro@socionext.com
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org, linux-um@lists.infradead.org, Alexander.Levin@microsoft.com, Tim.Bird@sony.com, amir73il@gmail.com, dan.carpenter@oracle.com, daniel@ffwll.ch, jdike@addtoit.com, joel@jms.id.au, julia.lawall@lip6.fr, khilman@baylibre.com, knut.omang@oracle.com, logang@deltatee.com, mpe@ellerman.id.au, pmladek@suse.com, rdunlap@infradead.org, richard@nod.at, rientjes@google.com, rostedt@goodmis.org, wfg@linux.intel.com, Brendan Higgins <brendanhiggins@google.com>

A number of test features need to do pretty complicated string printing
where it may not be possible to rely on a single preallocated string
with parameters.

So provide a library for constructing the string as you go similar to
C++'s std::string.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
---
 include/kunit/string-stream.h |  51 ++++++++++++
 kunit/Makefile                |   3 +-
 kunit/string-stream.c         | 144 ++++++++++++++++++++++++++++++++++
 3 files changed, 197 insertions(+), 1 deletion(-)
 create mode 100644 include/kunit/string-stream.h
 create mode 100644 kunit/string-stream.c

diff --git a/include/kunit/string-stream.h b/include/kunit/string-stream.h
new file mode 100644
index 0000000000000..390d118c41499
--- /dev/null
+++ b/include/kunit/string-stream.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * C++ stream style string builder used in KUnit for building messages.
+ *
+ * Copyright (C) 2019, Google LLC.
+ * Author: Brendan Higgins <brendanhiggins@google.com>
+ */
+
+#ifndef _KUNIT_STRING_STREAM_H
+#define _KUNIT_STRING_STREAM_H
+
+#include <linux/types.h>
+#include <linux/mutex.h>
+#include <stdarg.h>
+
+struct string_stream_fragment {
+	struct list_head node;
+	char *fragment;
+};
+
+struct string_stream {
+	size_t length;
+	struct list_head fragments;
+	/* length and fragments are protected by this lock */
+	struct mutex lock;
+};
+
+struct kunit;
+
+struct string_stream *alloc_string_stream(struct kunit *test);
+
+void string_stream_get(struct string_stream *stream);
+
+int string_stream_put(struct string_stream *stream);
+
+int string_stream_add(struct string_stream *stream, const char *fmt, ...);
+
+int string_stream_vadd(struct string_stream *stream,
+		       const char *fmt,
+		       va_list args);
+
+char *string_stream_get_string(struct string_stream *stream);
+
+int string_stream_append(struct string_stream *stream,
+			 struct string_stream *other);
+
+void string_stream_clear(struct string_stream *stream);
+
+bool string_stream_is_empty(struct string_stream *stream);
+
+#endif /* _KUNIT_STRING_STREAM_H */
diff --git a/kunit/Makefile b/kunit/Makefile
index 5efdc4dea2c08..275b565a0e81f 100644
--- a/kunit/Makefile
+++ b/kunit/Makefile
@@ -1 +1,2 @@
-obj-$(CONFIG_KUNIT) +=			test.o
+obj-$(CONFIG_KUNIT) +=			test.o \
+					string-stream.o
diff --git a/kunit/string-stream.c b/kunit/string-stream.c
new file mode 100644
index 0000000000000..5e7906ffc7fa1
--- /dev/null
+++ b/kunit/string-stream.c
@@ -0,0 +1,144 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * C++ stream style string builder used in KUnit for building messages.
+ *
+ * Copyright (C) 2019, Google LLC.
+ * Author: Brendan Higgins <brendanhiggins@google.com>
+ */
+
+#include <linux/list.h>
+#include <linux/slab.h>
+#include <kunit/string-stream.h>
+#include <kunit/test.h>
+
+int string_stream_vadd(struct string_stream *stream,
+		       const char *fmt,
+		       va_list args)
+{
+	struct string_stream_fragment *frag_container;
+	int len;
+	va_list args_for_counting;
+
+	/* Make a copy because `vsnprintf` could change it */
+	va_copy(args_for_counting, args);
+
+	/* Need space for null byte. */
+	len = vsnprintf(NULL, 0, fmt, args_for_counting) + 1;
+
+	va_end(args_for_counting);
+
+	frag_container = kmalloc(sizeof(*frag_container), GFP_KERNEL);
+	if (!frag_container)
+		return -ENOMEM;
+
+	frag_container->fragment = kmalloc(len, GFP_KERNEL);
+	if (!frag_container->fragment) {
+		kfree(frag_container);
+		return -ENOMEM;
+	}
+
+	len = vsnprintf(frag_container->fragment, len, fmt, args);
+	mutex_lock(&stream->lock);
+	stream->length += len;
+	list_add_tail(&frag_container->node, &stream->fragments);
+	mutex_unlock(&stream->lock);
+
+	return 0;
+}
+
+int string_stream_add(struct string_stream *stream, const char *fmt, ...)
+{
+	va_list args;
+	int result;
+
+	va_start(args, fmt);
+	result = string_stream_vadd(stream, fmt, args);
+	va_end(args);
+
+	return result;
+}
+
+void string_stream_clear(struct string_stream *stream)
+{
+	struct string_stream_fragment *frag_container, *frag_container_safe;
+
+	mutex_lock(&stream->lock);
+	list_for_each_entry_safe(frag_container,
+				 frag_container_safe,
+				 &stream->fragments,
+				 node) {
+		list_del(&frag_container->node);
+		kfree(frag_container->fragment);
+		kfree(frag_container);
+	}
+	stream->length = 0;
+	mutex_unlock(&stream->lock);
+}
+
+char *string_stream_get_string(struct string_stream *stream)
+{
+	struct string_stream_fragment *frag_container;
+	size_t buf_len = stream->length + 1; /* +1 for null byte. */
+	char *buf;
+
+	buf = kzalloc(buf_len, GFP_KERNEL);
+	if (!buf)
+		return NULL;
+
+	mutex_lock(&stream->lock);
+	list_for_each_entry(frag_container, &stream->fragments, node)
+		strlcat(buf, frag_container->fragment, buf_len);
+	mutex_unlock(&stream->lock);
+
+	return buf;
+}
+
+int string_stream_append(struct string_stream *stream,
+			 struct string_stream *other)
+{
+	const char *other_content;
+
+	other_content = string_stream_get_string(other);
+
+	if (!other_content)
+		return -ENOMEM;
+
+	return string_stream_add(stream, other_content);
+}
+
+bool string_stream_is_empty(struct string_stream *stream)
+{
+	return list_empty(&stream->fragments);
+}
+
+static int string_stream_init(struct kunit_resource *res, void *context)
+{
+	struct string_stream *stream;
+
+	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
+	if (!stream)
+		return -ENOMEM;
+
+	res->allocation = stream;
+	INIT_LIST_HEAD(&stream->fragments);
+	mutex_init(&stream->lock);
+
+	return 0;
+}
+
+static void string_stream_free(struct kunit_resource *res)
+{
+	struct string_stream *stream = res->allocation;
+
+	string_stream_clear(stream);
+	kfree(stream);
+}
+
+struct string_stream *alloc_string_stream(struct kunit *test)
+{
+	return kunit_alloc_resource(test,
+				    string_stream_init,
+				    string_stream_free,
+				    GFP_KERNEL,
+				    NULL);
+}
-- 
2.22.0.510.g264f2c817a-goog
