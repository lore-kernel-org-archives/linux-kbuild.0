Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f172.google.com ([209.85.210.172]:38101 "EHLO
        mail-pf1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725905AbfKRCas (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 Nov 2019 21:30:48 -0500
Received: by mail-pf1-f172.google.com with SMTP id c13so9596624pfp.5
        for <linux-kbuild@vger.kernel.org>; Sun, 17 Nov 2019 18:30:46 -0800 (PST)
Subject: Re: building individual files in subdirectories
References: <20190528121148.GA18162@lst.de>
 <CAK7LNAQRW+phJrdR-5NfUE9L09O-nRiimfW5rB8Y8S9POtkxCA@mail.gmail.com>
 <CAK7LNAQFy=AfJtk4GT+FL=Kzcf6Ev=keKoUz_7Le7iZOQEc90g@mail.gmail.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <a08ab4f0-d500-331b-da70-388e6244bc67@kernel.dk>
Date: Sun, 17 Nov 2019 19:30:42 -0700
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQFy=AfJtk4GT+FL=Kzcf6Ev=keKoUz_7Le7iZOQEc90g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Christoph Hellwig <hch@lst.de>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 11/17/19 5:15 PM, Masahiro Yamada wrote:
> Hi Jens,
> 
> 
> (related to  https://lkml.org/lkml/2019/11/15/1152)
> 
> 
> I received questions about single builds not working properly
> some times in the past.
> 
> For example, the following is a post from Christoph to kbuild ML,
> and my reply to it.

I'm not saying it isn't useful, what I'm saying is that slowing
things down by almost 100% seems excessive!

-- 
Jens Axboe
