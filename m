Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from eu-smtp-delivery-143.mimecast.com ([207.82.80.143]:44716 "EHLO
	eu-smtp-delivery-143.mimecast.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751169AbbDAJFH convert rfc822-to-8bit
	(ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 1 Apr 2015 05:05:07 -0400
Date: Wed, 1 Apr 2015 10:04:57 +0100
From: Dave Martin <Dave.Martin@arm.com>
Subject: Re: [RFC PATCH 2/2] Kbuild: avoid partial linking of
 drivers/built-in.o
Message-ID: <20150401090449.GA3602@e103592.cambridge.arm.com>
References: <1427716167-25078-1-git-send-email-ard.biesheuvel@linaro.org>
 <1427716167-25078-3-git-send-email-ard.biesheuvel@linaro.org>
 <551943CB.3010303@suse.cz>
 <20150330132617.GI24899@n2100.arm.linux.org.uk>
 <CAKv+Gu8-4XR5D-0_JnVfS2LNkH_Uvcc5txe4wJhwZogc5hZ-1w@mail.gmail.com>
 <551959F1.4030704@suse.cz>
 <CAKv+Gu-gRuf8L+NKtez4Jm9Mqe1HeeufH9MPqRztLcD+NTo+sA@mail.gmail.com>
 <alpine.LFD.2.11.1503311115300.25806@knanqh.ubzr>
 <20150331161026.GA17480@e103592.cambridge.arm.com>
 <alpine.LFD.2.11.1503311429240.25806@knanqh.ubzr>
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.11.1503311429240.25806@knanqh.ubzr>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Michal Marek <mmarek@suse.cz>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Tue, Mar 31, 2015 at 02:42:24PM -0400, Nicolas Pitre wrote:
> On Tue, 31 Mar 2015, Dave Martin wrote:

[...]

> > We'd need to avoid pruning needed code that has no explicit caller,
> > and functions that are part of the kernel/module ABI but not used
> > within vmlinux.
> 
> Those are usually located in special sections, like the initcall table, 
> the CPU entry table, etc. The linker allows for those sections to be 
> marked with KEEP() not to prune them.

True.  See what breaks, I guess.

> > The GCC docs suggest that -ffunction-sections may impact performance
> > and/or increase code size, but I don't know by how much.  Maybe it
> > interferes with inling.
> 
> It doesn't interfere with inlining. However it impose a section 
> alignment on every function. That still can be overriden though. Also, I 
> suppose that gcc may not assume that calls to a global function that 
> happens to be located in the same C file will be close by anymore, 
> however I don't see this having any impact on ARM code generation.

More veneers may be introduced during linking, and it's likely that
cache/TLB locality would be affected, but I've no idea whether the
impact would be significant.

Cheers
---Dave

