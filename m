Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.171]:49919 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751448Ab2HVI6T (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 22 Aug 2012 04:58:19 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: RFC: Link Time Optimization support for the kernel
Date: Wed, 22 Aug 2012 08:58:02 +0000
References: <1345345030-22211-1-git-send-email-andi@firstfloor.org>
In-Reply-To: <1345345030-22211-1-git-send-email-andi@firstfloor.org>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <201208220858.03227.arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, mmarek@suse.cz, linux-kbuild@vger.kernel.org, JBeulich@suse.com, akpm@linux-foundation.org

On Sunday 19 August 2012, Andi Kleen wrote:
> 
> This rather large patchkit enables gcc Link Time Optimization (LTO) 
> support for the kernel. 
> 
> With LTO gcc will do whole program optimizations for
> the whole kernel and each module. This increases compile time,
> but can generate faster code.
>     
> LTO allows gcc to inline functions between different files and
> do various other optimization across the whole binary.

This looks quite nice overall. Have you seen other disadvantages
besides bugs and compile time? There are two possible issues that
I can see happening:

* Debuggability: When we get more aggressive optimizations, it
often becomes harder to trace back object code to a specific source
line, which may be a reason for distros not to enable it for their
product kernels in the end because it can make the work of their
support teams harder.

* Stack consumption: If you do more inlining, the total stack usage
of large functions can become higher than what the deepest path through
the same code in the non-inlined version would be. This bites us
more in the kernel than in user applications, which have much more
stack space available.

Have you noticed problems with either of these so far? Do you think
they are realistic concerns or is the LTO implementation good enough
that they would rarely become an issue?

	Arnd
