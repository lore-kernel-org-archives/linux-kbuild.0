Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from py-out-1112.google.com ([64.233.166.178]:31865 "EHLO
	py-out-1112.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752004AbYAYD3Y (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 22:29:24 -0500
Received: by py-out-1112.google.com with SMTP id u52so766281pyb.10
        for <linux-kbuild@vger.kernel.org>; Thu, 24 Jan 2008 19:29:19 -0800 (PST)
Message-ID: <47995788.3000402@gmail.com>
Date: Fri, 25 Jan 2008 12:29:12 +0900
From: Tejun Heo <htejun@gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH 12/77] kbuild: implement modules.order
References: <20080124215813.GA4204@uranus.ravnborg.org> <1201212238-4369-12-git-send-email-sam@ravnborg.org> <200801251419.09999.rusty@rustcorp.com.au>
In-Reply-To: <200801251419.09999.rusty@rustcorp.com.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org, Bill Nottingham <notting@redhat.com>, Greg Kroah-Hartman <gregkh@suse.de>, Kay Sievers <kay.sievers@vrfy.org>, Jon Masters <jonathan@jonmasters.org>

Rusty Russell wrote:
> On Friday 25 January 2008 09:02:53 Sam Ravnborg wrote:
>> From: Tejun Heo <htejun@gmail.com>
>>
>> When driver modules are loaded by udev, what comes first in
>> modules.alias file is selected.
> 
> Actually, I had occasion to look at this the other day, and in the modprobe 
> version here every match is selected.

What do you mean by "every match is selected"?

> And they'll be loaded in reverse order of the module.alias file.

What do you mean by 'loaded'?

> Looks like Jon's latest git tree does the same.
> 
> So, what does this patch actually fix?

This patch makes kbuild generate modules.order and another patch makes
depmod generate modules.alias or whatever else according to the order
specified in modules.order, so that modprobe prefer modules which is
earlier in the linking order.

So, are you saying that modprobe chooses modules in the reverse order of
modules.alias file?

-- 
tejun
