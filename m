Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from vm185-cluster3.place4.ungleich.ch ([136.243.197.185]:43936 "EHLO
        mx.ungleich.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750741AbdAUVLE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 21 Jan 2017 16:11:04 -0500
References: <1484954637.5246.4.camel@163.com>
From: Nico Schottelius <nico-linuxsetlocalversion@schottelius.org>
Subject: Re: [PATCH] setlocalversion: fix error detectition of kernel git repository
In-reply-to: <1484954637.5246.4.camel@163.com>
Date: Sat, 21 Jan 2017 21:54:54 +0100
Message-ID: <87a8ak876p.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: xufeng <xufwang@163.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, nico-linuxsetlocalversion@schottelius.org, wsa@the-dreams.de


Hello Xufeng,

why do you think redirecting *all* output to /dev/null is the right
thing todo?

And which problem does it exactly fix?

Do you see that there is a difference between a "return value"
(i.e. exit code) and the output (in this case stdout) of a program?

Best,

Nico

xufeng <xufwang@163.com> writes:

> This patch fixed the error using 'git rev-parse --show-cdup' to check
> that git is used as SCM to track the current directory. The return
> value of this command is not null string when the .git directory is
> not in kernel topdir.
>
> Signed-off-by: Xufeng Wang <xufwang@163.com>
> ---
> scripts/setlocalversion | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/setlocalversion b/scripts/setlocalversion
> index 966dd39..7966e39 100755
> --- a/scripts/setlocalversion
> +++ b/scripts/setlocalversion
> @@ -43,7 +43,7 @@ scm_version()
> fi
>
> # Check for git and a git repo.
> -if test -z "$(git rev-parse --show-cdup 2>/dev/null)" &&
> +if test -z "$(git rev-parse --show-cdup &>/dev/null)" &&
> head=`git rev-parse --verify --short HEAD 2>/dev/null`; then
>
> # If we are at a tagged commit (like "v2.6.30-rc6"), we ignore


--
Werde Teil des modernen Arbeitens im Glarnerland auf www.digitalglarus.ch!
Lese Neuigkeiten auf Twitter: www.twitter.com/DigitalGlarus
Diskutiere mit auf Facebook:  www.facebook.com/digitalglarus
