Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0153.hostedemail.com ([216.40.44.153]:33881 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727610AbeGPPv5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Jul 2018 11:51:57 -0400
Message-ID: <1d36bef932de0612746088388df793de99d7c129.camel@perches.com>
Subject: Re: [PATCH] checkpatch: if_changed: check for multiple calls in
 targets
From: Joe Perches <joe@perches.com>
Date: Mon, 16 Jul 2018 08:23:59 -0700
In-Reply-To: <20180716123902.5337-1-dirk@gouders.net>
References: <20180716123902.5337-1-dirk@gouders.net>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>, Andy Whitcroft <apw@canonical.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 2018-07-16 at 14:39 +0200, Dirk Gouders wrote:
> Because the kbuild function if_changed writes the command line to a
> .cmd file for later tests, multiple calls of that function within a
> target would result in overwrites of previous values and effectively
> render the command line test meaningless, resulting in flip-flop
> behaviour.
> 
> Produce an error for targets with multiple calls to if_changed.

Hi.  Some questions:

How is the existing use in arch/microblaze/boot/Makefile incorrect?

$(obj)/simpleImage.%: vmlinux FORCE
	$(call if_changed,cp,.unstrip)
	$(call if_changed,objcopy)
	$(call if_changed,uimage)
	$(call if_changed,strip,.strip)
	@echo 'Kernel: $(UIMAGE_OUT) is ready' ' (#'`cat .version`')'

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> @@ -2911,6 +2911,14 @@ sub process {
>  			     "Use of $flag is deprecated, please use \`$replacement->{$flag} instead.\n" . $herecurr) if ($replacement->{$flag});
>  		}
>  i
> +		# Check for multiple calls of if_changed within a target in Makefiles
> +		if (($realfile =~ /Makefile.*/ || $realfile =~ /Kbuild.*/) &&

Why is any Kbuild file check useful?

> +		    ($prevline =~ /^[ +]\t\$\(call if_changed,/) &&
> +		    ($line =~ /^[ +]\t\$\(call if_changed,/)) {

What about if_changed_dep and if_changed_rule?

> +				ERROR("MULTIPLE_IF_CHANGED",
> +				      "Multiple calls of if_changed within a target.\n" . $herecurr);
> +		}

And some more style things:

There are instances with multiple tabs so probably
these should use '\t*' or '\s*' and not '\t'.

This should probably not require a single space after
if_changed so likely:

	'call\s+if_changed'

