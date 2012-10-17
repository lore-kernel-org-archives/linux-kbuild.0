Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f194.google.com ([209.85.212.194]:32945 "EHLO
	mail-wi0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752174Ab2JQWr6 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 17 Oct 2012 18:47:58 -0400
Received: by mail-wi0-f194.google.com with SMTP id hr7so499522wib.1
        for <linux-kbuild@vger.kernel.org>; Wed, 17 Oct 2012 15:47:57 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [menuconfig] build failure.
Date: Thu, 18 Oct 2012 00:47:54 +0200
References: <201210162049.HIC43747.OOtOJHFFFQMVSL@I-love.SAKURA.ne.jp> <20121016125821.GA997@d2.synalogic.ca>
In-Reply-To: <20121016125821.GA997@d2.synalogic.ca>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201210180047.55038.yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Benjamin Poirier <bpoirier@suse.de>, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, mmarek@suse.cz

Michal, Tetsuo, Benjamin, All,

On Tuesday 16 October 2012 Benjamin Poirier wrote:
> Michal, do you think we're better off:
> * copying the CIRCLEQ macros from sys/queue.h (about 30 lines needed,
>   bsd licenced)
> * switching over to kernel-style linked lists using:
> 	* a copy of tools/firewire/list.h
> 	* #include "../../../include/linux/list.h" like perf does in
> 	  tools/perf/util/include/linux/list.h
> 
> -Benjamin
> 
> On 2012/10/16 20:49, Tetsuo Handa wrote:
> > Hello.
> > 
> > Commit 95ac9b3b "menuconfig: Assign jump keys per-page instead of globally"
> > broke menuconfig on legacy environment (Debian Sarge). oops...

It also breaks building on Cygwin, because Cygwin does not have the
CIRCLEQ macros in sys/queue.h (it does not even have it all).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
