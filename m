Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:60008 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729107AbgFHXM3 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Jun 2020 19:12:29 -0400
From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.6 014/606] gcc-10: disable 'restrict' warning for now
Date: Mon,  8 Jun 2020 19:02:19 -0400
Message-Id: <20200608231211.3363633-14-sashal@kernel.org>
In-Reply-To: <20200608231211.3363633-1-sashal@kernel.org>
References: <20200608231211.3363633-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kbuild@vger.kernel.org

From: Linus Torvalds <torvalds@linux-foundation.org>

commit adc71920969870dfa54e8f40dac8616284832d02 upstream.

gcc-10 now warns about passing aliasing pointers to functions that take
restricted pointers.

That's actually a great warning, and if we ever start using 'restrict'
in the kernel, it might be quite useful.  But right now we don't, and it
turns out that the only thing this warns about is an idiom where we have
declared a few functions to be "printf-like" (which seems to make gcc
pick up the restricted pointer thing), and then we print to the same
buffer that we also use as an input.

And people do that as an odd concatenation pattern, with code like this:

    #define sysfs_show_gen_prop(buffer, fmt, ...) \
        snprintf(buffer, PAGE_SIZE, "%s"fmt, buffer, __VA_ARGS__)

where we have 'buffer' as both the destination of the final result, and
as the initial argument.

Yes, it's a bit questionable.  And outside of the kernel, people do have
standard declarations like

    int snprintf( char *restrict buffer, size_t bufsz,
                  const char *restrict format, ... );

where that output buffer is marked as a restrict pointer that cannot
alias with any other arguments.

But in the context of the kernel, that 'use snprintf() to concatenate to
the end result' does work, and the pattern shows up in multiple places.
And we have not marked our own version of snprintf() as taking restrict
pointers, so the warning is incorrect for now, and gcc picks it up on
its own.

If we do start using 'restrict' in the kernel (and it might be a good
idea if people find places where it matters), we'll need to figure out
how to avoid this issue for snprintf and friends.  But in the meantime,
this warning is not useful.

Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index 8584003bfbca..955b57a8ec15 100644
--- a/Makefile
+++ b/Makefile
@@ -862,6 +862,9 @@ KBUILD_CFLAGS += $(call cc-disable-warning, zero-length-bounds)
 KBUILD_CFLAGS += $(call cc-disable-warning, array-bounds)
 KBUILD_CFLAGS += $(call cc-disable-warning, stringop-overflow)
 
+# Another good warning that we'll want to enable eventually
+KBUILD_CFLAGS += $(call cc-disable-warning, restrict)
+
 # Enabled with W=2, disabled by default as noisy
 KBUILD_CFLAGS += $(call cc-disable-warning, maybe-uninitialized)
 
-- 
2.25.1
