Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from aserp2120.oracle.com ([141.146.126.78]:59252 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727633AbfHMGLm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Aug 2019 02:11:42 -0400
From: Knut Omang <knut.omang@oracle.com>
Subject: [RFC 08/19] ktf: Configurable context support for network info setup
Date: Tue, 13 Aug 2019 08:09:23 +0200
Message-Id: <ddf9f91c347d1c731b4cceea318783bb293676c3.1565676440.git-series.knut.omang@oracle.com>
In-Reply-To: <cover.92d76bb4f6dcedc971d0b72a49e8e459a98bca54.1565676440.git-series.knut.omang@oracle.com>
References: <cover.92d76bb4f6dcedc971d0b72a49e8e459a98bca54.1565676440.git-series.knut.omang@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shreyans Devendra Doshi <0xinfosect0r@gmail.com>, Alan Maguire <alan.maguire@oracle.com>, Brendan Higgins <brendanhiggins@google.com>, Kevin Hilman <khilman@baylibre.com>, Hidenori Yamaji <hidenori.yamaji@sony.com>, Frank Rowand <frowand.list@gmail.com>, Timothy Bird <Tim.Bird@sony.com>, Luis Chamberlain <mcgrof@kernel.org>, Theodore Ts'o <tytso@mit.edu>, Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>, Knut Omang <knut.omang@oracle.com>

An implementation of configurable contexts for exchanging network
information, to make it easier to run network tests potentially
involving more than one kernel.

ktf_netctx.h:    Configurable context setup for multinode network tests

Signed-off-by: Knut Omang <knut.omang@oracle.com>
---
 tools/testing/selftests/ktf/kernel/ktf_netctx.c | 132 +++++++++++++++++-
 tools/testing/selftests/ktf/kernel/ktf_netctx.h |  64 ++++++++-
 2 files changed, 196 insertions(+)
 create mode 100644 tools/testing/selftests/ktf/kernel/ktf_netctx.c
 create mode 100644 tools/testing/selftests/ktf/kernel/ktf_netctx.h

diff --git a/tools/testing/selftests/ktf/kernel/ktf_netctx.c b/tools/testing/selftests/ktf/kernel/ktf_netctx.c
new file mode 100644
index 0000000..84ef6ac
--- /dev/null
+++ b/tools/testing/selftests/ktf/kernel/ktf_netctx.c
@@ -0,0 +1,132 @@
+/*
+ * Copyright (c) 2019, Oracle and/or its affiliates. All rights reserved.
+ *    Author: Knut Omang <knut.omang@oracle.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0
+ *
+ * ktf_netcfg.h: Configurable context setup for multinode network tests
+ *
+ */
+
+#include "ktf.h"
+#include "ktf_netctx.h"
+#include <linux/in.h>
+
+/* Configuration callback to configure a network context */
+
+int ktf_netctx_cb(struct ktf_context *ctx, const void *data, size_t data_sz)
+{
+	struct ktf_netctx *nc = container_of(ctx, struct ktf_netctx, k);
+	struct ktf_addrinfo *kai = (struct ktf_addrinfo *)data;
+	short n = kai->n;
+	size_t param_sz;
+
+	if (n < 2) {
+		terr("Unsupported number of nodes (%d) - must be at least 2", n);
+		return -EINVAL;
+	}
+
+	param_sz = sizeof(*kai) + sizeof(kai->a) * (n - 2);
+
+	if (n > nc->max_nodes || n < nc->min_nodes) {
+		terr("Unsupported number of nodes (%d) - must be between %d and %d!",
+		     n, nc->min_nodes, nc->max_nodes);
+		return -EINVAL;
+	}
+
+	if (param_sz != data_sz) {
+		terr("Expected %lu bytes of parameter data, received %lu!",
+		     param_sz, data_sz);
+		return -EINVAL;
+	}
+
+	if (nc->a && nc->a_sz != data_sz) {
+		kfree(nc->a);
+		nc->a = NULL;
+	}
+
+	if (!nc->a) {
+		nc->a = kzalloc(data_sz, GFP_KERNEL);
+		if (!nc->a)
+			return -ENOMEM;
+	}
+
+	memcpy(nc->a, kai, data_sz);
+	return 0;
+}
+EXPORT_SYMBOL(ktf_netctx_cb);
+
+void ktf_netctx_cleanup(struct ktf_context *ctx)
+{
+	struct ktf_netctx *nc = container_of(ctx, struct ktf_netctx, k);
+
+	kfree(nc->a);
+}
+EXPORT_SYMBOL(ktf_netctx_cleanup);
+
+/* Make network contexts dynamically allocatable from user mode
+ * Caller must supply desired values for callback functions in @nct.
+ */
+int ktf_netctx_enable(struct ktf_handle *handle, struct ktf_netctx_type *nct,
+		      short min_nodes, short max_nodes)
+{
+	struct ktf_context *lo_ctx;
+	struct ktf_addrinfo ai = {
+		.n = 2,
+		.rank = 0
+	};
+	int ret;
+	int i;
+
+	ret = ktf_handle_add_ctx_type(handle, &nct->t);
+	if (ret)
+		return ret;
+
+	nct->min_nodes = min_nodes;
+	nct->max_nodes = max_nodes;
+	strcpy(nct->t.name, "netctx");
+
+	for (i = 0; i < 2; i++) {
+		struct sockaddr_in *ai_in = (struct sockaddr_in *)&ai.a[i].addr;
+
+		ai.a[i].addr.ss_family = AF_INET;
+		strcpy(ai.a[i].ifname, "lo");
+		ai_in->sin_addr.s_addr = htonl(INADDR_LOOPBACK);
+	}
+
+	/* create and configure the loopback network context */
+	lo_ctx = ktf_context_add_from(handle, "lo", &nct->t);
+	if (!lo_ctx)
+		return -ENOMEM;
+
+	ret = ktf_context_set_config(lo_ctx, &ai, sizeof(ai));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL(ktf_netctx_enable);
+
+struct sockaddr_storage *ktf_netctx_addr(struct ktf_netctx *ctx, short rank)
+{
+	return &ctx->a->a[rank].addr;
+}
+EXPORT_SYMBOL(ktf_netctx_addr);
+
+const char *ktf_netctx_ifname(struct ktf_netctx *ctx, short rank)
+{
+	return ctx->a->a[rank].ifname;
+}
+EXPORT_SYMBOL(ktf_netctx_ifname);
+
+short ktf_netctx_rank(struct ktf_netctx *ctx)
+{
+	return ctx->a->rank;
+}
+EXPORT_SYMBOL(ktf_netctx_rank);
+
+short ktf_netctx_n(struct ktf_netctx *ctx)
+{
+	return ctx->a->n;
+}
+EXPORT_SYMBOL(ktf_netctx_n);
diff --git a/tools/testing/selftests/ktf/kernel/ktf_netctx.h b/tools/testing/selftests/ktf/kernel/ktf_netctx.h
new file mode 100644
index 0000000..414c744
--- /dev/null
+++ b/tools/testing/selftests/ktf/kernel/ktf_netctx.h
@@ -0,0 +1,64 @@
+/*
+ * Copyright (c) 2019, Oracle and/or its affiliates. All rights reserved.
+ *    Author: Knut Omang <knut.omang@oracle.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0
+ *
+ * ktf_netctx.h: Configurable context setup for multinode network tests
+ *
+ * KTF implements handling on the kernel side for this but leaves
+ * user space implementation to construct the corresponding
+ * stuct ktf_addrinfo parameter block
+ */
+
+#ifndef _KTF_NETCTX_H
+#define _KTF_NETCTX_H
+
+/* KTF matches against this type id as a possible discriminator: */
+#define KTF_NETCTX_TYPE_ID 0x2222
+
+#define IFNAMSZ 16
+
+struct ktf_peer_address
+{
+	struct sockaddr_storage addr; /* Address to use for this peer */
+	char ifname[IFNAMSZ];	    /* Local name of the interface with this address at peer */
+};
+
+struct ktf_addrinfo
+{
+	short n;		    /* Number of nodes involved, including the local */
+	short rank;		    /* Index into ktf_peer_address that corresponds to local host */
+	struct ktf_peer_address a[2]; /* KTF expects size n instead of 2 here */
+};
+
+#ifdef __KERNEL__
+
+struct ktf_netctx {
+	struct ktf_context k;
+	struct ktf_addrinfo *a; /* Addr.info dyn.allocated based on incoming data */
+	size_t a_sz;		/* Size of the allocation in a, if any */
+	short min_nodes;	/* Minimum number of nodes for this context */
+	short max_nodes;	/* Maximum number of nodes this context supports */
+};
+
+struct ktf_netctx_type {
+	struct ktf_context_type t;
+	short min_nodes;	/* Minimum number of nodes for the context type */
+	short max_nodes;	/* Maximum number of nodes for the context type */
+};
+
+int ktf_netctx_enable(struct ktf_handle *handle, struct ktf_netctx_type *nct,
+		      short min_nodes, short max_nodes);
+
+int ktf_netctx_cb(struct ktf_context *ctx, const void *data, size_t data_sz);
+void ktf_netctx_cleanup(struct ktf_context *ctx);
+
+struct sockaddr_storage *ktf_netctx_addr(struct ktf_netctx *ctx, short rank);
+const char *ktf_netctx_ifname(struct ktf_netctx *ctx, short rank);
+short ktf_netctx_rank(struct ktf_netctx *ctx);
+short ktf_netctx_n(struct ktf_netctx *ctx);
+
+#endif
+
+#endif
-- 
git-series 0.9.1
