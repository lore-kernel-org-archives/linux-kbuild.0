Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:33108 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755756AbcK3TAv (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 30 Nov 2016 14:00:51 -0500
Subject: Re: Odd build breakage in 4.9-rc7
References: <20161130172435.GG8563@redhat.com>
 <CA+55aFz0f6ykvWt+f0ALD62mngJuTrjNY8CQLK3qNAuYUzMeDw@mail.gmail.com>
 <583F1A5A.7040708@redhat.com>
 <CA+55aFyPhpYQR-a+PNcDSNBTaRk5CeWAwynSp2QUcStfWazTZA@mail.gmail.com>
 <583F1F6A.5010307@redhat.com>
From: Jarod Wilson <jarod@redhat.com>
Message-ID: <4c19815a-98c2-15f4-d04d-9baabfa94e10@redhat.com>
Date: Wed, 30 Nov 2016 14:00:49 -0500
MIME-Version: 1.0
In-Reply-To: <583F1F6A.5010307@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Prarit Bhargava <prarit@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tony Luck <tony.luck@intel.com>, zarniwhoop73@googlemail.com, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On 2016-11-30 1:50 PM, Prarit Bhargava wrote:
>
> On 11/30/2016 01:36 PM, Linus Torvalds wrote:
>> On Wed, Nov 30, 2016 at 10:28 AM, Prarit Bhargava <prarit@redhat.com> wrote:
>> ]>
>>> In my case I tracked this to commit 3637efb00864 ("x86/mce: Add PCI quirks to
>>> identify Xeons with machine check recovery") which adds the include for
>>> generated/autoksyms.h.
>>
>> Ok, that at least makes some sense. The other blamed commit did not
>> seem to possibly make a difference.
>>
>>> Searching LKML and I came across a report from Ken Moffat from a month ago:
>>>
>>> http://marc.info/?l=linux-kernel&m=147794681124332&w=2
>>
>> Does a "make clean" get rid of it forever? Or does it come back?
>
> It comes back.  The steps to reproduce this are:
>
> 1.  checkout latest linux.git
> 2.  make -j112
>
> (IOW, it occurs 100% of the time for me on a clean tree.)
>
> To work around the bug I have to do
>
> 1.  checkout latest linux.git
> 2.  comment out the include for generated/autoksyms.h at include/linux/export.h:81
> 3.  compile with -j112
>
> This fails loudly, but then I do
>
> 4.  uncomment the include for generated/autoksyms.h at include/linux/export.h:81
> 5.  make -j112
>
> and this completes with a bootable kernel AFAICT.

In my case, I first noticed this with rpm builds, which are unpacking a 
tarball every time. I did have ccache installed, but have removed it, to 
no avail. I still get this failure. Reverting these three patches...

9a6fb28a355d2609ace4dab4e6425442c647894d
3637efb00864f465baebd49464e58319fd295b65
ffb173e657fa8123bffa2a169e124b4bca0b5bc4

...gets me a working build every time. So I'm not so sure these patches 
are completely innocent. They may not be directly at fault, but 
certainly seem to be involved in causing things to get tripped up.

>> If it's a one-time dependency issue that is because some header
>> dependency addition that the automatic dependency generator hadn't
>> caught, that might explain a bisection failure too: once the file
>> happens to get rebuilt (and the dependencies re-done), it starts
>> working even though the "happens to be rebuilt" had nothing to do with
>> the original bug.
>
> Hopefully the linux-kbuild folks might be able to point us in the right
> direction for a fix.

Indeed. I'm mostly clueless here. Well, mostly clueless, period, but 
even more so here. And with the CONFIG_MODVERSIONS part of my original 
mail, which I guess I should also re-test with ccache uninstalled...

-- 
Jarod Wilson
jarod@redhat.com
