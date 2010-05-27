Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122]:35461 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753658Ab0E0NHc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 27 May 2010 09:07:32 -0400
Subject: Re: [PATCH] streamline_config.pl: use references rather than
 copied data structures
From: Steven Rostedt <rostedt@goodmis.org>
Reply-To: rostedt@goodmis.org
In-Reply-To: <201005271342.09066.toralf.foerster@gmx.de>
References: <201005271342.09066.toralf.foerster@gmx.de>
Content-Type: text/plain; charset="ISO-8859-15"
Date: Thu, 27 May 2010 09:07:29 -0400
Message-ID: <1274965649.22648.263.camel@gandalf.stny.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Toralf =?ISO-8859-1?Q?F=F6rster?= <toralf.foerster@gmx.de>
Cc: zippel@linux-m68k.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 2010-05-27 at 13:42 +0200, Toralf Förster wrote:
> IMHO there's no need for a copy-by-value
> 

Hi Toralf,

I'm sorry but "Your Humble Opinion" is not rational to make changes.

A change to the code must have a reason other than opinion. You must be
able to show that there is actual benefit for a change, or at least
explain it.

Every time a change is made, there is potential for a new bug to be
introduced (especially in Perl). So, unless there's actual need for a
change, don't make one.

This is not performance critical code. If you are fixing a bug, or
adding a feature, then sure. But I really don't want changes that do
nothing but skin the cat a different way.

Thanks,

-- Steve

> Signed-off-by: Toralf Foerster <toralf.foerster@gmx.de>
> ---
>  scripts/kconfig/streamline_config.pl |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/kconfig/streamline_config.pl 
> b/scripts/kconfig/streamline_config.pl
> index afbd54a..574e68f 100644
> --- a/scripts/kconfig/streamline_config.pl
> +++ b/scripts/kconfig/streamline_config.pl
> @@ -406,14 +406,14 @@ close(CIN);
>  loop:
>  foreach my $module (keys(%modules)) {
>      if (defined($objects{$module})) {
> -       my @arr = @{$objects{$module}};
> -       foreach my $conf (@arr) {
> +       my $arr = $objects{$module};
> +       foreach my $conf (@{$arr}) {
>             if (defined($setconfigs{$conf})) {
>                 next loop;
>             }
>         }
>         print STDERR "module $module did not have configs";
> -       foreach my $conf (@arr) {
> +       foreach my $conf (@{$arr}) {
>             print STDERR " " , $conf;
>         }
>         print STDERR "\n";
> -- 
> 1.6.4.4
> 


