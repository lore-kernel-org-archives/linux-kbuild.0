Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ig0-f181.google.com ([209.85.213.181]:49459 "EHLO
	mail-ig0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751930AbaHRUTo (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Aug 2014 16:19:44 -0400
Received: by mail-ig0-f181.google.com with SMTP id h3so8634530igd.14
        for <linux-kbuild@vger.kernel.org>; Mon, 18 Aug 2014 13:19:44 -0700 (PDT)
Received: from [10.30.6.102] ([209.117.142.2])
        by mx.google.com with ESMTPSA id uh4sm47542512igc.6.2014.08.18.13.19.43
        for <linux-kbuild@vger.kernel.org>
        (version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
        Mon, 18 Aug 2014 13:19:43 -0700 (PDT)
Message-ID: <53F26025.4010902@gmail.com>
Date: Mon, 18 Aug 2014 14:20:53 -0600
From: Michael Ton <linuxham@gmail.com>
MIME-Version: 1.0
Subject: [PATCH] kbuild: fix bug with modpost Makefile warn flag inclusion
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

From: Michael Ton <linuxham@gmail.com>

The current Makefile.modpost file includes a warn (-w) flag to modpost 
if KBUILD_EXTMOD or KBUILD_MODPOST_WARN.  This flag should only be added 
if both flags are true.  Whenever KBUILD_MODPOST is true, modpost 
currently only prints warnings and does not exit on error (such as on an 
undefined symbol).

Signed-off-by: Michael Ton <linuxham@gmail.com>
---
--- scripts/Makefile.modpost.orig       2014-08-18 13:18:18.704048707 -0600
+++ scripts/Makefile.modpost    2014-08-18 13:24:20.902520603 -0600
@@ -77,7 +77,7 @@ modpost = scripts/mod/modpost
   $(if $(KBUILD_EXTRA_SYMBOLS), $(patsubst %, -e 
%,$(KBUILD_EXTRA_SYMBOLS))) \
   $(if $(KBUILD_EXTMOD),-o $(modulesymfile))      \
   $(if $(CONFIG_DEBUG_SECTION_MISMATCH),,-S)      \
- $(if $(KBUILD_EXTMOD)$(KBUILD_MODPOST_WARN),-w)
+ $(if $(KBUILD_EXTMOD), $(if $(KBUILD_MODPOST_WARN),-w))

  MODPOST_OPT=$(subst -i,-n,$(filter -i,$(MAKEFLAGS)))

