Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.skyhub.de ([5.9.137.197]:39236 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727532AbfKPRi0 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 16 Nov 2019 12:38:26 -0500
Date: Sat, 16 Nov 2019 18:38:20 +0100
From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] mm/vmalloc: Fix regression caused by needless
 vmalloc_sync_all()
Message-ID: <20191116173820.GB23231@zn.tnic>
References: <20191113095530.228959-1-shile.zhang@linux.alibaba.com>
 <20191114171231.GA21753@suse.de>
 <20191114160108.57a72907f7b1aa9860471a06@linux-foundation.org>
 <20191115083847.GB18929@zn.tnic>
 <20191115153721.c869afe6e7564877b848c69d@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191115153721.c869afe6e7564877b848c69d@linux-foundation.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Joerg Roedel <jroedel@suse.de>, Shile Zhang <shile.zhang@linux.alibaba.com>, linux-mm@kvack.org, linux-kbuild@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, hpa@zytor.com

On Fri, Nov 15, 2019 at 03:37:21PM -0800, Andrew Morton wrote:
> OK, thanks, here's what I queued.  Reviews, acks and testing, please??
> 
> From: Joerg Roedel <jroedel@suse.de>
> Subject: x86/mm: Split vmalloc_sync_all()
> 
> Commit 3f8fd02b1bf1 ("mm/vmalloc: Sync unmappings in
> __purge_vmap_area_lazy()") introduced a call to vmalloc_sync_all() in the
> vunmap() code-path.  While this change was necessary to maintain
> correctness on x86-32-pae kernels, it also adds additional cycles for
> architectures that don't need it.

...

>  arch/x86/mm/fault.c      |   26 ++++++++++++++++++++++++--
>  drivers/acpi/apei/ghes.c |    2 +-
>  include/linux/vmalloc.h  |    5 +++--
>  kernel/notifier.c        |    2 +-
>  mm/nommu.c               |   10 +++++++---
>  mm/vmalloc.c             |   11 +++++++----
>  6 files changed, 43 insertions(+), 13 deletions(-)

Booting it looks ok here:

Tested-by: Borislav Petkov <bp@suse.de>

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
