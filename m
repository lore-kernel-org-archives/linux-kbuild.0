Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0029.hostedemail.com ([216.40.44.29]:53124 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729999AbeGTKyM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Jul 2018 06:54:12 -0400
Message-ID: <01cfa83d2e29667d311d679c904b1648cd35c614.camel@perches.com>
Subject: Re: [PATCH v2] checkpatch: kbuild: if_changed: check for multiple
 calls in targets
From: Joe Perches <joe@perches.com>
Date: Fri, 20 Jul 2018 03:06:37 -0700
In-Reply-To: <20180720074804.4160-1-dirk@gouders.net>
References: <ghy3eafbrf.fsf@lena.gouders.net>
         <20180720074804.4160-1-dirk@gouders.net>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>
Cc: Andy Whitcroft <apw@canonical.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 2018-07-20 at 09:48 +0200, Dirk Gouders wrote:
> The kbuild function if_changed should not be called more than once for
> a target.
> 
> Because that function writes the command line to a .cmd file for later
> tests, multiple calls of it within a target would result in overwrites
> of previous values and effectively render the command line test
> meaningless, resulting in flip-flop behaviour.
> 
> Add a check for makefiles and kbuild files and produce an error for
> targets with multiple calls to if_changed.
> 
> Three examples that now could be detected:
> 
> 98f78525371b55ccd (x86/boot: Refuse to build with data relocations)
> 6a8dfe1cac5c591ae (microblaze: support U-BOOT image format)
> 684151a75bf25f5ae (sparc32: added U-Boot build target: uImage)
> 
> Reviewed-by: Joe Perches <joe@perches.com>

I didn't review this.  I gave you feedback
but didn't add a signature.

For anything other than "Suggested-by:",
please don't add signatures to patches unless
the person gives directly gives you one.

> Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Signed-off-by: Dirk Gouders <dirk@gouders.net>
> ---
> v2: rework commit message and regular expression
> ---
>  scripts/checkpatch.pl | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 447857ffaf6b..437e98414f74 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2911,6 +2911,14 @@ sub process {
>  			     "Use of $flag is deprecated, please use \`$replacement->{$flag} instead.\n" . $herecurr) if ($replacement->{$flag});
>  		}
>  
> +		# Check for multiple calls of if_changed within a target in Makefiles
> +		if (($realfile =~ /Makefile.*/ || $realfile =~ /Kbuild.*/) &&

The uses of .* here are superfluous.

> +		    ($prevline =~ /^[ +]\t\s*\$\(call\s+if_changed,/) &&
> +		    ($line =~ /^[ +]\t\s*\$\(call\s+if_changed,/)) {
> +				ERROR("MULTIPLE_IF_CHANGED",
> +				      "Multiple calls of if_changed within a target.\n" . $herecurr);
> +		}
> +
>  # check for DT compatible documentation
>  		if (defined $root &&
>  			(($realfile =~ /\.dtsi?$/ && $line =~ /^\+\s*compatible\s*=\s*\"/) ||
