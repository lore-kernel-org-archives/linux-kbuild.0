Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from eu-smtp-delivery-143.mimecast.com ([207.82.80.143]:29718 "EHLO
	eu-smtp-delivery-143.mimecast.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754098AbbCaQ1g convert rfc822-to-8bit
	(ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 31 Mar 2015 12:27:36 -0400
Date: Tue, 31 Mar 2015 17:27:22 +0100
From: Dave Martin <Dave.Martin@arm.com>
Subject: Re: [RFC PATCH 2/2] Kbuild: avoid partial linking of
 drivers/built-in.o
Message-ID: <20150331161026.GA17480@e103592.cambridge.arm.com>
References: <1427716167-25078-1-git-send-email-ard.biesheuvel@linaro.org>
 <1427716167-25078-3-git-send-email-ard.biesheuvel@linaro.org>
 <551943CB.3010303@suse.cz>
 <20150330132617.GI24899@n2100.arm.linux.org.uk>
 <CAKv+Gu8-4XR5D-0_JnVfS2LNkH_Uvcc5txe4wJhwZogc5hZ-1w@mail.gmail.com>
 <551959F1.4030704@suse.cz>
 <CAKv+Gu-gRuf8L+NKtez4Jm9Mqe1HeeufH9MPqRztLcD+NTo+sA@mail.gmail.com>
 <alpine.LFD.2.11.1503311115300.25806@knanqh.ubzr>
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.11.1503311115300.25806@knanqh.ubzr>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, Michal Marek <mmarek@suse.cz>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Tue, Mar 31, 2015 at 11:22:29AM -0400, Nicolas Pitre wrote:
> On Mon, 30 Mar 2015, Ard Biesheuvel wrote:
> 
> > On 30 March 2015 at 16:13, Michal Marek <mmarek@suse.cz> wrote:

[...]

> > > What you could do is to add a Kconfig option to arch/arm/Kconfig adding
> > > -ffunction-sections to the compiler flags. Then allyesconfig would
> > > select it and work around the problem in a somewhat elegant way.
> > >
> > 
> > Excellent idea! Arnd hasn't chimed in yet, but he is the one doing
> > lots and lots of randconfig builds and other test builds, so I will
> > wait for him to confirm that this is a useful thing to have.
> 
> I'm using -ffunction-sections as well for the kernel size reduction work 
> I'm currently doing.  The linker script has to be adapted so .text.* is 
> specified along .text otherwise those functions end up appended at the 
> end of the binary.

Interesting ... do you also mean using --gc-sections at link time?
We'd need to avoid pruning needed code that has no explicit caller,
and functions that are part of the kernel/module ABI but not used
within vmlinux.

The GCC docs suggest that -ffunction-sections may impact performance
and/or increase code size, but I don't know by how much.  Maybe it
interferes with inling.

Cheers
---Dave

