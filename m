Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:47204 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754882Ab1G1PzW (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 Jul 2011 11:55:22 -0400
From: David Howells <dhowells@redhat.com>
Subject: [PATCH 34/40] UAPI: Plumb the UAPI Kbuilds into the user header
 handling system [ver #3]
Date: Thu, 28 Jul 2011 16:54:43 +0100
Message-ID: <20110728155443.16618.38215.stgit@warthog.procyon.org.uk>
In-Reply-To: <20110728154920.16618.89358.stgit@warthog.procyon.org.uk>
References: <20110728154920.16618.89358.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: torvalds@osdl.org
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, David Howells <dhowells@redhat.com>

Plumb the UAPI Kbuilds into the user header handling system.  As the headers
are split the entries will be transferred across.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 Makefile |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 91598e4..2c0bf71 100644
--- a/Makefile
+++ b/Makefile
@@ -1069,6 +1069,10 @@ headers_install: __headers
 	$(error Headers not exportable for the $(SRCARCH) architecture))
 	$(Q)$(MAKE) $(hdr-inst)=include
 	$(Q)$(MAKE) $(hdr-inst)=arch/$(hdr-arch)/include/asm $(hdr-dst)
+	$(if $(wildcard $(srctree)/arch/$(hdr-arch)/include/uapi/asm/Kbuild),, \
+	$(error Headers not exportable for the $(SRCARCH) architecture))
+	$(Q)$(MAKE) $(hdr-inst)=include/uapi
+	$(Q)$(MAKE) $(hdr-inst)=arch/$(hdr-arch)/include/uapi/asm $(hdr-dst)
 
 PHONY += headers_check_all
 headers_check_all: headers_install_all
@@ -1078,6 +1082,8 @@ PHONY += headers_check
 headers_check: headers_install
 	$(Q)$(MAKE) $(hdr-inst)=include HDRCHECK=1
 	$(Q)$(MAKE) $(hdr-inst)=arch/$(hdr-arch)/include/asm $(hdr-dst) HDRCHECK=1
+	$(Q)$(MAKE) $(hdr-inst)=include/uapi HDRCHECK=1
+	$(Q)$(MAKE) $(hdr-inst)=arch/$(hdr-arch)/include/uapi/asm $(hdr-dst) HDRCHECK=1
 
 # ---------------------------------------------------------------------------
 # Modules

