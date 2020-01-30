Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:47662 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727498AbgA3SbX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Jan 2020 13:31:23 -0500
MIME-Version: 1.0
References: <20200130122221.30029e32@gandalf.local.home>
In-Reply-To: <20200130122221.30029e32@gandalf.local.home>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 31 Jan 2020 03:30:37 +0900
Message-ID: <CAK7LNAR1AJFDahD6cB_MryBd-79N_T5O9WV3CMEA+HOCDXZEig@mail.gmail.com>
Subject: Re: [GIT PULL] kconfig: localmodconfig: Minor clean ups to streamline_config.pl
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Steven,

On Fri, Jan 31, 2020 at 2:22 AM Steven Rostedt <rostedt@goodmis.org> wrote:
>
>
> Linus,
>
> Just a couple of clean ups to streamline_config.pl
>
>
> Please pull the latest localmodconfig-v5.6 tree, which can be found at:
>
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-kconfig.git
> localmodconfig-v5.6
>
> Tag SHA1: ae4a98169606cf4b84bce31c4ec0003da8dd60e6
> Head SHA1: 37bf46aae4acb76e7cc0fb4d1131ece682f456d4
>
>
> Masahiro Yamada (2):
>       kconfig: localmodconfig: Remove unused $config
>       kconfig: localmodconfig: Fix indentation for closing brace



I know you are the author of streamline_config,
but actually did not know you were collecting
patches for this particular file.


I did not receive a notice email from you,
nor did these commits appear in linux-next at all.
Could you send a notice email when
you pick up a patch next time?
(Sorry, I also forgot to send a email.
I will drop them from my tree.)


Thanks.



> ----
>  scripts/kconfig/streamline_config.pl | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> ---------------------------
> diff --git a/scripts/kconfig/streamline_config.pl
> b/scripts/kconfig/streamline_config.pl index 08d76d7b3b81..e2f8504f5a2d
> 100755 --- a/scripts/kconfig/streamline_config.pl
> +++ b/scripts/kconfig/streamline_config.pl
> @@ -56,8 +56,6 @@ sub dprint {
>      print STDERR @_;
>  }
>
> -my $config = ".config";
> -
>  my $uname = `uname -r`;
>  chomp $uname;
>
> @@ -374,7 +372,7 @@ if (defined($lsmod_file)) {
>             $lsmod = "$dir/lsmod";
>             last;
>         }
> -}
> +    }
>      if (!defined($lsmod)) {
>         # try just the path
>         $lsmod = "lsmod";



-- 
Best Regards
Masahiro Yamada
