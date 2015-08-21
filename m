Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:48191 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751275AbbHUMtf (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 21 Aug 2015 08:49:35 -0400
Subject: Re: [PATCH TRIVIAL v2] Avoid conflict with host definitions when
 cross-compiling
References: <1439549533-8716-1-git-send-email-p.fedin@samsung.com>
 <55D5BAA4.5050003@suse.com> <018a01d0db44$35ed5630$a1c80290$@samsung.com>
 <55D5CA31.8090401@suse.com> <019301d0db4a$a60a7370$f21f5a50$@samsung.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <55D71E5C.2080807@suse.com>
Date: Fri, 21 Aug 2015 14:49:32 +0200
MIME-Version: 1.0
In-Reply-To: <019301d0db4a$a60a7370$f21f5a50$@samsung.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Pavel Fedin <p.fedin@samsung.com>
Cc: linux-kbuild@vger.kernel.org

On 2015-08-20 15:18, Pavel Fedin wrote:
>  Hi!
> 
>> If you already have the patches, it won't hurt to send them.
> 
>  I have one of them, need to make more.
> 
>> Although I
>> was under the impression that the .exe suffix is somehow automagically
>> handled by Cygwin..?
> 
>  In 99% of cases - yes. But at least there is a problem with implicit rules in GNU Make.

That sounds good. I feared we would have to write scripts/foo$(EXE)
everywhere.

>  Actually, here i am talking about patch 0002 from this set:
> https://www.cygwin.com/ml/cygwin/2012-06/msg00221.html.

Patch 0002 has been merged in the meantime.


> This HOWTO was created when the kernel was
> really old, and now some more tools face a similar problem, like certificate generator for security
> subsystem. I will check this.

OK.

Michal
