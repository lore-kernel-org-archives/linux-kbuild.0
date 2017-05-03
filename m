Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from prv-mh.provo.novell.com ([137.65.248.74]:46201 "EHLO
        prv-mh.provo.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751176AbdECNmK (ORCPT
        <rfc822;groupwise-linux-kbuild@vger.kernel.org:9:1>);
        Wed, 3 May 2017 09:42:10 -0400
Message-Id: <5909FA4D0200007800156620@prv-mh.provo.novell.com>
Date: Wed, 03 May 2017 07:42:05 -0600
From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [RFC] Increase Minimal GNU Make version for Linux Kernel
 from 3.80 to 3.81
References: <CAK7LNAT=jbA1GCp1ztoyjF+CxQHGGgOXEVCzr7+AXKaKQX1deg@mail.gmail.com>
 <c9d67459-674b-e848-5889-914c4fb54708@suse.com>
In-Reply-To: <c9d67459-674b-e848-5889-914c4fb54708@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <MMarek@suse.com>
Cc: Ingo Molnar <mingo@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, Thierry Reding <treding@nvidia.com>, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

>>> On 03.05.17 at 15:29, <MMarek@suse.com> wrote:
> On 2017-05-03 08:46, Masahiro Yamada wrote:
>> Hello Linus and Kbuild developers.
>> 
>> 
>> Documentation/process/changes.rst says the minimal version
>> of GNU Make is 3.80, but actually building the kernel
>> with this version has been broken for a long time.
>> 
>> Specifically, it got broken by commit c8589d1e9e01 (i.e. Linux 3.18).
>> Sorry, it's me who broke it.
>> 
>> Here is my excuse:
>> - It is almost 3 years since then, but nobody complained about it.
>> - GNU Make 3.80 is almost 15 years old.
>>   (Even GNU Make 3.81 was released in 2006.)
>> - People seldom test their makefiles on such old GNU Make version,
>>   so they often use some features that are not supported by version 3.80.
> 
> Agreed. It's not just the kbuild change that broke it, but as you say,
> new make features tend creep into random Makefiles. So I'm fine
> adjusting the documentation to match reality.
> 
> Adding Jan Beulich to Cc, who to fix these cases in the past.

Thanks for asking. As I don't recall having run into the specific
problem mentioned above, I suppose I've given up at some
point and forced the use of a newer make even on those very
old distros that I tend to build / test stuff on every once in a
while. IOW I guess I'm fine with the proposed change, and I
can help myself if nevertheless needed.

Jan

