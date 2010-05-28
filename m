Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122]:44620 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755788Ab0E1OPh (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 28 May 2010 10:15:37 -0400
Subject: Re: [PATCH] streamline_config.pl: make a variable local
From: Steven Rostedt <rostedt@goodmis.org>
Reply-To: rostedt@goodmis.org
In-Reply-To: <201005281025.00358.toralf.foerster@gmx.de>
References: <201005281025.00358.toralf.foerster@gmx.de>
Content-Type: text/plain; charset="ISO-8859-15"
Date: Fri, 28 May 2010 10:15:35 -0400
Message-ID: <1275056135.22648.586.camel@gandalf.stny.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Toralf Foerster <toralf.foerster@gmx.de>
Cc: zippel@linux-m68k.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 2010-05-28 at 10:24 +0200, Toralf Foerster wrote:
> to prevent a possible pitfall
> 
> Signed-off-by: Toralf Foerster <toralf.foerster@gmx.de>
> ---
>  scripts/kconfig/streamline_config.pl |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
> index afbd54a..9726946 100644
> --- a/scripts/kconfig/streamline_config.pl
> +++ b/scripts/kconfig/streamline_config.pl
> @@ -307,7 +307,7 @@ close (LIN);
>  my %configs;
>  foreach my $module (keys(%modules)) {
>      if (defined($objects{$module})) {
> -       @arr = @{$objects{$module}};
> +       my @arr = @{$objects{$module}};


Either your mail client, or the method you use to get these into your
mail is causing whitespace issues. There are tabs here that your patch
has converted into spaces, causing the patch to fail to apply.

I've fixed it up, but please fix this before sending more patches.

-- Steve

>         foreach my $conf (@arr) {
>             $configs{$conf} = $module;
>         }
> -- 
> 1.6.4.4
> 
> 


