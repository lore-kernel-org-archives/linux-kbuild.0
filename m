Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:59623 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752833Ab1DSI2h (ORCPT <rfc822;linux-kbuild@VGER.KERNEL.ORG>);
	Tue, 19 Apr 2011 04:28:37 -0400
Message-ID: <4DAD47B4.3080908@suse.cz>
Date: Tue, 19 Apr 2011 10:28:36 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [kbuild patch] mkcompile_h produces warnings when using domain
 logins
References: <4D9B63B2.1080701@gmail.com>
In-Reply-To: <4D9B63B2.1080701@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Marcin Nowakowski <marcin.nowakowski.000@gmail.com>
Cc: linux-kbuild@vger.kernel.org

(CC linux-kbuild, please do not send patches to public projects privately)

On 5.4.2011 20:47, Marcin Nowakowski wrote:
> Fix handling of backslash character in LINUX_COMPILE_BY name
> 
> When using a domain login, `whoami` returns the login in
> user\domain format. This leads to either warnings on unrecognised
> escape sequences or escaped characters being generated for the user.
> This patch ensures that any backslash is escaped to a double-backslash
> to make sure the name is preserved correctly
> 
> Signed-off-by: Marcin Nowakowski <marcin.nowakowski.000@gmail.com>
> --- a/scripts/mkcompile_h
> +++ b/scripts/mkcompile_h
> @@ -64,7 +64,7 @@
>     echo \#define UTS_VERSION \"`echo $UTS_VERSION | $UTS_TRUNCATE`\"
> 
>     echo \#define LINUX_COMPILE_TIME \"`date +%T`\"
> -  echo \#define LINUX_COMPILE_BY \"`whoami`\"
> +  echo \#define LINUX_COMPILE_BY \"`whoami | sed 
> "s/\\\\\\\\/\\\\\\\\\\\\\\\\/"`\"
>     echo \#define LINUX_COMPILE_HOST \"`hostname | $UTS_TRUNCATE`\"

Such long sequence of backslashes is rather unreadable. The same command
is equivalent to

  sed 's/\\\\/\\\\\\\\/'

if you use single quotes, but I wonder why you need to match two
backslashes. You say that whoami returns 'user\domain', so the above
regexp wouldn't match it. Also, is it necessary to reproduce the full
user\domain string in the macro? Or could we cut everything after the
backslash, like

  sed  's/\\.*//'

? BTW, I changed the mkcompile_h script recently, see
http://git.kernel.org/?p=linux/kernel/git/mmarek/kbuild-2.6.git;a=blob;f=scripts/mkcompile_h;hb=refs/heads/for-next,
could you base any further version on the for-next branch of
kbuild.2.6.git or on linux-next?

Thanks
Michal
