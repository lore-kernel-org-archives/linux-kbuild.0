Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rv-out-0910.google.com ([209.85.198.184]:9248 "EHLO
	rv-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752998AbYAZEw4 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 25 Jan 2008 23:52:56 -0500
Received: by rv-out-0910.google.com with SMTP id k20so990031rvb.1
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Jan 2008 20:52:55 -0800 (PST)
Message-ID: <479ABCA1.80603@gmail.com>
Date: Sat, 26 Jan 2008 13:52:49 +0900
From: Tejun Heo <htejun@gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH 12/77] kbuild: implement modules.order
References: <20080124215813.GA4204@uranus.ravnborg.org>	 <200801251419.09999.rusty@rustcorp.com.au> <47995788.3000402@gmail.com>	 <200801261501.56198.rusty@rustcorp.com.au>  <479AB57D.3080805@gmail.com> <1201321736.32422.152.camel@perihelion>
In-Reply-To: <1201321736.32422.152.camel@perihelion>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jon Masters <jonathan@jonmasters.org>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org, Bill Nottingham <notting@redhat.com>, Greg Kroah-Hartman <gregkh@suse.de>, Kay Sievers <kay.sievers@vrfy.org>

Jon Masters wrote:
>>> That is precisely what I'm saying, and more.
>> Oops, then modprobe needs to be updated too.  Jon, can you please put
>> this onto your to-do list too?
> 
> But the thing Rusty is also getting at (so I think) is that this might
> not be the way to fix the "problem". Perhaps using the rebinding bits in
> the kernel might be the best way to solve this in the longer term. I can
> fix both depmod and modprobe, but I would appreciate some more input :)

Proper solution : module loader with sane default order (which again
should be specified by developers) and allows the user to choose which
module to use.

Complete but probably overkill solution : Don't let drivers probe
devices on load.  Control device binding per-device such that different
devices of the same type can attach to different drivers.  This is
somewhat necessary between ahci and ata_piix because one is not subset
of the other but controlling loading order seems to do the trick till now.

> Alternatives are a config option to only load the first match for now,
> and to load based on the Modules.order. Thoughts?

That doesn't really change anything other than saving memory for the
second module.  Also, it's incomplete solution because the first module
might or might not attach to the device.  Sometimes device ID isn't
enough to determine whether a specific driver can be used or not.

Thanks.

-- 
tejun
