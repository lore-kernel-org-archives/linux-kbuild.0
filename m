Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:48903 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751206AbdCMKkj (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Mar 2017 06:40:39 -0400
Subject: Re: Kbuild maintainership
References: <CAK7LNASmP6bsQcru5XoqgxsuznjK0JMwff96TRn3F_=hOUU6qA@mail.gmail.com>
 <dd914266-6ea1-3dd7-0531-0335bf3f723c@suse.com>
 <20170310201702.47b0a523@canb.auug.org.au>
 <132b313f-ac2d-be4d-8ab7-84b114041722@suse.com>
 <CAK7LNAS+YHOgPG4y6x6L+Cc0A2=kH9Ndtc0gVMKtX5UgtLk_9g@mail.gmail.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <618aa552-8096-d350-e265-b6da26fb94a3@suse.com>
Date: Mon, 13 Mar 2017 11:40:35 +0100
MIME-Version: 1.0
In-Reply-To: <CAK7LNAS+YHOgPG4y6x6L+Cc0A2=kH9Ndtc0gVMKtX5UgtLk_9g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>

On 2017-03-11 06:45, Masahiro Yamada wrote:
> Hi Michal,
> 
> 2017-03-10 19:15 GMT+09:00 Michal Marek <mmarek@suse.com>:
>> On 2017-03-10 10:17, Stephen Rothwell wrote:
>>> I assume that I will get a request to change the kbuild-current and
>>> kbuilt trees in linux-next soon.  In the meantime, should I remove the
>>> current ones?
>>
>> There is one genksyms fix in kbuild.git#kbuild which is not in mainline.
>> Masahiro, can you please pull it into your tree and give Stephen the url
>> and branches?
> 
> 
> Pulled into the (new)  linux-kbuild/kbuild

Thank you!

Michal

