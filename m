Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:47066 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726272AbgD3TZQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Apr 2020 15:25:16 -0400
Date: Thu, 30 Apr 2020 21:25:11 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH RFC] Kbuild: Makefile: warn if auto.conf is obsolete
Message-ID: <20200430212511.2115ed98@coco.lan>
In-Reply-To: <20200430211009.3fef03f3@coco.lan>
References: <20200430131715.32c1a1f6@coco.lan>
        <CAK7LNASmVoZequqaj6MTimeZ0MG0fk7Wb5-9haFhgG03kDBpxg@mail.gmail.com>
        <20200430184948.27191975@coco.lan>
        <CAK7LNASx5qfV_6Wow-MVKsHXUX96m8yYvpeK1QVt+2i46FTMNg@mail.gmail.com>
        <20200430211009.3fef03f3@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>

A new behavior on more recent kernels require to always call
"make modules_prepare" after *any* Kconfig changes.

This is not what a poor mortal would be expecting on a building
system, as it should, IMHO, be able to detect and auto-run
whatever is needed to use the newer setup.

Yet, while this is not solved, let's at least stop the build
and produce a warning, to notify the user about that.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

I would still prefer to call "make modules_prepare" directly,
on such cases, but just calling "make -C . modules_prepare" doesn't
work. So, the next best thing would be to at least print a message
and don't try to do a build with a broken auto.conf file.

 Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Makefile b/Makefile
index 70def4907036..492ee2396ab9 100644
--- a/Makefile
+++ b/Makefile
@@ -1632,6 +1632,11 @@ $(objtree)/Module.symvers:
 build-dirs := $(KBUILD_EXTMOD)
 PHONY += modules
 modules: descend $(objtree)/Module.symvers
+	@if [ $(KCONFIG_CONFIG) -nt include/config/auto.conf ]; then \
+		echo "  WARNING: $(KCONFIG_CONFIG) was modified. Need to run:"; \
+		echo "           $(MAKE) modules_prepare"; \
+		exit -1; \
+	fi
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
 
 PHONY += modules_install
-- 
2.25.4
