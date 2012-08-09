Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122]:10428 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932262Ab2HIOHl (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 9 Aug 2012 10:07:41 -0400
Message-ID: <1344521260.6935.40.camel@gandalf.stny.rr.com>
Subject: Re: [PATCH 1/4] localmodconfig: set default value for ksource in
 streamline_config.pl
From: Steven Rostedt <rostedt@goodmis.org>
Date: Thu, 09 Aug 2012 10:07:40 -0400
In-Reply-To: <1344518603-19508-2-git-send-email-wfp5p@virginia.edu>
References: <1344518603-19508-1-git-send-email-wfp5p@virginia.edu>
	 <1344518603-19508-2-git-send-email-wfp5p@virginia.edu>
Content-Type: text/plain; charset="ISO-8859-15"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bill Pemberton <wfp5p@virginia.edu>
Cc: linux-kbuild@vger.kernel.org

On Thu, 2012-08-09 at 09:23 -0400, Bill Pemberton wrote:
> Running streamline_config.pl as it's shown it in the comment header,
> you will get a warning about $ksource being uninitialized.  This is
> because $ksource is set to ARGV[0], but the examples don't require any
> arguments.  Fix by setting ksource to . if no ARGV[0] is given.
> 
> This also fixes passing a config file to the script.  For example,
> without this is if you run streamline_config.pl . config.old, it will
> ignore config.old and try to read .config anyway.  With this change it
> will read config.old instead of .config -- which appears to be the
> intent of the code.

I have nothing against this change, but I'm confused by how it fixes the
above issue about reading config.old.

Without the patch, passing in both '.' and 'config.old' as parameters,
wouldn't that still set $ksource to '.' and $kconfig to config.old?

Perhaps, it failed for you without passing the '.', which would set
$ksource to config.old. Maybe the real change should be to count the
number of parameters to determine what $kconfig and $ksource get set to?

-- Steve

> 
> Signed-off-by: Bill Pemberton <wfp5p@virginia.edu>
> ---
>  scripts/kconfig/streamline_config.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
> index 2fbbbc1d..e3687f9 100644
> --- a/scripts/kconfig/streamline_config.pl
> +++ b/scripts/kconfig/streamline_config.pl
> @@ -135,7 +135,7 @@ GetOptions("localmodconfig" => \$localmodconfig,
>  	   "localyesconfig" => \$localyesconfig);
>  
>  # Get the build source and top level Kconfig file (passed in)
> -my $ksource = $ARGV[0];
> +my $ksource = ($ARGV[0] ? $ARGV[0] : '.');
>  my $kconfig = $ARGV[1];
>  my $lsmod_file = $ENV{'LSMOD'};
>  


