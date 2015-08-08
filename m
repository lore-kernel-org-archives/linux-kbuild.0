Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:36699 "EHLO
	mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932633AbbHHMre (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 8 Aug 2015 08:47:34 -0400
MIME-Version: 1.0
In-Reply-To: <1437948415-16290-1-git-send-email-richard@nod.at>
References: <1437948415-16290-1-git-send-email-richard@nod.at>
Date: Sat, 8 Aug 2015 14:47:32 +0200
Message-ID: <CAFLxGvzT11zSu2YDO5Hqr4se0icp=K1MGKhhGZgubVQbu55=mw@mail.gmail.com>
Subject: Re: [PATCH] localmodconfig: Use Kbuild files too
From: Richard Weinberger <richard.weinberger@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Richard Weinberger <richard@nod.at>
Cc: yann.morin.1998@free.fr, Steven Rostedt <rostedt@goodmis.org>, artafinde@gmail.com, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Mon, Jul 27, 2015 at 12:06 AM, Richard Weinberger <richard@nod.at> wrote:
> In kbuild it is allowed to define objects in files named "Makefile"
> and "Kbuild".
> Currently localmodconfig reads objects only from "Makefile"s and misses
> modules like nouveau.
>
> Reported-and-tested-by: Leonidas Spyropoulos <artafinde@gmail.com>
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  scripts/kconfig/streamline_config.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
> index 9cb8522..f3d3fb4 100755
> --- a/scripts/kconfig/streamline_config.pl
> +++ b/scripts/kconfig/streamline_config.pl
> @@ -137,7 +137,7 @@ my $ksource = ($ARGV[0] ? $ARGV[0] : '.');
>  my $kconfig = $ARGV[1];
>  my $lsmod_file = $ENV{'LSMOD'};
>
> -my @makefiles = `find $ksource -name Makefile 2>/dev/null`;
> +my @makefiles = `find $ksource -name Makefile -or -name Kbuild 2>/dev/null`;
>  chomp @makefiles;
>
>  my %depends;
> --

Ping?

-- 
Thanks,
//richard
