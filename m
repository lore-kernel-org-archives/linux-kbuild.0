Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:49868 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932099Ab2ANUzn (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 14 Jan 2012 15:55:43 -0500
Message-ID: <4F11EBD3.5080800@suse.cz>
Date: Sat, 14 Jan 2012 21:55:47 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] scripts:kconfig:mconf.c: let make not report error when
 not save configuration
References: <20120112033132.GA13752@udknight> <1326401437.3416.0.camel@offbook>
In-Reply-To: <1326401437.3416.0.camel@offbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: dave@gnu.org
Cc: Wang YanQing <udknight@gmail.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, lacombar@gmail.com

On 12.1.2012 21:50, Davidlohr Bueso wrote:
> On Thu, 2012-01-12 at 11:31 +0800, Wang YanQing wrote:
>> I find every time when I choice the 'NO' button at the dialog
>> which let me choice whether to save the configuration before exit
>> menuconfig, it always report the blow:
>>
>> " GEN     /mnt/sda7/home/build/test/Makefile
>>   HOSTCC  scripts/kconfig/mconf.o
>>   HOSTLD  scripts/kconfig/mconf
>> scripts/kconfig/mconf Kconfig
>>
>> Your configuration changes were NOT saved.
>>
>> make[2]: *** [menuconfig] Error 1
>> make[1]: *** [menuconfig] Error 2
>> make: *** [sub-make] Error 2 "
>>
>> This patch repair it.
>>
>> Thanks!
>>
>> Signed-off-by: Wang YanQing <udknight@gmail.com>
> 
> Acked-by: Davidlohr Bueso <dave@gnu.org>

Applied to kbuild.git#kconfig.

Michal
