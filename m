Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f195.google.com ([209.85.214.195]:46059 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732467AbeKVE2Q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Nov 2018 23:28:16 -0500
Received: by mail-pl1-f195.google.com with SMTP id a14so6523367plm.12
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Nov 2018 09:52:54 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
Date: Wed, 21 Nov 2018 09:52:52 -0800 (PST)
Subject: Re: [PATCH v2 2/2] modpost: skip ELF local symbols by default during
 section mismatch check
In-Reply-To: <CAK7LNAQqpzJcxZBvZY1Bd2sVUwTLg7eD2mq61hDOw6Ek=akdfw@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.9999.1811210950100.18372@viisi.sifive.com>
References: <20181115005602.30746-1-paul.walmsley@sifive.com> <20181115005602.30746-3-paul.walmsley@sifive.com> <CAK7LNAQqpzJcxZBvZY1Bd2sVUwTLg7eD2mq61hDOw6Ek=akdfw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: paul.walmsley@sifive.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, jimw@sifive.com, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Paul Walmsley <paul@pwsan.com>

Hello Masahiro,

On Wed, 21 Nov 2018, Masahiro Yamada wrote:

> I think this is almost good.
> Just a nit.
>
> Maybe, putting this check in secref_whitelist()
> (with a comment "Pattern 6:")
> could look more consistency.
>
>
> Also, if you use strstart() helper,
> you can remove is_local_symbol() function.
>
>
>        /* Check for pattern 6 */
>        if (strstarts(fromsym, ".L"))
>                return 0;
>

Thank you for your suggestion.  This change is a definite improvement. 
The patch has been updated, and I will repost the patch after it's been 
tested.

Best regards,

- Paul
