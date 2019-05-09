Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:43526 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726743AbfEIOjL (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 May 2019 10:39:11 -0400
From: Joe Lawrence <joe.lawrence@redhat.com>
Subject: [PATCH v4 04/10] livepatch: Add klp-convert annotation helpers
Date: Thu,  9 May 2019 10:38:53 -0400
Message-Id: <20190509143859.9050-5-joe.lawrence@redhat.com>
In-Reply-To: <20190509143859.9050-1-joe.lawrence@redhat.com>
References: <20190509143859.9050-1-joe.lawrence@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, linux-kbuild@vger.kernel.org

From: Josh Poimboeuf <jpoimboe@redhat.com>

Define macros KLP_MODULE_RELOC and KLP_SYMPOS in
include/linux/livepatch.h to improve user-friendliness of the
livepatch annotation process.

Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
Signed-off-by: Joao Moreira <jmoreira@suse.de>
Signed-off-by: Joe Lawrence <joe.lawrence@redhat.com>
---
 include/linux/livepatch.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/livepatch.h b/include/linux/livepatch.h
index 16b48e8b29a2..3071aec8fd72 100644
--- a/include/linux/livepatch.h
+++ b/include/linux/livepatch.h
@@ -236,6 +236,18 @@ void *klp_shadow_get_or_alloc(void *obj, unsigned long id,
 void klp_shadow_free(void *obj, unsigned long id, klp_shadow_dtor_t dtor);
 void klp_shadow_free_all(unsigned long id, klp_shadow_dtor_t dtor);
 
+/* Used to annotate symbol relocations in livepatches */
+#define KLP_MODULE_RELOC(obj)						\
+	struct klp_module_reloc						\
+	__attribute__((__section__(".klp.module_relocs." #obj)))	\
+	__attribute__((aligned (4)))
+
+#define KLP_SYMPOS(symbol, pos)						\
+	{								\
+		.sym = &symbol,						\
+		.sympos = pos,						\
+	}
+
 #else /* !CONFIG_LIVEPATCH */
 
 static inline int klp_module_coming(struct module *mod) { return 0; }
-- 
2.20.1
