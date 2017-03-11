Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:62072 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750954AbdCKFpp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 11 Mar 2017 00:45:45 -0500
MIME-Version: 1.0
In-Reply-To: <132b313f-ac2d-be4d-8ab7-84b114041722@suse.com>
References: <CAK7LNASmP6bsQcru5XoqgxsuznjK0JMwff96TRn3F_=hOUU6qA@mail.gmail.com>
 <dd914266-6ea1-3dd7-0531-0335bf3f723c@suse.com> <20170310201702.47b0a523@canb.auug.org.au>
 <132b313f-ac2d-be4d-8ab7-84b114041722@suse.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 11 Mar 2017 14:45:01 +0900
Message-ID: <CAK7LNAS+YHOgPG4y6x6L+Cc0A2=kH9Ndtc0gVMKtX5UgtLk_9g@mail.gmail.com>
Subject: Re: Kbuild maintainership
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>

Hi Michal,

2017-03-10 19:15 GMT+09:00 Michal Marek <mmarek@suse.com>:
> On 2017-03-10 10:17, Stephen Rothwell wrote:
>> I assume that I will get a request to change the kbuild-current and
>> kbuilt trees in linux-next soon.  In the meantime, should I remove the
>> current ones?
>
> There is one genksyms fix in kbuild.git#kbuild which is not in mainline.
> Masahiro, can you please pull it into your tree and give Stephen the url
> and branches?


Pulled into the (new)  linux-kbuild/kbuild





-- 
Best Regards
Masahiro Yamada
