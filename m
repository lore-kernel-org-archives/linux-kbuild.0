Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46658 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408871AbfJXJfu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 24 Oct 2019 05:35:50 -0400
Received: by mail-wr1-f68.google.com with SMTP id n15so14467481wrw.13
        for <linux-kbuild@vger.kernel.org>; Thu, 24 Oct 2019 02:35:49 -0700 (PDT)
Date: Thu, 24 Oct 2019 10:35:46 +0100
From: Matthias Maennich <maennich@google.com>
Subject: Re: [PATCH v2 0/4] export/modpost: avoid renaming __ksymtab entries
 for symbol namespaces
Message-ID: <20191024093546.GB199239@google.com>
References: <20191010151443.7399-1-maennich@google.com>
 <20191018093143.15997-1-maennich@google.com>
 <20191023122222.GA27861@42.do-not-panic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20191023122222.GA27861@42.do-not-panic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com, Jessica Yu <jeyu@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Martijn Coenen <maco@android.com>, Lucas De Marchi <lucas.de.marchi@gmail.com>, Shaun Ruffell <sruffell@sruffell.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org

On Wed, Oct 23, 2019 at 12:22:22PM +0000, Luis Chamberlain wrote:
>On Fri, Oct 18, 2019 at 10:31:39AM +0100, Matthias Maennich wrote:
>> The introduction of the symbol namespace patches changed the way symbols are
>> named in the ksymtab entries. That caused userland tools to fail (such as
>> kmod's depmod). As depmod is used as part of the kernel build it was worth
>> having another look whether this name change can be avoided.
>
>Why have this as a default feature? What about having an option to
>disable this feature? The benefit being that without a full swing of
>tests to avoid regressions its not clear what other issues may creep
>up. With this as optional, those wanting the mechanism can enable it
>and happilly find the issues for those more conservative.

The strongest argument against that is, that the 'conservative' people
would constantly break things for the more 'adventurous' ones. They
would introduce namespace requirements by just using symbols without
correctly adjusting the imports.

Second, vmlinux and modules would have to be compiled in the same
configuration. Otherwise they are incompatible and we would likely have
to maintain code in the module loader to catch issues caused by that.
In general, I think for the adoption of this feature and one of its
purposes - making unexpected use of symbols across the tree visible
already at review time - we should not make this an optional one.
Enforcing the imports at module load time is optional (there is an
option).

And finally, having that code configurable for both options introduces
quite some complexity in kernel/module.c, modpost and
include/linux/export.h that would make the code hard to maintain and
complex to test. Hence that would likely introduce more issues.

I know the feature came with some rough edges. Sorry about that. I
think, we got most of them worked out pretty well (big thanks to
Masahiro and Jessica and others helping with that). Now the actual
change to the surface exposed to userland tools is much smaller and the
feature itself less intrusive.

Cheers,
Matthias

>
>  Luis
