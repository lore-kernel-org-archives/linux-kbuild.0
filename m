Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ot0-f195.google.com ([74.125.82.195]:46474 "EHLO
        mail-ot0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751902AbeA0O0Y (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Jan 2018 09:26:24 -0500
MIME-Version: 1.0
In-Reply-To: <20180127005554.GM26209@tassilo.jf.intel.com>
References: <20171127213423.27218-1-andi@firstfloor.org> <20171127213423.27218-21-andi@firstfloor.org>
 <CAK8P3a3RQhiEkh6uUjdX-juXggNdZxvxRPJbE6M3e6Dy-ycGxw@mail.gmail.com> <20180127005554.GM26209@tassilo.jf.intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 27 Jan 2018 15:26:23 +0100
Message-ID: <CAK8P3a2koJV=ncMa=5fkQXV=Jj6CnScy-nN2gsfHiAeeePsHPA@mail.gmail.com>
Subject: Re: [PATCH 20/21] Kbuild, lto: Add Link Time Optimization support
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <ak@linux.intel.com>
Cc: Andi Kleen <andi@firstfloor.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>, samitolvanen@google.com, alxmtvv@gmail.com, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Andrew Morton <akpm@linux-foundation.org>

On Sat, Jan 27, 2018 at 1:55 AM, Andi Kleen <ak@linux.intel.com> wrote:
> On Sat, Jan 27, 2018 at 01:15:49AM +0100, Arnd Bergmann wrote:
>> On Mon, Nov 27, 2017 at 10:34 PM, Andi Kleen <andi@firstfloor.org> wrote:
>> > From: Andi Kleen <ak@linux.intel.com>
>> > - Add a new LDFINAL variable that controls the final link
>> > for vmlinux or module. In this case we call gcc-ld instead
>> > of ld, to run the LTO step.
>>
>> When I tried this out on allmodconfig (following the lwn article), I ran into
>> a number of warnings:
>
> Thanks for testing. Yes it's a known issue: during one module build
> when modpost looks at the file it is still in LTO format, and
> modpost doesn't understand the LTO symbol table. I had a patch
> to teach it to it at some point, but it got lost somewhere.
> The LLVM LTO patchkit has a different solution that actually
> fixes the sequence to run modpost only after a LTO final link,
> but I haven't gotten around to port that one.
>
> It seems to work already for the single file modules.

Ok, I see. I've turned off that warning now for testing.

What about this one:

kallsyms failure: relative symbol value 0xffffffff81000000 out of
range in relative mode

I seem to get that all the time here, and have also disabled it for now,
but it sounds important (and breaks the build).

      Arnd
