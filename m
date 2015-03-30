Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ig0-f180.google.com ([209.85.213.180]:37594 "EHLO
	mail-ig0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752781AbbC3NbS (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 30 Mar 2015 09:31:18 -0400
Received: by igcxg11 with SMTP id xg11so72370392igc.0
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Mar 2015 06:31:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150330132617.GI24899@n2100.arm.linux.org.uk>
References: <1427716167-25078-1-git-send-email-ard.biesheuvel@linaro.org>
	<1427716167-25078-3-git-send-email-ard.biesheuvel@linaro.org>
	<551943CB.3010303@suse.cz>
	<20150330132617.GI24899@n2100.arm.linux.org.uk>
Date: Mon, 30 Mar 2015 15:31:17 +0200
Message-ID: <CAKv+Gu8-4XR5D-0_JnVfS2LNkH_Uvcc5txe4wJhwZogc5hZ-1w@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] Kbuild: avoid partial linking of drivers/built-in.o
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>

On 30 March 2015 at 15:26, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Mon, Mar 30, 2015 at 02:38:35PM +0200, Michal Marek wrote:
>> Is this a limitation of a particular ARM ABI or a limitation of a state
>> of the art ARM linker or something else?
>
> It's a limitation of the ARM ISA.
>
> Normal PC-relative branches, which are emitted by the C compiler, can
> branch +/- 32MB for ARM, or +/- 16MB of Thumb.  Beyond that, the address
> offset is not representable in the instruction.
>
> To get around that "modern" linkers are able to insert stubs as
> necessary inbetween the object .text sections to extend the range of
> these branches (by emitting a chunk of code possibly with some data to
> extend the range of the branch.)
>
> Obviously, gcc can't know before hand that the sum total of all the
> small object files is going to cause problems, so the compiler can't
> do this on an "as necessary basis".
>
> For most practical kernels, this is not a problem; they normally fit
> within the PC-relative range.  However, the exception is allyesconfig.
>
> The question is: how far do we go with allyesconfig... do we want it
> to work, or is reaching the final link sufficient?  If we do tweak
> stuff to allow the link to work, are we going to try running it?
>

That is an excellent question, hence the RFC in the subject line.

Note that the other patch, the one against kallsyms, addresses the
issue where the distance between the beginning of .text and the end of
.init.text  exceeds this limit, which is not as unlikely as the issue
that this patch addresses, where just drivers/built-in.o in isolation
already exceeds this limit.

So I am quite happy to drop this, especially as we can add
-ffunction-sections as well. (Haven't tested this myself though: after
building allyesconfig on my poor laptop a couple of times, I am
sending it on a well deserved vacation for the rest of the week)

Thanks,
Ard.
