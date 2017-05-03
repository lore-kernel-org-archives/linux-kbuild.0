Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:46548 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751176AbdECN3E (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 May 2017 09:29:04 -0400
Subject: Re: [RFC] Increase Minimal GNU Make version for Linux Kernel from
 3.80 to 3.81
References: <CAK7LNAT=jbA1GCp1ztoyjF+CxQHGGgOXEVCzr7+AXKaKQX1deg@mail.gmail.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <c9d67459-674b-e848-5889-914c4fb54708@suse.com>
Date: Wed, 3 May 2017 15:29:01 +0200
MIME-Version: 1.0
In-Reply-To: <CAK7LNAT=jbA1GCp1ztoyjF+CxQHGGgOXEVCzr7+AXKaKQX1deg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Thierry Reding <treding@nvidia.com>, Ingo Molnar <mingo@kernel.org>, Jan Beulich <jbeulich@suse.com>

On 2017-05-03 08:46, Masahiro Yamada wrote:
> Hello Linus and Kbuild developers.
> 
> 
> Documentation/process/changes.rst says the minimal version
> of GNU Make is 3.80, but actually building the kernel
> with this version has been broken for a long time.
> 
> Specifically, it got broken by commit c8589d1e9e01 (i.e. Linux 3.18).
> Sorry, it's me who broke it.
> 
> Here is my excuse:
> - It is almost 3 years since then, but nobody complained about it.
> - GNU Make 3.80 is almost 15 years old.
>   (Even GNU Make 3.81 was released in 2006.)
> - People seldom test their makefiles on such old GNU Make version,
>   so they often use some features that are not supported by version 3.80.

Agreed. It's not just the kbuild change that broke it, but as you say,
new make features tend creep into random Makefiles. So I'm fine
adjusting the documentation to match reality.

Adding Jan Beulich to Cc, who to fix these cases in the past.

Michal

