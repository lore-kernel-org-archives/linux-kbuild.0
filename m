Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:43058 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753550AbbHJL5c (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 10 Aug 2015 07:57:32 -0400
Subject: Re: unmet direct dependencies in -next
References: <55C71FF5.1020902@nod.at> <20150810091004.GC3249@x1>
 <55C86B66.3020601@nod.at> <55C88738.80400@suse.cz>
 <20150810115541.GA6479@katana>
From: Michal Marek <mmarek@suse.cz>
Message-ID: <55C891A9.2080607@suse.cz>
Date: Mon, 10 Aug 2015 13:57:29 +0200
MIME-Version: 1.0
In-Reply-To: <20150810115541.GA6479@katana>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Richard Weinberger <richard@nod.at>, Lee Jones <lee.jones@linaro.org>, linux-next@vger.kernel.org, sameo@linux.intel.com, Arnd Bergmann <arnd@arndb.de>, yann.morin.1998@free.fr, linux-kbuild <linux-kbuild@vger.kernel.org>, "open list:I2C SUBSYSTEM" <linux-i2c@vger.kernel.org>, user-mode-linux-devel <user-mode-linux-devel@lists.sourceforge.net>

On 2015-08-10 13:55, Wolfram Sang wrote:
> 
>> The result of the given .config does not matter as much. The point of
>> the warnings is that there are missing select statements in the Kconfig
>> files.
> 
> For the I2C part, I think they should rather depend on I2C_MUX.
> Selecting I2C should be rare, like when you really need that PMIC to
> boot.

Right, that's another way to fix it.

Michal

