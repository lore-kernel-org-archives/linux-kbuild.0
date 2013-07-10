Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:55945 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755141Ab3GJUif convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 10 Jul 2013 16:38:35 -0400
Received: by mail-wi0-f176.google.com with SMTP id ey16so11863628wid.15
        for <linux-kbuild@vger.kernel.org>; Wed, 10 Jul 2013 13:38:33 -0700 (PDT)
Date: Wed, 10 Jul 2013 22:38:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [PATCH] scripts/config: use sed's POSIX interface
Message-ID: <20130710203829.GD3297@free.fr>
References: <1373486288-715-1-git-send-email-chauplac@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <1373486288-715-1-git-send-email-chauplac@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Clement Chauplannaz <chauplac@gmail.com>
Cc: linux-kbuild@vger.kernel.org, mmarek@suse.cz, ak@linux.intel.com

Clément, All,

On 2013-07-10 21:58 +0200, Clement Chauplannaz spake thusly:
> Script `config' relies on extensions of `GNU sed', and is thus not
> working on all Unixes:
> - in-place edition of files (-i), which can be replaced with
> a temporary file;
> - extended-regexps (-r), which can be split into basic regexps;
> - single-line calls to `a' command, while some implementations
> require a leading newline before the parameter.
> 
> Rewrite calls to `sed' program to comply with POSIX interface.

Clément, sorry I did not come back to you earlier after your second PM.
Here is further review:

> Signed-off-by: Clement Chauplannaz <chauplac@gmail.com>
> ---
>  scripts/config | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/config b/scripts/config
> index a65ecbb..3fd95eb 100755
> --- a/scripts/config
> +++ b/scripts/config
> @@ -66,9 +66,14 @@ set_var() {
>  	name_re="^($name=|# $name is not set)"
>  	before_re="^($before=|# $before is not set)"
>  	if test -n "$before" && grep -Eq "$before_re" "$FN"; then
> -		sed -ri "/$before_re/a $new" "$FN"
> +		lf=$'\n'

As you explained me earlier, you expect this to actually set the '\n'
symbol (0x0a) as first char of variable 'lf'. This is a bashism, and is
not POSIX. Here is a test script:

    #!/bin/dash
    lf=$'\n'
    printf "lf='%s'\n" "${lf}"
    printf "lf='${lf}'\n"

And the output:
    lf='$\n'
    lf='$
    '

Now, if you use #!/bin/bash, it works as you expect, but not with a
POSIX-only script like dash.

A reliable way to get a single '\n' would be:

    lf="$( printf '\n' )"

Yes, config is already a bash script, but no need to add bashisms when
they can be avoided. And since this patch is about POSIX compliance in
the first place... ;-)

Otherwise, LGTM.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
