Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:44943 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757283Ab2JKU1m (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 11 Oct 2012 16:27:42 -0400
Message-ID: <50772BB8.6080404@suse.cz>
Date: Thu, 11 Oct 2012 22:27:36 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: Documentation of kconfig language differs from implementation
 regarding existence of symbols
References: <1940598.VZE8PFWQyj@tacticalops>
In-Reply-To: <1940598.VZE8PFWQyj@tacticalops>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Martin Walch <walch.martin@gmx.de>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Randy Dunlap <rdunlap@xenotime.net>, Arnaud Lacombe <lacombar@gmail.com>

Dne 10.10.2012 02:17, Martin Walch napsal(a):
> The file linux/Documentation/kbuild/kconfig-language.txt says:
> 
>> The following two methods produce the same kconfig symbol
>> dependencies but differ greatly in kconfig symbol existence
>> (production) in the generated config file.
>> 
>> case 1:
>> 
>> config FOO tristate "about foo" depends on BAR
>> 
>> vs. case 2:
>> 
>> if BAR config FOO tristate "about foo" endif
>> 
>> In case 1, the symbol FOO will always exist in the config file
>> (given no other dependencies).  In case 2, the symbol FOO will
>> only exist in the config file if BAR is enabled.
> 
> However, I can not reproduce this. The attached file contains both
> cases. When running make menuconfig, setting BAR0 and BAR1 both to
> n, and saving the configuration, there is neither FOO0 nor FOO1 in
> the resulting configuration file.

Indeed, that paragraph seems wrong. I think we should revert commit
64b81ed. Randy, Arnaud?

Thanks,
Michal

