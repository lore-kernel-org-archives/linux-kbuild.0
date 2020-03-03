Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33176 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728257AbgCCJuL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Mar 2020 04:50:11 -0500
Received: by mail-lj1-f194.google.com with SMTP id f13so2820716ljp.0
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Mar 2020 01:50:09 -0800 (PST)
Subject: Re: eh_frame confusion
References: <3b00b45f-74b5-13e3-9a98-c3d6b3bb7286@rasmusvillemoes.dk>
 <1583168442.ovqnxu16tp.naveen@linux.ibm.com>
 <1583169883.zo43kx69lm.naveen@linux.ibm.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <9c9f79e3-d355-1c8a-fb5b-169aab2945da@rasmusvillemoes.dk>
Date: Tue, 3 Mar 2020 10:50:06 +0100
MIME-Version: 1.0
In-Reply-To: <1583169883.zo43kx69lm.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>, Segher Boessenkool <segher@kernel.crashing.org>

On 02/03/2020 18.32, Naveen N. Rao wrote:
> Naveen N. Rao wrote:
>> Michael opened a task to look into this recently and I had spent some
>> time last week on this. The original commit/discussion adding
>> -fno-dwarf2-cfi-asm refers to R_PPC64_REL32 relocations not being
>> handled by our module loader:
>> http://lkml.kernel.org/r/20090224065112.GA6690@bombadil.infradead.org
>>
>> However, that is now handled thanks to commit 9f751b82b491d:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9f751b82b491d
>>
>>
>> I did a test build and a simple module loaded fine, so I think
>> -fno-dwarf2-cfi-asm is not required anymore, unless Michael has seen
>> some breakages with it. Michael?
>>
>>>
>>> but prior to gcc-8, .eh_frame didn't seem to get generated anyway.
>>>
>>> Can .eh_frame sections be discarded for modules (on ppc32 at least), or
>>> is there some magic that makes them necessary when building with gcc-8?
>>
>> As Segher points out, it looks like we need to add
>> -fno-asynchronous-unwind-tables. Most other architectures seem to use
>> that too.

Yes. Thanks, Segher, that explains that part.

> Can you check if the below patch works? I am yet to test this in more
> detail, but would be good to know the implications for ppc32.

I'll see if that produces a bootable kernel, but I think I'd prefer a
more piecemeal approach.

One patch to add -fno-asynchronous-unwind-tables (given that other
arches do it unconditionally I don't think cc-option is needed), with a
commit log saying something like "no-op for gcc < 8, prevents .eh_frame
sections that are discarded anyway for vmlinux and waste disk space for
modules". Then another patch can get rid of -fno-dwarf2-cfi-asm if
that's no longer required.

Rasmus
