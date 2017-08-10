Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.cn.fujitsu.com ([183.91.158.132]:60045 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1752389AbdHJNpT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Aug 2017 09:45:19 -0400
Subject: Re: [PATCH] fixdep: trivial: typo fix and correction
References: <1502198450-7374-1-git-send-email-caoj.fnst@cn.fujitsu.com>
 <CAK7LNATGat99BK_N9SiyogotLcXFA5P__G-aV6jW+sEw-TGbvA@mail.gmail.com>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <598C64A6.2090109@cn.fujitsu.com>
Date: Thu, 10 Aug 2017 21:50:30 +0800
MIME-Version: 1.0
In-Reply-To: <CAK7LNATGat99BK_N9SiyogotLcXFA5P__G-aV6jW+sEw-TGbvA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>

Hi Masahiro-san

On 08/10/2017 12:05 AM, Masahiro Yamada wrote:
> 2017-08-08 22:20 GMT+09:00 Cao jin <caoj.fnst@cn.fujitsu.com>:
>> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
> 
> Applied to linux-kbuild/fixes.  Thanks!
> 

I want to ask a question via this thread.

I am tracing how each kernel source file compiled, and I met mounts-y in
init/Makefile, I have trouble in finding the rule which compile
$(mounts-y), but I clearly see the files in $(mounts-y) are compiled in
the output of `make -n vmlinux`, but the files listed in mounts-y are
not listed in obj-y. I think I must miss something, could you give some
hint?

-- 
Sincerely,
Cao jin


