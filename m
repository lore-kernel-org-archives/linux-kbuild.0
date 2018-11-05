Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from aserp2120.oracle.com ([141.146.126.78]:34142 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726086AbeKESoD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Nov 2018 13:44:03 -0500
Reply-To: zhenzhong.duan@oracle.com
Subject: Re: [PATCH] kbuild: rpm-pkg: fix two build breaks when O= is used
References: <3e40ec15-3a8c-444d-8d32-35ef587f3980@default>
 <CAK7LNAQUie1D3=0o36idvxR7uLtGRaV-MCs5L_cPcuXj28inEw@mail.gmail.com>
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
Message-ID: <6d7af3dc-36a4-837d-42df-f37b2940dda9@oracle.com>
Date: Mon, 5 Nov 2018 17:25:58 +0800
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQUie1D3=0o36idvxR7uLtGRaV-MCs5L_cPcuXj28inEw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, srinivas.eeda@oracle.com, Michal Marek <michal.lkml@markovi.net>

On 2018/11/5 15:55, Masahiro Yamada wrote:
> Hi Zhenzhong,
> 
> On Fri, Nov 2, 2018 at 8:26 PM Zhenzhong Duan<zhenzhong.duan@oracle.com>  wrote:
>> Running 'make O=/build/kernel binrpm-pkg' failed with below two errors.
>>
>> Makefile:600: include/config/auto.conf: No such file or directory
>>
>> + cp make -C /mnt/root/kernel O=/build/kernel image_name make -f
>> /mnt/root/kernel/Makefile ...
>> cp: invalid option -- 'C'
>> Try 'cp --help' for more information.
>>
>> Export KBUILD_OUTPUT when O= is used so that it could be used in locating
>> include/config/auto.conf
>>
>> Use $srctree to locate source dir when generating image name, no matter
>> if O= is used.
>>
>> Signed-off-by: Zhenzhong Duan<zhenzhong.duan@oracle.com>
> 
> Sorry for the breakage, and thanks for your report.
> 
> I'd like to fix the issue in a cleaner way.
> 
> See this:
> https://patchwork.kernel.org/patch/10667539/

Never mind, appreciate you fixed it in a smart way:)

Thanks
Zhenzhong
