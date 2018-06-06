Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:58094 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752741AbeFFAl4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Jun 2018 20:41:56 -0400
Subject: Re: [PATCH v3] kbuild: check for pkg-config on make
 {menu,n,g.x}config
References: <f13a8e3c-ebc6-53f7-1bac-965c0f30b110@infradead.org>
 <CAK7LNASN_L0An5OBwif7S4wt5Lz54yAdSNw_8ODV0UETa+aDjw@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d74293e3-02a2-b5fc-4f69-9e6924726278@infradead.org>
Date: Tue, 5 Jun 2018 17:41:51 -0700
MIME-Version: 1.0
In-Reply-To: <CAK7LNASN_L0An5OBwif7S4wt5Lz54yAdSNw_8ODV0UETa+aDjw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Bj=c3=b8rn_Forsman?= <bjorn.forsman@gmail.com>, Sam Ravnborg <sam@ravnborg.org>

On 06/04/2018 11:53 PM, Masahiro Yamada wrote:
> Hi Randy,
> 
> 
> 2018-06-04 11:59 GMT+09:00 Randy Dunlap <rdunlap@infradead.org>:
>> From: Randy Dunlap <rdunlap@infradead.org>
>>
>> Each of 'make {menu,n,g,x}config' uses (needs) pkg-config to make sure
>> that other required files are present and to determine build flags
>> settings, but none of these check that pkg-config itself is present.
>> Add a check for all 4 of these targets and update
>> Documentation/process/changes.rst to mention 'pkg-config'.
>>
>> Fixes kernel bugzilla #77511:
>> https://bugzilla.kernel.org/show_bug.cgi?id=77511
>>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Bjørn Forsman <bjorn.forsman@gmail.com>
>> ---
>> Strictly speaking, pkg-config is not required if someone is only
>> using 'make {menu,n}config' since there are fallbacks for those
>> two targets.
>>


OK, I made your suggested changes and will test it later and then resend it.

thanks,
-- 
~Randy
