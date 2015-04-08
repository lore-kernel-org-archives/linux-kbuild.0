Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:60339 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754222AbbDHWbN (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 8 Apr 2015 18:31:13 -0400
Date: Wed, 8 Apr 2015 15:31:12 -0700
From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] lto: Add __noreorder and mark initcalls __noreorder
Message-Id: <20150408153112.bd375a883138f4c9fd319645@linux-foundation.org>
In-Reply-To: <1428499058-8322-1-git-send-email-andi@firstfloor.org>
References: <1428499058-8322-1-git-send-email-andi@firstfloor.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: mmarek@suse.cz, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Kleen <ak@linux.intel.com>

On Wed,  8 Apr 2015 06:17:38 -0700 Andi Kleen <andi@firstfloor.org> wrote:

> From: Andi Kleen <ak@linux.intel.com>
> 
> gcc 5 has a new no_reorder attribute that prevents top level
> reordering only for that symbol.

I'm having trouble locating gcc documentation which explains all this
stuff.

> Kernels don't like any reordering of initcalls between files, as several
> initcalls depend on each other. LTO previously needed to use
> -fno-toplevel-reordering to prevent boot failures.

That's "-fno-toplevel-reorder", I believe?

> Add a __noreorder wrapper for the no_reorder attribute and use
> it for initcalls.

Head is spinning a bit.  As this all appears to be shiny new
added-by-andi gcc functionality, it would be useful if we could have a
few more words describing what it's all about.  Reordering of what with
respect to what and why and why is it bad.  Why is gcc reordering
things anyway, and what's the downside of preventing this.  Why is the
compiler reordering things rather than the linker. etc etc etc.

Please gently educate us ;)

