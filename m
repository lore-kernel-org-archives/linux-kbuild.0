Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:50618 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751560AbbDJVgb (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 10 Apr 2015 17:36:31 -0400
Date: Fri, 10 Apr 2015 14:36:29 -0700
From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] lto: Add __noreorder and mark initcalls __noreorder
Message-Id: <20150410143629.aaba355c08d3b71e5c1cddd0@linux-foundation.org>
In-Reply-To: <20150408235023.GT2366@two.firstfloor.org>
References: <1428499058-8322-1-git-send-email-andi@firstfloor.org>
	<20150408153112.bd375a883138f4c9fd319645@linux-foundation.org>
	<20150408235023.GT2366@two.firstfloor.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: mmarek@suse.cz, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Kleen <ak@linux.intel.com>, hubicka@ucw.cz

On Thu, 9 Apr 2015 01:50:23 +0200 Andi Kleen <andi@firstfloor.org> wrote:

> > Head is spinning a bit.  As this all appears to be shiny new
> > added-by-andi gcc functionality, it would be useful if we could have a
> > few more words describing what it's all about.  Reordering of what with
> > respect to what and why and why is it bad.  Why is gcc reordering
> > things anyway, and what's the downside of preventing this.  Why is the
> > compiler reordering things rather than the linker. etc etc etc.
> 
> Ok, let me try.

That was super-useful, thanks.  I slurped it into the changelog -
maybe one day it will provide material for Documentation/lto-stuff.txt.

Big picture: do you have a feeling for how much benefit LTO will yield
in the kernel, if/when it's all completed?

