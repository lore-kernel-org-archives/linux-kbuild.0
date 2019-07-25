Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from gecko.sbs.de ([194.138.37.40]:33261 "EHLO gecko.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725842AbfGYPgK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Jul 2019 11:36:10 -0400
Subject: Re: [PATCH v3 07/12] kbuild: modpost: read modules.order instead of
 $(MODVERDIR)/*.mod
References: <20190717061800.10018-1-yamada.masahiro@socionext.com>
 <20190717061800.10018-8-yamada.masahiro@socionext.com>
 <230d2ca1-19cd-b60e-1b1b-6d7413eea9e2@siemens.com>
 <CAK7LNARu--p-tiJA2RGM5_KSQPSeo6-pkp-4GRd2AwM_1dtD7Q@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <0ee802e1-5563-3615-d08f-c936d4e96ebc@siemens.com>
Date: Thu, 25 Jul 2019 17:27:00 +0200
MIME-Version: 1.0
In-Reply-To: <CAK7LNARu--p-tiJA2RGM5_KSQPSeo6-pkp-4GRd2AwM_1dtD7Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Joe Lawrence <joe.lawrence@redhat.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 25.07.19 17:18, Masahiro Yamada wrote:
> Hi Jan,
> 
> On Thu, Jul 25, 2019 at 5:39 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>
>>
>> This affects also external modules builds: I have patterns here that do
>>
>> [Makefile]
>> subdir-y := some-module
>>
>> [some-module/Makefile]
>> obj-m := some-module.o
>>
>> and since this patch, the final some-module.ko is no longer built. Am I missing
>> something in the kbuild makefiles, or is this a regression?
> 
> Thanks for the report.
> Interesting. I have never imagined that Makefiles were written like that.
> 
> I just wrote a fix-up, but I have not determined to apply it.
> https://patchwork.kernel.org/patch/11059033/
> 
> It is easy to fixup your Makefile, though.

Thanks for addressing this quickly! I'm happy to adjust our code [1]. Is the
suggested pattern usable with recent stable kernels as well, say down to 4.4 at
least?

Jan

[1] https://github.com/siemens/jailhouse/blob/master/Kbuild#L54

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux
