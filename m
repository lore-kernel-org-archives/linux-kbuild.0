Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from wa-out-1112.google.com ([209.85.146.183]:52446 "EHLO
	wa-out-1112.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753641AbYA1Br6 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 27 Jan 2008 20:47:58 -0500
Received: by wa-out-1112.google.com with SMTP id v27so2670914wah.23
        for <linux-kbuild@vger.kernel.org>; Sun, 27 Jan 2008 17:47:58 -0800 (PST)
Message-ID: <479D3447.6050503@gmail.com>
Date: Mon, 28 Jan 2008 10:47:51 +0900
From: Tejun Heo <htejun@gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH 12/77] kbuild: implement modules.order
References: <20080124215813.GA4204@uranus.ravnborg.org>	 <200801261501.56198.rusty@rustcorp.com.au> <479AB57D.3080805@gmail.com>	 <200801262025.59593.rusty@rustcorp.com.au> <1201408437.32422.189.camel@perihelion>
In-Reply-To: <1201408437.32422.189.camel@perihelion>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jon Masters <jonathan@jonmasters.org>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org, Bill Nottingham <notting@redhat.com>, Greg Kroah-Hartman <gregkh@suse.de>, Kay Sievers <kay.sievers@vrfy.org>

Hello,

Jon Masters wrote:
>> There is, of course, no reason to change modprobe; just define the current 
>> behaviour that the *last* alias is preferred, and generate modules.alias 
>> accordingly.
> 
> For now, let's base it on Modules.order but ensure the alias file is
> written in the appropriate order (I need to check, that's probably in
> reverse of Modules.order...I'll think about this tomorrow, this has been
> on my mind recently, and like I said, I had to kludge a fix for an
> Enterprise distribution for deterministic behavior recently too).
> 
>> Jon's idea of having the later one pull the device away would also work, but 
>> seems like it's a complex solution to a corner case.
> 
> Well, ultimately, we (myself, Kay, and others) would seem to prefer that
> rebinding be done properly - so through a combination of udev rules and
> kernel behavior, the user/third parties define the priorities. We should
> load all the drivers - that's totally correct - but we shouldn't depend
> upon whichever probe function will run first, that's too lame.

It is lame but works for most of the cases.  I'm not sure whether
full-fledged fine-grained driver selection would be an unnecessary
overkill or not.

> I'll start with the simple fix, then we should debate this...

Yeap.

-- 
tejun
