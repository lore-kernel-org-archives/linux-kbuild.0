Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:35367 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2999256AbdD1QN1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Apr 2017 12:13:27 -0400
MIME-Version: 1.0
In-Reply-To: <59035E93.2060106@gmail.com>
References: <1493165394-29367-1-git-send-email-frowand.list@gmail.com>
 <1493165394-29367-3-git-send-email-frowand.list@gmail.com>
 <CAMuHMdWLhLqjNgz6iUOY8LY1Jjn3-_iV2ncbOxYLCLZbf=Rz+w@mail.gmail.com> <59035E93.2060106@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 28 Apr 2017 18:13:20 +0200
Message-ID: <CAMuHMdV=CsR9-VXw-M4yNUaBj_x0UCv-ic_YTz2xGxNZjUv5XA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] of: Add unit tests for applying overlays
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Frank Rowand <frowand.list@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, stephen.boyd@linaro.org, Michal Marek <mmarek@suse.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

Hi Frank,

On Fri, Apr 28, 2017 at 5:24 PM, Frank Rowand <frowand.list@gmail.com> wrote:
> On 04/28/17 04:25, Geert Uytterhoeven wrote:
>> On Wed, Apr 26, 2017 at 2:09 AM,  <frowand.list@gmail.com> wrote:
>>>  create mode 100644 drivers/of/unittest-data/overlay.dts
>>>  create mode 100644 drivers/of/unittest-data/overlay_bad_phandle.dts
>>>  create mode 100644 drivers/of/unittest-data/overlay_base.dts
>>
>> Shouldn't these be called .dtso instead of .dts?
>
> That is a good question.  I'm not worried about solving it this week for
> this patch, because this could turn into a bikeshed and I can always
> fix it with a patch if we decide to change.  But if we do want to change
> the naming, I would like to make the decision in the next couple of
> months.  I would like to see more progress on overlays in general
> this summer, and plan to be working on them myself.
>
> I _think_ there has been some discussion about source file naming on the
> devicetree-compiler or devicetree list in the far distant past.  Or I
> may just be mis-remembering.
>
> As far as I know, the current dtc does not know any suffixes other than
> .dts for source files.  Not that the compiler has to know, we can always
> specify '-I dts'.

That's not an obstacle, though. I've been compiling .dtso files into .dtbo
files for several years, cfr.
https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/renesas-overlays

According to "make V=1", the kernel build system basically uses

    ./scripts/dtc/dtc -O dtb -o <file>.dtbo <file>.dtbo.dts.tmp

with <file>.dtbo.dts.tmp the preprocessed .dtso files.
And dtc copes fine with that.

>>> --- a/drivers/of/unittest-data/Makefile
>>> +++ b/drivers/of/unittest-data/Makefile
>>
>>> +# enable creation of __symbols__ node
>>> +DTC_FLAGS_overlay := -@
>>> +DTC_FLAGS_overlay_bad_phandle := -@
>>> +DTC_FLAGS_overlay_base := -@
>>
>> This flag is needed for all DTs that will be involved with overlays.
>>
>> Hence what about enabling this globally instead, cfr. "Enable DT symbols when"
>> CONFIG_OF_OVERLAY is used
>> ("http://www.spinics.net/lists/devicetree/msg103363.html")?
>
> And another really good question.
>
> There are some issues.  I have thought about it enough to know there are issues,
> but do not have a solution and do not think I know all the issues.  Some
> possible issues (or perceived issues) are:
>
> - The size of __symbols__ in an FDT (akd compile .dtb image) in either a kernel
>   image or a bootloader if overlays are not actually needed on a given system
>   (even if the system is physically capable of using overlays).

What do you mean with "physically capable of using overlays"?
The presence of expansion connectors, like Raspberry Pi and BeagleBone Black?

Even lacking such connectors, an overlay could add hardware description that
was just missing (forgotten, or lack of DT bindings) when the main DTB was
built.

I agree about the size, but you never know in advance if an overlay will
be used or needed later.

> - The size of __symbols__ in kernel memory if overlays are not actually needed
>   on a given system (even if the system is physically capable of using overlays.)
>   This could be possibly be enabled/disabled by a boot command, even if
>   __symbols__ is in the FDT.

Agreed.  Not allowing overlays is akin to not allowing to load (more) kernel
modules, and may increase security.

> - A base FDT might want to have __symbols__ included with the expectation that
>   overlays will be used in the future.  (The FDT might be built for the boot
>   loader, then be stable for many kernel releases.)
>
> - Should the creation of __symbols__ be a global switch, or should it be
>   controlled on a per dtb basis?  Or a combination of both?

So you want to decouple OF overlay support in the Linux kernel from
__symbols__ present in the DTBs built?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
