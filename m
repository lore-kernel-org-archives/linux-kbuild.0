Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mtaout02-winn.ispmail.ntl.com ([81.103.221.48]:49882 "EHLO
	mtaout02-winn.ispmail.ntl.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753621AbYJ3LJo (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 30 Oct 2008 07:09:44 -0400
From: Ian Campbell <ijc@hellion.org.uk>
In-Reply-To: <1225364543.12607.461.camel@zakaz.uk.xensource.com>
References: <1225200985.12607.186.camel@zakaz.uk.xensource.com>
	 <20081029190707.GD22105@uranus.ravnborg.org>
	 <1225364543.12607.461.camel@zakaz.uk.xensource.com>
Content-Type: text/plain
Date: Thu, 30 Oct 2008 11:09:19 +0000
Message-Id: <1225364959.12607.465.camel@zakaz.uk.xensource.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: KBUILD: do not include arch/<ARCH>/include/asm in find-sources
	twice.
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org

On Thu, 2008-10-30 at 11:02 +0000, Ian Campbell wrote:
> 
> I can see one further simplifications which is to make the final
>         find $(__srctree) $(RCS_FIND_IGNORE) \
>                        \( -name include
> into
>         find $(__srctree) $(RCS_FIND_IGNORE) \
>                        \( -wholename $(__srctree)/include/config
> which then allows 
>           find $(__srctree)security/selinux/include $(RCS_FIND_IGNORE)
> \
>                -name $1 -print; \
>           find $(__srctree)include $(RCS_FIND_IGNORE) \
>                -name config -prune -o -name $1 -print; \
> to be removed. However it also adds a bunch of new files such as
> include/acpi include/scsi etc. Arguably they should be included
> anyway.

In patch form that looks like (on top of the patch just now). And
include/scsi aren't new, they were included by the find
$(__srctree)/include previously.

diff -r f113cec1a44e Makefile
--- a/Makefile	Thu Oct 30 11:06:22 2008 +0000
+++ b/Makefile	Thu Oct 30 11:07:37 2008 +0000
@@ -1439,17 +1439,13 @@
 	       find $(__srctree)arch/$${arch} $(RCS_FIND_IGNORE) \
 	            -name $1 -print; \
 	  done ; \
-	  find $(__srctree)security/selinux/include $(RCS_FIND_IGNORE) \
-	       -name $1 -print; \
-	  find $(__srctree)include $(RCS_FIND_IGNORE) \
-	       -name config -prune -o -name $1 -print; \
 	  for arch in $(EXTRAINCLUDE_ARCHS) ; do \
 	       test -e $(__srctree)arch/$${arch}/include/asm && \
 	         find $(__srctree)arch/$${arch}/include/asm $(RCS_FIND_IGNORE) \
 	            -name $1 -print; \
 	  done ; \
 	  find $(__srctree) $(RCS_FIND_IGNORE) \
-	       \( -name include -o -name arch -o -name '.tmp_*' \) -prune -o \
+	       \( -wholename $(__srctree)include/config -o -name arch -o -name '.tmp_*' \) -prune -o \
 	       -name $1 -print; \
 	  )
 endef


> 
-- 
Ian Campbell
Current Noise: Venom - Witching Hour

Hitchcock's Staple Principle:
	The stapler runs out of staples only while you are trying to
	staple something.

