Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:56354 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1754259AbdFNHcZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Jun 2017 03:32:25 -0400
Subject: Re: [PATCH v2] Kbuild: tiny correction on `make help`
References: <1496740073-3320-1-git-send-email-caoj.fnst@cn.fujitsu.com>
 <CAK7LNATSyqcf7X6Cn2GjObBdcW-qBxnS50BhgYAz5wcSKmCEjw@mail.gmail.com>
 <593FB5F2.4040206@cn.fujitsu.com>
 <CAK7LNATJP5Ua3bWsxKQFUJ=m7TmOzz168_ZrZ4O4tnvd6mrgjA@mail.gmail.com>
 <5940E10A.10309@cn.fujitsu.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <98403870-3c74-0730-2ffa-3048ed3827ad@suse.com>
Date: Wed, 14 Jun 2017 09:32:22 +0200
MIME-Version: 1.0
In-Reply-To: <5940E10A.10309@cn.fujitsu.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Cao jin <caoj.fnst@cn.fujitsu.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Dne 14.6.2017 v 09:08 Cao jin napsal(a):
> 
> 
> On 06/14/2017 09:15 AM, Masahiro Yamada wrote:
>> 2017-06-13 18:52 GMT+09:00 Cao jin <caoj.fnst@cn.fujitsu.com>:
>>> Yamada-san,
>>>
>>>   I have a question on the current top level Makefile. There are
>>> following lines, I have trouble to understand "firstword x$(MAKEFLAGS)"
>>> in 2nd line, why there is a 'x' there?
>>>
>>>
>>>   ifneq ($(filter 4.%,$(MAKE_VERSION)),)  # make-4
>>>   ifneq ($(filter %s ,$(firstword x$(MAKEFLAGS))),)
>>
>>
>> I do not understand the 'x' either.
>>
>> Michal suggested the code according to the following:
>> https://patchwork.kernel.org/patch/3291301/
>> (I hope Michal can help you.)
>>
> 
> It does helps.
> 
>>
>> My first guess was, it was added just in case $(MAKEFLAGS) is empty.
>> Actually $(firstword ) seems to work with empty argument, though.
>>
> 
> I see, I guess you are saying it was added in case there is no
> single-letter flags in $(MAKEFLAGS) while it has "--debug=jobs", that
> make sense to me. Thanks very much, Yamada-san.

Well, it more than three years ago. But yes, I believe that was the
intention:

make --foo=s

x$(MAKEFLAGS) => x --foo=s
$(firstword x$(MAKEFLAGS)) => x

Michal
