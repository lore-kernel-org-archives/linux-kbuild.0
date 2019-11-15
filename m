Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.skyhub.de ([5.9.137.197]:50830 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725829AbfKOIix (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Nov 2019 03:38:53 -0500
Date: Fri, 15 Nov 2019 09:38:47 +0100
From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] mm/vmalloc: Fix regression caused by needless
 vmalloc_sync_all()
Message-ID: <20191115083847.GB18929@zn.tnic>
References: <20191113095530.228959-1-shile.zhang@linux.alibaba.com>
 <20191114171231.GA21753@suse.de>
 <20191114160108.57a72907f7b1aa9860471a06@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191114160108.57a72907f7b1aa9860471a06@linux-foundation.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Joerg Roedel <jroedel@suse.de>, Shile Zhang <shile.zhang@linux.alibaba.com>, linux-mm@kvack.org, linux-kbuild@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, hpa@zytor.com

On Thu, Nov 14, 2019 at 04:01:08PM -0800, Andrew Morton wrote:
> It's fairly urgent - I consider this to be -stable material.
> 
> Thomas & co, was that a deliberate skip?

More like lost in the mail flood. I'm assuming you're taking it?

In any case, patch looks ok to me - the "unmappings" naming sounds like
coming from someone with a very wild phantasy... :-)

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
