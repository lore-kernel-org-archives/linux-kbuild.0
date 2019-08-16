Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:55916 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727104AbfHPMrK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Aug 2019 08:47:10 -0400
Subject: Re: [PATCH v4 07/10] livepatch: Add sample livepatch module
References: <20190509143859.9050-1-joe.lawrence@redhat.com>
 <20190509143859.9050-8-joe.lawrence@redhat.com>
 <CAK7LNARmkRi1ug9C780egxUn1m1FMxAE+uN1d08hLNYZF1724Q@mail.gmail.com>
From: Joe Lawrence <joe.lawrence@redhat.com>
Message-ID: <571e199e-c5a1-5863-ce50-675896c46a25@redhat.com>
Date: Fri, 16 Aug 2019 08:47:09 -0400
MIME-Version: 1.0
In-Reply-To: <CAK7LNARmkRi1ug9C780egxUn1m1FMxAE+uN1d08hLNYZF1724Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, live-patching@vger.kernel.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On 8/16/19 7:35 AM, Masahiro Yamada wrote:
> Hi Joe,
> 
> On Thu, May 9, 2019 at 11:39 PM Joe Lawrence <joe.lawrence@redhat.com> wrote:
>>
>> --- /dev/null
>> +++ b/samples/livepatch/livepatch-annotated-sample.c
>> @@ -0,0 +1,102 @@

> 
> Please use SPDX instead of the license boilerplate.
> 
> Thanks.
> 

Good eye, this revision was spun before ("treewide: Replace GPLv2 
boilerplate/reference with SPDX - rule 13"), so I will add this to the 
v5 TODO list.

Thanks,

-- Joe
