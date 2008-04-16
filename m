Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:56554 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751308AbYDPT2Z (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 16 Apr 2008 15:28:25 -0400
Date: Wed, 16 Apr 2008 21:28:28 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: RFC: run all userspace header through unifdef
Message-ID: <20080416192828.GB3090@uranus.ravnborg.org>
References: <20080416192312.GQ1677@cs181133002.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080416192312.GQ1677@cs181133002.pp.htv.fi>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Adrian Bunk <bunk@kernel.org>
Cc: linux-kbuild@vger.kernel.org

On Wed, Apr 16, 2008 at 10:23:12PM +0300, Adrian Bunk wrote:
> Facts:
> - installing userspace headers is nothing normal users need
> - unifdef is relatively fast
> - we have sometimes patches moving headers from header-y to
>   unifdef-y or the other way round
> 
> Any objections against dropping unifdef-y and simply running all headers 
> through unifdef?
Not from me at least.

I had some optimized version of the check done once - but lost the patch
during an over eager rm -rf (and no backup).
That patch killed unidef-y and ran everything through unidef.

It would be a welcome cleanup to avoid the distinction.
If people resist then we should check for __KERNEL__ in the
header-y files.

	Sam
