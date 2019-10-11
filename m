Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f65.google.com ([209.85.128.65]:36156 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727399AbfJKPnP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 11 Oct 2019 11:43:15 -0400
Received: by mail-wm1-f65.google.com with SMTP id m18so10688631wmc.1
        for <linux-kbuild@vger.kernel.org>; Fri, 11 Oct 2019 08:43:14 -0700 (PDT)
Date: Fri, 11 Oct 2019 16:43:11 +0100
From: Matthias Maennich <maennich@google.com>
Subject: Re: [PATCH 4/4] export: avoid code duplication in
 include/linux/export.h
Message-ID: <20191011154311.GA192647@google.com>
References: <20191010151443.7399-1-maennich@google.com>
 <20191010151443.7399-5-maennich@google.com>
 <20191011153127.GA1283883@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20191011153127.GA1283883@kroah.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com, Jessica Yu <jeyu@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Martijn Coenen <maco@android.com>, Lucas De Marchi <lucas.de.marchi@gmail.com>, Shaun Ruffell <sruffell@sruffell.net>, Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>

On Fri, Oct 11, 2019 at 05:31:27PM +0200, Greg Kroah-Hartman wrote:
>On Thu, Oct 10, 2019 at 04:14:43PM +0100, Matthias Maennich wrote:
>> Now that the namespace value is not part of the __ksymtab entry name
>> anymore, we can simplify the implementation of EXPORT_SYMBOL*. By
>> allowing the empty string "" to represent 'no namespace', we can unify
>> the implementation and drop a lot redundant code.  That increases
>> readability and maintainability.
>>
>> As Masahiro pointed out earlier,
>> "The drawback of this change is, it grows the code size. When the symbol
>> has no namespace, sym->namespace was previously NULL, but it is now am
>> empty string "". So, it increases 1 byte for every no namespace
>> EXPORT_SYMBOL. A typical kernel configuration has 10K exported symbols,
>> so it increases 10KB in rough estimation."
>
>10Kb of non-swapable memory isn't good.  But if you care about that, you
>can get it back with the option to compile away any non-used symbols,
>and that shouldn't be affected by this change, right?

Rasmus suggested to put the 'aMS' flags on the __ksymtab_strings section
to mitigate this:
https://lore.kernel.org/lkml/f2e28d6b-77c5-5fe2-0bc4-b24955de9954@rasmusvillemoes.dk/

I was not yet able to properly test this, so I did not include it in
this series. As I said in the cover letter, this 4th patch might be
optional for 5.4. So, we could defer it to a later time when we have
addressed that properly.

Cheers,
Matthias

>
>That being said, the code is a lot cleaner, so I have no objection to
>it.
>
>Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
