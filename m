Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:60992 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726708AbfJBS5I (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Oct 2019 14:57:08 -0400
Date: Wed, 2 Oct 2019 20:57:02 +0200
From: Jessica Yu <jeyu@kernel.org>
Subject: Re: [PATCH 0/7] module: various bug-fixes and clean-ups for module
 namespace
Message-ID: <20191002185701.GA29041@linux-8ccs>
References: <20190927093603.9140-1-yamada.masahiro@socionext.com>
 <20190927134108.GC187147@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20190927134108.GC187147@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Maennich <maennich@google.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joel Fernandes <joel@joelfernandes.org>, Martijn Coenen <maco@android.com>, Will Deacon <will.deacon@arm.com>, Michal Marek <michal.lkml@markovi.net>, Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

+++ Matthias Maennich [27/09/19 14:41 +0100]:
>On Fri, Sep 27, 2019 at 06:35:56PM +0900, Masahiro Yamada wrote:
>>
>>I was hit by some problems caused by the module namespace feature
>>that was merged recently. At least, the breakage of
>>external module builds is a fatal one. I just took a look at the code
>>closer, and I noticed some more issues and improvements.
>>
>>I hope these patches are mostly OK.
>>The 4th patch might have room for argument since it is a trade-off
>>of "cleaner implermentation" vs "code size".
>>
>Thanks Masahiro for taking the time to improve the implementation of the
>symbol namespaces. These are all good points that you addressed!

Agreed, thanks Masahiro for fixing up all the rough edges! Your series
of fixes look good to me, I will queue this up on modules-next this
week with the exception of patch 4 - Matthias, you are planning to
submit a patch that would supercede patch 04/07, right?

Thanks!

Jessica
