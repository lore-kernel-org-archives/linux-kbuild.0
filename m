Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:61489 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751007Ab1G1OBo convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 Jul 2011 10:01:44 -0400
Received: by gxk21 with SMTP id 21so1809534gxk.19
        for <linux-kbuild@vger.kernel.org>; Thu, 28 Jul 2011 07:01:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <25697.1311857663@redhat.com>
References: <25697.1311857663@redhat.com>
Date: Thu, 28 Jul 2011 10:01:42 -0400
Message-ID: <CACqU3MW1x4CNJ+xuikKKhLz1Zd77JSXWLTKA8q7L=W6qUFMbUg@mail.gmail.com>
Subject: Re: 'make distclean' silently removes empty files
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Michal Marek <mmarek@suse.cz>, arnd@arndb.de, linux-kbuild@vger.kernel.org

Hi,

On Thu, Jul 28, 2011 at 8:54 AM, David Howells <dhowells@redhat.com> wrote:
>
> Hi,
>
> Can 'make distclean' please be altered to _not_ silently remove empty files,
> especially ones that are checked into GIT and/or are mentioned in Makefiles as
> being compilable.  By all means flag them as requiring removal, remove them
> noisily or give an error.
>
> A case in point is:
>
>        arch/arm/mach-zynq/board_dt.c
>
> which is an empty file checked into GIT.
>
For the record, it is deleted because of the zero size by:

distclean: mrproper
        @find $(srctree) $(RCS_FIND_IGNORE) \
                \( -name '*.orig' -o -name '*.rej' -o -name '*~' \
                -o -name '*.bak' -o -name '#*#' -o -name '.*.orig' \
                -o -name '.*.rej' -o -size 0 \
                -o -name '*%' -o -name '.*.cmd' -o -name 'core' \) \
                -type f -print | xargs rm -f

in the main makefile.

Could you try:

commit a73f6c8638a75d1bf1bb8b0ace82ddd3b9f0291b
Author: Arnaud Lacombe <lacombar@gmail.com>
Date:   Thu Jul 28 10:00:33 2011 -0400

    Makefile: do not delete zero-sized C file

diff --git a/Makefile b/Makefile
index d018956..e9ca6ec 100644
--- a/Makefile
+++ b/Makefile
@@ -1198,7 +1198,7 @@ distclean: mrproper
        @find $(srctree) $(RCS_FIND_IGNORE) \
                \( -name '*.orig' -o -name '*.rej' -o -name '*~' \
                -o -name '*.bak' -o -name '#*#' -o -name '.*.orig' \
-               -o -name '.*.rej' -o -size 0 \
+               -o -name '.*.rej' -o \( -size 0 -a ! -name '*.c' \) \
                -o -name '*%' -o -name '.*.cmd' -o -name 'core' \) \
                -type f -print | xargs rm -f

[space/tab mangled, but the change is obvious]

 - Arnaud

> Thanks,
> David
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
