Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:40926 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752789AbeGBUuY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Jul 2018 16:50:24 -0400
Subject: Re: [PATCH 1/5] kconfig: include common Kconfig files from top-level
 Kconfig
From: Randy Dunlap <rdunlap@infradead.org>
References: <20180702144711.22111-1-hch@lst.de>
 <20180702144711.22111-2-hch@lst.de>
 <43b9a29d-27fc-1b6e-6f90-9187749bf338@infradead.org>
Message-ID: <7f7dfd3d-6d4b-fc64-956b-1defc5c5a7c3@infradead.org>
Date: Mon, 2 Jul 2018 13:50:23 -0700
MIME-Version: 1.0
In-Reply-To: <43b9a29d-27fc-1b6e-6f90-9187749bf338@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 07/02/18 13:41, Randy Dunlap wrote:

> --- linux-next-20180702.orig/init/Kconfig
> +++ linux-next-20180702/init/Kconfig
> @@ -1717,6 +1717,12 @@ config PROFILING
>  config TRACEPOINTS
>  	bool
>  
> +# Note:  arch/$(SRCARCH)/Kconfig needs to be before arch/Kconfig
> +# so that each $ARCH can specify its values for CONFIG_PGTABLE_LEVELS
> +# before the default value is found in arch/Kconfig.
> +
> +source "arch/$(SRCARCH)/Kconfig"
> +
>  source "arch/Kconfig"
>  
>  endmenu		# General setup
> 

except that the endmenu should be moved up a few lines so that the
Processor type and features menu is not part of the General setup menu.

v2 patch is below.

---
From: Randy Dunlap <rdunlap@infradead.org>

Present "General setup" before "Processor type and features".
This is done by sourcing arch/$(SRCARCH)/Kconfig before arch/Kconfig
inside init/Kconfig.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
v2: move General setup's endmenu before the $ARCH Kconfigs.

 Kconfig      |    2 --
 init/Kconfig |   10 ++++++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

--- linux-next-20180702.orig/Kconfig
+++ linux-next-20180702/Kconfig
@@ -9,8 +9,6 @@ comment "Compiler: $(CC_VERSION_TEXT)"
 
 source "scripts/Kconfig.include"
 
-source "arch/$(SRCARCH)/Kconfig"
-
 source "init/Kconfig"
 
 source "kernel/Kconfig.freezer"
--- linux-next-20180702.orig/init/Kconfig
+++ linux-next-20180702/init/Kconfig
@@ -1717,10 +1717,16 @@ config PROFILING
 config TRACEPOINTS
 	bool
 
-source "arch/Kconfig"
-
 endmenu		# General setup
 
+# Note:  arch/$(SRCARCH)/Kconfig needs to be before arch/Kconfig
+# so that each $ARCH can specify its values for CONFIG_PGTABLE_LEVELS
+# before the default value is found in arch/Kconfig.
+
+source "arch/$(SRCARCH)/Kconfig"
+
+source "arch/Kconfig"
+
 config RT_MUTEXES
 	bool
 


