Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:60600 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751500AbdLFUYo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Dec 2017 15:24:44 -0500
Subject: Re: [PATCH] kconfig: fix relational operators for bool and tristate
 symbols
References: <nycvar.YSQ.7.76.1711161956590.20817@knanqh.ubzr>
 <nycvar.YSQ.7.76.1712061039080.1626@knanqh.ubzr>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <f97141f2-952c-305d-3b32-dad77fa7ae10@infradead.org>
Date: Wed, 6 Dec 2017 12:24:36 -0800
MIME-Version: 1.0
In-Reply-To: <nycvar.YSQ.7.76.1712061039080.1626@knanqh.ubzr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Jan Beulich <JBeulich@suse.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 12/06/2017 07:40 AM, Nicolas Pitre wrote:
> 
> Ping.
> 
> On Thu, 16 Nov 2017, Nicolas Pitre wrote:
> 
>> Since commit 31847b67bec0 ("kconfig: allow use of relations other than
>> (in)equality") it is possible to use relational operators in Kconfig
>> statements. However, those operators give unexpected results when
>> applied to bool/tristate values:
>>
>> 	(n < y) = y (correct)
>> 	(m < y) = y (correct)
>> 	(n < m) = n (wrong)
>>
>> This happens because relational operators process bool and tristate
>> symbols as strings and m sorts before n. It makes little sense to do a
>> lexicographical compare on bool and tristate values though.
>>
>> Documentation/kbuild/kconfig-language.txt states that expression can have
>> a value of 'n', 'm' or 'y' (or 0, 1, 2 respectively for calculations).
>> Let's make it so for relational comparisons with bool/tristate
>> expressions as well and document them. If at least one symbol is an
>> actual string then the lexicographical compare works just as before.
>>
>> Signed-off-by: Nicolas Pitre <nico@linaro.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>


-- 
~Randy
