Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mtaout02-winn.ispmail.ntl.com ([81.103.221.48]:16004 "EHLO
	mtaout02-winn.ispmail.ntl.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752803AbYJ3LC6 convert rfc822-to-8bit
	(ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 30 Oct 2008 07:02:58 -0400
From: Ian Campbell <ijc@hellion.org.uk>
In-Reply-To: <20081029190707.GD22105@uranus.ravnborg.org>
References: <1225200985.12607.186.camel@zakaz.uk.xensource.com>
	 <20081029190707.GD22105@uranus.ravnborg.org>
Content-Type: text/plain; charset=utf-8
Date: Thu, 30 Oct 2008 11:02:23 +0000
Message-Id: <1225364543.12607.461.camel@zakaz.uk.xensource.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Subject: Re: KBUILD: do not include arch/<ARCH>/include/asm in find-sources
	twice.
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org

On Wed, 2008-10-29 at 20:07 +0100, Sam Ravnborg wrote:
> - uses the fact that all arch have their header files moved
>   to arch/$ARCH/include
>   [Ignore the archs that are lacking behind]
> 
> And if we could simplify this "find file" list on top of that it would
> be extra bonus.

Assuming all headers have been moved (which isn't true yet so currently
you'd get all kinds of extra headers in the list) then this patch on top
of the one I sent yesterday simplifies things a bit. It basically
includes a revert of the first one and instead only considers those
members of ALLINCLUDE_ARCHS which are not in ALLSOURCE_ARCHS, IOW it
removes the other duplicate entry compared with the previous patch.

It also stops special casing include/asm-* at all and removes a bunch of
other legacy include/asm-* handling.

I can see one further simplifications which is to make the final
        find $(__srctree) $(RCS_FIND_IGNORE) \
        	       \( -name include
into
        find $(__srctree) $(RCS_FIND_IGNORE) \
        	       \( -wholename $(__srctree)/include/config
which then allows 
	  find $(__srctree)security/selinux/include $(RCS_FIND_IGNORE) \
	       -name $1 -print; \
	  find $(__srctree)include $(RCS_FIND_IGNORE) \
	       -name config -prune -o -name $1 -print; \
to be removed. However it also adds a bunch of new files such as
include/acpi include/scsi etc. Arguably they should be included anyway.

I don't really understand um but I think the
        ifeq ($(ARCH),um)
        ALLINCLUDE_ARCHS := $(ARCH) $(SUBARCH)
might be wrong since SUBARCH is i386 or x86_64 and they no longer exist.
Should it be SRCARCH?

Subject: kbuild: simplify find-sources by assuming all arch headers are under arch/*/include

Signed-off-by: Ian Campbell <ijc@hellion.org.uk>

diff -r 35ad5038b666 Makefile
--- a/Makefile	Wed Oct 29 15:28:48 2008 +0000
+++ b/Makefile	Thu Oct 30 10:51:57 2008 +0000
@@ -1432,27 +1432,22 @@
 
 ALLSOURCE_ARCHS := $(SRCARCH)
 
+EXTRAINCLUDE_ARCHS := $(filter-out $(ALLSOURCE_ARCHS),$(ALLINCLUDE_ARCHS))
+
 define find-sources
         ( for arch in $(ALLSOURCE_ARCHS) ; do \
 	       find $(__srctree)arch/$${arch} $(RCS_FIND_IGNORE) \
-		    -wholename $(__srctree)arch/$${arch}/include/asm -type d -prune \
-	            -o -name $1 -print; \
+	            -name $1 -print; \
 	  done ; \
 	  find $(__srctree)security/selinux/include $(RCS_FIND_IGNORE) \
 	       -name $1 -print; \
 	  find $(__srctree)include $(RCS_FIND_IGNORE) \
-	       \( -name config -o -name 'asm-*' \) -prune \
-	       -o -name $1 -print; \
-	  for arch in $(ALLINCLUDE_ARCHS) ; do \
-	       test -e $(__srctree)include/asm-$${arch} && \
-                 find $(__srctree)include/asm-$${arch} $(RCS_FIND_IGNORE) \
-	            -name $1 -print; \
+	       -name config -prune -o -name $1 -print; \
+	  for arch in $(EXTRAINCLUDE_ARCHS) ; do \
 	       test -e $(__srctree)arch/$${arch}/include/asm && \
 	         find $(__srctree)arch/$${arch}/include/asm $(RCS_FIND_IGNORE) \
 	            -name $1 -print; \
 	  done ; \
-	  find $(__srctree)include/asm-generic $(RCS_FIND_IGNORE) \
-	       -name $1 -print; \
 	  find $(__srctree) $(RCS_FIND_IGNORE) \
 	       \( -name include -o -name arch -o -name '.tmp_*' \) -prune -o \
 	       -name $1 -print; \

-- 
Ian Campbell
Current Noise: Motörhead - The Road Crew

QOTD:
	"Unlucky?  If I bought a pumpkin farm, they'd cancel Halloween."

