Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from [183.91.158.132] ([183.91.158.132]:51994 "EHLO
        heian.cn.fujitsu.com" rhost-flags-FAIL-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751533AbdHBCQZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Aug 2017 22:16:25 -0400
Subject: Re: [PATCH v4] kbuild: trivial cleanups on the comments
References: <1501587394-32226-1-git-send-email-caoj.fnst@cn.fujitsu.com>
 <CAK7LNASx15Lw_fXhRwCDKjPo15_aD3du7EYhVXRAn4VcEcDd2A@mail.gmail.com>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <5981371C.5060108@cn.fujitsu.com>
Date: Wed, 2 Aug 2017 10:21:16 +0800
MIME-Version: 1.0
In-Reply-To: <CAK7LNASx15Lw_fXhRwCDKjPo15_aD3du7EYhVXRAn4VcEcDd2A@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>, Randy Dunlap <rdunlap@infradead.org>



On 08/02/2017 08:31 AM, Masahiro Yamada wrote:
> Hi.
> 
> 2017-08-01 20:36 GMT+09:00 Cao jin <caoj.fnst@cn.fujitsu.com>:
>> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
>> ---
>> Since this one has not been merged yet and I find more cleanups,
>> so I have v4 out.
>>
>> v3 addressed comments from Masahiro-san and Randy Dunlap.
>> v4 find several more cleanups in Makefile.build worth to be
>>    included into this trivial patch.
> 
> 
> OK, this is a collection of trivial fixes.
> 
> 
> While you are here, could you fix the following as well?
> 
> 
> [1]
> Makefile line 445:
> # Basic helpers built in scripts/
> 
>     scripts/   ->   scripts/basic/
> 
> 
> [2]
> Makefile line 508:
> # install and module_install need also be processed one by one
> 
> 
>    module_install  ->  modules_install
> 
> 

Sure, Masahiro-san, thanks for your reminding.

-- 
Sincerely,
Cao jin


