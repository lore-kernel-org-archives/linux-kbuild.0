Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk0-f171.google.com ([209.85.220.171]:35643 "EHLO
        mail-qk0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726912AbeGLRTK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Jul 2018 13:19:10 -0400
Received: by mail-qk0-f171.google.com with SMTP id u21-v6so15807676qku.2
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Jul 2018 10:08:44 -0700 (PDT)
Subject: Re: [PATCHv2 0/7] HOSTFLAGS and HOSTLDFLAGS from the environment
References: <20180710004602.21599-1-labbott@redhat.com>
 <CAK7LNAQ0dWqaYkLjevCuboCBovcsTV1cMh48qv__wwMZs-vAxg@mail.gmail.com>
From: Laura Abbott <labbott@redhat.com>
Message-ID: <bd8bd678-c42d-4b04-fa55-00c6f524a4bb@redhat.com>
Date: Thu, 12 Jul 2018 10:08:40 -0700
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQ0dWqaYkLjevCuboCBovcsTV1cMh48qv__wwMZs-vAxg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Olsa <jolsa@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Robin Jarry <robin.jarry@6wind.com>, Jonathan Corbet <corbet@lwn.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>

On 07/12/2018 03:13 AM, Masahiro Yamada wrote:
> 2018-07-10 9:45 GMT+09:00 Laura Abbott <labbott@redhat.com>:
>>
>> Hi,
>>
>> This is v2 of the series to set HOSTCFLAGS and HOSTLDFLAGS from the
>> environment. The changes are mostly minor fixups requested and also
>> include documentation of the new options.
> 
> 
> 
> I checked this series.
> 
> 
> I left minor comments for 3/7 and 7/7.
> 
> Unless you disagree,
> I will fix them up locally
> and queue it to my tree.
> 

The fixes look fine.

Thanks,
Laura


