Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from qb-out-0506.google.com ([72.14.204.228]:58206 "EHLO
	qb-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752955AbYA0CQm (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 26 Jan 2008 21:16:42 -0500
Received: by qb-out-0506.google.com with SMTP id e11so290548qbe.15
        for <linux-kbuild@vger.kernel.org>; Sat, 26 Jan 2008 18:16:41 -0800 (PST)
Date: Sun, 27 Jan 2008 10:14:29 +0800
From: WANG Cong <xiyou.wangcong@gmail.com>
Subject: Re: The latest linus tree can't build
Message-ID: <20080127021429.GA2495@hacking>
Reply-To: WANG Cong <xiyou.wangcong@gmail.com>
References: <20080126103845.GF20935@hacking> <20080126104514.GA18170@does.not.exist>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080126104514.GA18170@does.not.exist>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Adrian Bunk <bunk@kernel.org>
Cc: WANG Cong <xiyou.wangcong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, LKML <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org

On Sat, Jan 26, 2008 at 12:45:14PM +0200, Adrian Bunk wrote:
>On Sat, Jan 26, 2008 at 06:38:45PM +0800, WANG Cong wrote:
>> 
>> Hi, Sam!
>> 
>> When I built the latest linus tree, I got this error:
>> 
>> ...
>>   CC      sound/oss/msnd.o
>> make[2]: *** No rule to make target `/etc/sound/msndperm.bin', needed by `sound/oss/msndperm.c'.  Stop.
>> make[1]: *** [sound/oss] Error 2
>> make: *** [sound] Error 2
>> 
>> My .config is just the one I sent to you in another thread.
>>...
>
>It's expected that CONFIG_STANDALONE=n allows configurations that won't 
>compile.

Oh, thank you!

