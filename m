Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cn.fujitsu.com ([222.73.24.84]:50646 "EHLO song.cn.fujitsu.com"
	rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1751284Ab2APH2D (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 16 Jan 2012 02:28:03 -0500
Message-ID: <4F13D216.3060705@cn.fujitsu.com>
Date: Mon, 16 Jan 2012 15:30:30 +0800
From: Li Zefan <lizf@cn.fujitsu.com>
MIME-Version: 1.0
Subject: Re: [PATCH] kconfig: fix a regression when exiting menuconfig without
 saving
References: <4F13CB49.8030004@cn.fujitsu.com> <1326698421.4151.4.camel@cr0>
In-Reply-To: <1326698421.4151.4.camel@cr0>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Cong Wang <amwang@redhat.com>
Cc: Michal Marek <mmarek@suse.cz>, Arnaud Lacombe <lacombar@gmail.com>, Davidlohr Bueso <dave@gnu.org>, LKML <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org

Cong Wang wrote:
> On Mon, 2012-01-16 at 15:01 +0800, Li Zefan wrote:
>> $ make menuconfig
>>   HOSTCC  scripts/kconfig/mconf.o
>>   HOSTLD  scripts/kconfig/mconf
>> scripts/kconfig/mconf Kconfig
>>
>> Your configuration changes were NOT saved.
>>
>> make[1]: *** [menuconfig] Error 1
>> make: *** [menuconfig] Error 2
>>
>> Exiting menuconfig without saving, make will report error.
> 
> This should be fixed by "[PATCH] scripts:kconfig:mconf.c: let make not
> report error when not save configuration".
> 

I didn't notice that patch. I just took a look on it, and unfortunately
that patch is wrong, in that now pressing ESC in the Yes/No dialog will
exit menuconfig instead of returning to the main menu.
