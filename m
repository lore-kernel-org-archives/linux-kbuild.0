Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:51203 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751101AbbFKNfE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 11 Jun 2015 09:35:04 -0400
Date: Thu, 11 Jun 2015 15:35:01 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] kbuild: include core debug info when DEBUG_INFO_REDUCED
Message-ID: <20150611133501.GA23573@sepie.suse.cz>
References: <1426902601-13524-1-git-send-email-linux@rasmusvillemoes.dk>
 <87eglie87j.fsf@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87eglie87j.fsf@rasmusvillemoes.dk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jun 11, 2015 at 02:32:48PM +0200, Rasmus Villemoes wrote:
> On Sat, Mar 21 2015, Rasmus Villemoes <linux@rasmusvillemoes.dk> wrote:
> 
> > With CONFIG_DEBUG_INFO_REDUCED, we do get quite a lot of debug info
> > (around 22.7 MB for a defconfig+DEBUG_INFO_REDUCED). However, the
> > "basenames must match" rule used by -femit-struct-debug-baseonly
> > option means that we miss some core data structures, such as struct
> > {device, file, inode, mm_struct, page} etc.
> >
> > We can easily get these included as well, while still getting the
> > benefits of CONFIG_DEBUG_INFO_REDUCED (faster build times and smaller
> > individual object files): All it takes is a dummy translation unit
> > including a few strategic headers and compiled with a flag overriding
> > -femit-struct-debug-baseonly.
> >
> > This increases the size of .debug_info by ~0.3%, but these 90 KB
> > contain some rather useful info.
> >
> 
> Any comments on this patch? I know it's a little hacky, but I do find it
> rather useful. For example, I just noticed that pahole shows this

I applied it to kbuild.git#kbuild now. It indeed can be quite useful.

Michal
