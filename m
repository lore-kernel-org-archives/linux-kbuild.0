Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:58812 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751884AbYLMXPc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 13 Dec 2008 18:15:32 -0500
Date: Sun, 14 Dec 2008 00:16:54 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Better way to force a rebuild
Message-ID: <20081213231654.GA32446@uranus.ravnborg.org>
References: <alpine.DEB.1.10.0812101443550.11805@gandalf.stny.rr.com> <20081210200242.GA15692@uranus.ravnborg.org> <20081210212821.GA18348@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20081210212821.GA18348@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kbuild@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, zippel@linux-m68k.org, Ingo Molnar <mingo@elte.hu>, Andrew Morton <akpm@linux-foundation.org>

On Wed, Dec 10, 2008 at 10:28:21PM +0100, Sam Ravnborg wrote:
> 
> I made the following quick hack.
> I think it should do the trick.
> 
> 	Sam
> 
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 468fbc9..8b5bf43 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -215,7 +215,8 @@ define rule_cc_o_c
>  	$(call echo-cmd,cc_o_c) $(cmd_cc_o_c);				  \
>  	$(cmd_modversions)						  \
>  	$(cmd_record_mcount)						  \
> -	scripts/basic/fixdep $(depfile) $@ '$(call make-cmd,cc_o_c)' >    \
> +	scripts/basic/fixdep $(depfile) $@                                \
> +	'$(call make-cmd,cc_o_c) $(call make-cmd,record_mcount)' >        \
>  	                                              $(dot-target).tmp;  \
>  	rm -f $(depfile);						  \
>  	mv -f $(dot-target).tmp $(dot-target).cmd

Hi Steven.

Did you try the above?
If it works I will add it to kbuild-next.git

	Sam
