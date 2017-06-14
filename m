Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cn.fujitsu.com ([59.151.112.132]:37754 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1750749AbdFNHGS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Jun 2017 03:06:18 -0400
Subject: Re: [PATCH v2] Kbuild: tiny correction on `make help`
References: <1496740073-3320-1-git-send-email-caoj.fnst@cn.fujitsu.com>
 <CAK7LNATSyqcf7X6Cn2GjObBdcW-qBxnS50BhgYAz5wcSKmCEjw@mail.gmail.com>
 <593FB5F2.4040206@cn.fujitsu.com>
 <CAK7LNATJP5Ua3bWsxKQFUJ=m7TmOzz168_ZrZ4O4tnvd6mrgjA@mail.gmail.com>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <5940E10A.10309@cn.fujitsu.com>
Date: Wed, 14 Jun 2017 15:08:58 +0800
MIME-Version: 1.0
In-Reply-To: <CAK7LNATJP5Ua3bWsxKQFUJ=m7TmOzz168_ZrZ4O4tnvd6mrgjA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>



On 06/14/2017 09:15 AM, Masahiro Yamada wrote:
> 2017-06-13 18:52 GMT+09:00 Cao jin <caoj.fnst@cn.fujitsu.com>:
>> Yamada-san,
>>
>>   I have a question on the current top level Makefile. There are
>> following lines, I have trouble to understand "firstword x$(MAKEFLAGS)"
>> in 2nd line, why there is a 'x' there?
>>
>>
>>   ifneq ($(filter 4.%,$(MAKE_VERSION)),)  # make-4
>>   ifneq ($(filter %s ,$(firstword x$(MAKEFLAGS))),)
> 
> 
> I do not understand the 'x' either.
> 
> Michal suggested the code according to the following:
> https://patchwork.kernel.org/patch/3291301/
> (I hope Michal can help you.)
> 

It does helps.

> 
> My first guess was, it was added just in case $(MAKEFLAGS) is empty.
> Actually $(firstword ) seems to work with empty argument, though.
> 

I see, I guess you are saying it was added in case there is no
single-letter flags in $(MAKEFLAGS) while it has "--debug=jobs", that
make sense to me. Thanks very much, Yamada-san.

-- 
Sincerely,
Cao jin


