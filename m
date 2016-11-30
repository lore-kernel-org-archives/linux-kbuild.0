Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:54162 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932259AbcK3SvF (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 30 Nov 2016 13:51:05 -0500
Message-ID: <583F1F6A.5010307@redhat.com>
Date: Wed, 30 Nov 2016 13:50:18 -0500
From: Prarit Bhargava <prarit@redhat.com>
MIME-Version: 1.0
Subject: Re: Odd build breakage in 4.9-rc7
References: <20161130172435.GG8563@redhat.com> <CA+55aFz0f6ykvWt+f0ALD62mngJuTrjNY8CQLK3qNAuYUzMeDw@mail.gmail.com> <583F1A5A.7040708@redhat.com> <CA+55aFyPhpYQR-a+PNcDSNBTaRk5CeWAwynSp2QUcStfWazTZA@mail.gmail.com>
In-Reply-To: <CA+55aFyPhpYQR-a+PNcDSNBTaRk5CeWAwynSp2QUcStfWazTZA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jarod Wilson <jarod@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tony Luck <tony.luck@intel.com>, zarniwhoop73@googlemail.com, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>



On 11/30/2016 01:36 PM, Linus Torvalds wrote:
> On Wed, Nov 30, 2016 at 10:28 AM, Prarit Bhargava <prarit@redhat.com> wrote:
> ]>
>> In my case I tracked this to commit 3637efb00864 ("x86/mce: Add PCI quirks to
>> identify Xeons with machine check recovery") which adds the include for
>> generated/autoksyms.h.
> 
> Ok, that at least makes some sense. The other blamed commit did not
> seem to possibly make a difference.
> 
>> Searching LKML and I came across a report from Ken Moffat from a month ago:
>>
>> http://marc.info/?l=linux-kernel&m=147794681124332&w=2
> 
> Does a "make clean" get rid of it forever? Or does it come back?

It comes back.  The steps to reproduce this are:

1.  checkout latest linux.git
2.  make -j112

(IOW, it occurs 100% of the time for me on a clean tree.)

To work around the bug I have to do

1.  checkout latest linux.git
2.  comment out the include for generated/autoksyms.h at include/linux/export.h:81
3.  compile with -j112

This fails loudly, but then I do

4.  uncomment the include for generated/autoksyms.h at include/linux/export.h:81
5.  make -j112

and this completes with a bootable kernel AFAICT.

> 
> If it's a one-time dependency issue that is because some header
> dependency addition that the automatic dependency generator hadn't
> caught, that might explain a bisection failure too: once the file
> happens to get rebuilt (and the dependencies re-done), it starts
> working even though the "happens to be rebuilt" had nothing to do with
> the original bug.

Hopefully the linux-kbuild folks might be able to point us in the right
direction for a fix.

P.
