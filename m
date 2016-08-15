Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:35882 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932184AbcHOWHe (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 15 Aug 2016 18:07:34 -0400
Subject: Re: Building a subdirectory ignores parent subdir-ccflags
References: <cover.1471289489.git.joe@perches.com>
 <5f9f49c1e0caeb3b9ee0656b6d922dbaf52a15b7.1471289489.git.joe@perches.com>
 <20160815210420.GA30864@kroah.com> <1471295658.4075.117.camel@perches.com>
 <1471296557.4075.127.camel@perches.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <57B23D16.8060405@suse.com>
Date: Tue, 16 Aug 2016 00:07:18 +0200
MIME-Version: 1.0
In-Reply-To: <1471296557.4075.127.camel@perches.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joe Perches <joe@perches.com>, linux-kbuild <linux-kbuild@vger.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Yann E. MORIN" <yann.morin.1998@free.fr>, Oleg Drokin <oleg.drokin@intel.com>, Andreas Dilger <andreas.dilger@intel.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, lustre-devel@lists.lustre.org

Dne 15.8.2016 v 23:29 Joe Perches napsal(a):
> On Mon, 2016-08-15 at 14:14 -0700, Joe Perches wrote:
>> On Mon, 2016-08-15 at 23:04 +0200, Greg Kroah-Hartman wrote:
>>> On Mon, Aug 15, 2016 at 12:33:23PM -0700, Joe Perches wrote:
>>>> Start to rationalize include paths in source code files.
>> []
>>>> diff --git a/drivers/staging/lustre/Makefile b/drivers/staging/lustre/Makefile
>> []
>>>> @@ -1,2 +1,5 @@
>>>> +subdir-ccflags-y += -I$(srctree)/drivers/staging/lustre/include/
>>>> +subdir-ccflags-y += -I$(srctree)/drivers/staging/lustre/lustre/include/
>>>> +
>>>>  obj-$(CONFIG_LNET)		+= lnet/
>>>>  obj-$(CONFIG_LUSTRE_FS)		+= lustre/
>>> This is good, but does this break the subdir make command:
>>> 	make M=drivers/staging/lustre/foo_dir/
>>> ?
>> hmm, yeah, it does.  Oh well, nevermind for awhile.
>>> I remember the last time I tried to clean this up, it took a while...
>> It seems like something the build tools should
>> handle correctly now, but I'll look at it.
> 
> Perhaps making a specific directory should also walk up
> any parent directory Makefiles looking for subdir flags.
> 
> Is that unreasonable?  Any suggestions?

I suggest to do make drivers/staging/lustre/. If building the lustre
subdirectories is going to be a common use case, then you can propagate
the subdir-ccflags-y assignment down to the individual Makefiles.

Michal
