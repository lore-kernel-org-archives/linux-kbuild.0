Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:34482 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1757838AbcK3S2n (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 30 Nov 2016 13:28:43 -0500
Message-ID: <583F1A5A.7040708@redhat.com>
Date: Wed, 30 Nov 2016 13:28:42 -0500
From: Prarit Bhargava <prarit@redhat.com>
MIME-Version: 1.0
Subject: Re: Odd build breakage in 4.9-rc7
References: <20161130172435.GG8563@redhat.com> <CA+55aFz0f6ykvWt+f0ALD62mngJuTrjNY8CQLK3qNAuYUzMeDw@mail.gmail.com>
In-Reply-To: <CA+55aFz0f6ykvWt+f0ALD62mngJuTrjNY8CQLK3qNAuYUzMeDw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, Jarod Wilson <jarod@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tony Luck <tony.luck@intel.com>, zarniwhoop73@googlemail.com, linux-kbuild@vger.kernel.org



On 11/30/2016 01:18 PM, Linus Torvalds wrote:
> On Wed, Nov 30, 2016 at 9:24 AM, Jarod Wilson <jarod@redhat.com> wrote:
>>
>> Now, if I omit the -j8 and do a single-threaded build, then things work
>> fine. Prarit bisected this failure to commit
>> 9a6fb28a355d2609ace4dab4e6425442c647894d, and indeed, when reverting that
>> patch and the two that follow it from rc7, parallel make works again.
> 
> I seriously doubt that commit really makes a difference, and I think
> it was just random luck.
> 
> Do you perhaps have ccache installed?
> 
> Because ccache at some point broke dependency generation of "gcc -MM"
> that the kernel build system uses, giving those random "No such file"
> build errors.
> 
> Try uninstalling ccache and see if that helps.
> 

I reported this last week on LKML and I'm building on a freshly installed
systems that do not have ccache installed.

For example,

[root@intel-brickland-04 linux]# rpm -q ccache
package ccache is not installed
[root@intel-brickland-04 linux]# which ccache
/usr/bin/which: no ccache in
(/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/usr/libexec/git-core:/root/bin)

In my case I tracked this to commit 3637efb00864 ("x86/mce: Add PCI quirks to
identify Xeons with machine check recovery") which adds the include for
generated/autoksyms.h.

Searching LKML and I came across a report from Ken Moffat from a month ago:

http://marc.info/?l=linux-kernel&m=147794681124332&w=2

Also cc'ing linux-kbuild.

P.

>               Linus
> 
