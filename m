Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ed1-f68.google.com ([209.85.208.68]:36217 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728921AbeJAS4u (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Oct 2018 14:56:50 -0400
Received: by mail-ed1-f68.google.com with SMTP id f4-v6so13996362edq.3
        for <linux-kbuild@vger.kernel.org>; Mon, 01 Oct 2018 05:19:17 -0700 (PDT)
Subject: Re: [PATCH 0/3] Kbuild: Some fixdep tweaks
References: <20180815142749.18804-1-linux@rasmusvillemoes.dk>
 <CAKwiHFj5yGtsR+s0Ukjy0Pe1pDpd_euyT0MRZdTt0H3ssXqYXQ@mail.gmail.com>
 <CAK7LNATmw1Tic2mDybRd-5CbZK_6J1+=3j31q8K9hONVoRHrdA@mail.gmail.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <0d8735ad-0672-3a76-d199-faf6717af730@rasmusvillemoes.dk>
Date: Mon, 1 Oct 2018 14:19:14 +0200
MIME-Version: 1.0
In-Reply-To: <CAK7LNATmw1Tic2mDybRd-5CbZK_6J1+=3j31q8K9hONVoRHrdA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 2018-09-28 04:21, Masahiro Yamada wrote:
> Hi Rasmus,
> 
> This patch set actually sits on the fence.
> I tend to choose not-apply when I cannot make up my mind.
> 
> If you have something more to convince me, please let me know.

No, that's fine. I agree that the overall performance improvement for
whole kernel builds is hard to measure, but that can be said for many
small optimizations. Anyway, as I said, it's up to you, so let's just
drop it.

Thanks,
Rasmus
