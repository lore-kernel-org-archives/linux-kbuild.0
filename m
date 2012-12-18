Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.skyhub.de ([78.46.96.112]:43651 "EHLO mail.skyhub.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754389Ab2LRUcD (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 18 Dec 2012 15:32:03 -0500
Date: Tue, 18 Dec 2012 21:31:59 +0100
From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] scripts: add checkmaintainers.py
Message-ID: <20121218203159.GI31255@liondog.tnic>
References: <1355523576-7596-1-git-send-email-cesarb@cesarb.net>
 <50CEF080.8010208@suse.cz>
 <20121217102714.GB31947@liondog.tnic>
 <1355758544.13361.14.camel@joe-AO722>
 <20121217170011.GC31866@liondog.tnic>
 <1355770579.13361.41.camel@joe-AO722>
 <1355771383.13361.44.camel@joe-AO722>
 <20121218182838.GF31255@liondog.tnic>
 <1355859281.30366.29.camel@joe-AO722>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1355859281.30366.29.camel@joe-AO722>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Michal Marek <mmarek@suse.cz>, Cesar Eduardo Barros <cesarb@cesarb.net>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, David Howells <dhowells@redhat.com>

On Tue, Dec 18, 2012 at 11:34:41AM -0800, Joe Perches wrote:
> If no patch is attached, you should get
>
> ERROR: Does not appear to be a unified-diff format patch

Well, it needs to handle the case where a patch simply and only renames
a file.

Then, even if a patch follows:

diff --git a/README b/README.old
similarity index 99%
rename from README
rename to README.old
index a24ec89ba442..b0a7aa56c3cc 100644
--- a/README
+++ b/README.old
@@ -1,3 +1,6 @@
+TEST
+
+
         Linux kernel release 3.x <http://kernel.org/>
 
 These are the release notes for Linux version 3.  Read them carefully,
--

it says:

$ git diff --cached HEAD -- | ./scripts/checkpatch.pl --strict -
Must be run from the top-level dir. of a kernel tree

If I comment out the following hunk:

        if (!defined $root) { 
                print "Must be run from the top-level dir. of a kernel tree\n";
                exit(2);
        }

then it works, albeit with a bunch of warnings:

Use of uninitialized value $root in concatenation (.) or string at ./scripts/checkpatch.pl line 1558.
Use of uninitialized value $root in concatenation (.) or string at ./scripts/checkpatch.pl line 1558.
Use of uninitialized value $root in concatenation (.) or string at ./scripts/checkpatch.pl line 1304.
Use of uninitialized value $root in concatenation (.) or string at ./scripts/checkpatch.pl line 1304.
Use of uninitialized value $root in concatenation (.) or string at ./scripts/checkpatch.pl line 1304.
Use of uninitialized value $root in concatenation (.) or string at ./scripts/checkpatch.pl line 1304.
Use of uninitialized value $root in concatenation (.) or string at ./scripts/checkpatch.pl line 1304.
Use of uninitialized value $root in concatenation (.) or string at ./scripts/checkpatch.pl line 1304.
CHECK: Patch renames README to README.old, update MAINTAINERS?
...

Looks like this would need a bit more work.

Thanks.

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
