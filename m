Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.cn.fujitsu.com ([183.91.158.132]:38003 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751194AbeGJJqk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 10 Jul 2018 05:46:40 -0400
Subject: Re: kconfig usage in automatic kernel test
References: <a2a39cac-79fc-22d9-e1d0-b94787526794@cn.fujitsu.com>
 <CAK7LNAQnpQn5k0fkb+nSASe7qg1UgX6BhdR-3EEuSX=xOuPhrw@mail.gmail.com>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <b74953cd-0917-7c02-78e0-516485072601@cn.fujitsu.com>
Date: Tue, 10 Jul 2018 17:45:34 +0800
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQnpQn5k0fkb+nSASe7qg1UgX6BhdR-3EEuSX=xOuPhrw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>



On 07/08/2018 10:15 AM, Masahiro Yamada wrote:
> 2018-07-06 17:49 GMT+09:00 Cao jin <caoj.fnst@cn.fujitsu.com>:
>> Masahiro-san,
>>
>>   I am writing some utility for internal kdump test with latest kernel,
>> my purpose is to test the new introduced kernel feature. For automatical
>> test, I see several config target could help, like olddefconfig, all*config.
>>
>> But for my purpose, I don't find a good way. For example, olddefconfig
>> will let the now config item has default value, while some feature may
>> default to "N"; allyesconfig will slow the compilation notably.
>> But "all*config" has KCONFIG_ALLCONFIG help to customizing some config
>> item, that is a good utility, but seems it can't be used in olddefconfig.
>>
>> All these things let me have 2 questions:
>>
>> 1. What would you suggest for my purpose?
> 
> 
> scripts/kconfig/merge_config.sh
> can be used with any *config target.
> 

I took a quick glance at the script, it seems a good method to me.
Thanks very much, Masahiro-san.

> If you want to tweak some symbols based on olddefconfig,
> this could be the one you want.
> 
> 
>> 2. allyesconfig, allmodconfig, randconfig seems useful for test kbuild,
>> but what's the purpose of allnoconfig, alldefconfig? In others words,
>> when people would need allnoconfig, alldefconfig?
> 
> I sometimes use allnoconfig for build testing.
> 
> When I want to test the whole build process quickly,
> I disable as many drivers as possible to save time.
> 
> 
> I do not use alldefconfig.
> Anyway, it would not hurt to have it for completeness.
> 

Thanks for clarifying.

-- 
Sincerely,
Cao jin


