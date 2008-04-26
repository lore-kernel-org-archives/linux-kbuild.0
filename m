Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from palinux.external.hp.com ([192.25.206.14]:55899 "EHLO
	mail.parisc-linux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754111AbYDZQRa (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 26 Apr 2008 12:17:30 -0400
Date: Sat, 26 Apr 2008 10:17:14 -0600
From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [PATCH] headerdep: a tool for detecting inclusion cycles in header file
Message-ID: <20080426161714.GR14990@parisc-linux.org>
References: <20080426134554.GA20727@damson.getinternet.no>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080426134554.GA20727@damson.getinternet.no>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Pekka Enberg <penberg@cs.helsinki.fi>, Adrian Bunk <bunk@kernel.org>, linux-kbuild@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Apr 26, 2008 at 03:45:54PM +0200, Vegard Nossum wrote:
> Maybe something like this could be useful for cleaning up headers (and
> maintaining that cleanliness once it has been achieved). What do you think?
> 
> Subject: [PATCH] headerdep: a tool for detecting inclusion cycles in header files

Do we actually have inclusion cycles in header files?  I remember gcc
warning about them when we were working on the parisc port (because we
needed includes that differed from x86).  Has the new build system got
rid of these warnings?

I think a more useful tool would be one which mapped something like
'use of down()' to 'needs to include <linux/semaphore.h>'.  It needs
to be at least somewhat done by hand because there are rules such
as 'include linux/spinlock.h to get spinlock_t' (which is actually
defined in linux/spinlock_types.h), but you want people to include
<linux/completion.h> directly rather than rely on it being pulled in
through linux/sched.h, for example.

It's further complicated by multi-file drivers, such as qla2xxx.  Each
file includes qla_def.h which includes a lot of the necessary header
files for them ... but then each file will include a few more header
files that it needs.

So some implicit includes are _good_ and other implicit includes are
_bad_ (as they hurt when trying to rationalise the header files).
Anyone who likes complexity and fuzzy logic like this want to take a
stab at writing such a tool?

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
