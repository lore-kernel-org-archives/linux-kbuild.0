Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay04.ispgateway.de ([80.67.31.31]:35883 "EHLO
	smtprelay04.ispgateway.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752344Ab2BZR6B (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 26 Feb 2012 12:58:01 -0500
Message-ID: <4F4A7126.6020009@bwalle.de>
Date: Sun, 26 Feb 2012 18:51:34 +0100
From: Bernhard Walle <bernhard@bwalle.de>
MIME-Version: 1.0
Subject: Re: [PATCH] scripts/Kbuild.include: Fix portability problem of "echo
 -e"
References: <1330277718-2667-1-git-send-email-bernhard@bwalle.de> <20120226174805.GA562@merkur.ravnborg.org>
In-Reply-To: <20120226174805.GA562@merkur.ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: mmarek@suse.cz, lacombar@gmail.com, linux-kernel@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>, zippel@linux-m68k.org

Am 26.02.12 18:48, schrieb Sam Ravnborg:
>> > --- a/scripts/Kbuild.include
>> > +++ b/scripts/Kbuild.include
>> > @@ -104,7 +104,7 @@ as-option = $(call try-run,\
>> >  # Usage: cflags-y += $(call as-instr,instr,option1,option2)
>> >  
>> >  as-instr = $(call try-run,\
>> > -	/bin/echo -e "$(1)" | $(CC) $(KBUILD_AFLAGS) -c -xassembler -o "$$TMP" -,$(2),$(3))
>> > +	printf "%b\n" "$(1)" | $(CC) $(KBUILD_AFLAGS) -c -xassembler -o "$$TMP" -,$(2),$(3))
>> >  
>> >  # cc-option
>> >  # Usage: cflags-y += $(call cc-option,-march=winchip-c6,-march=i586)
> Roman Zippel removed use of printf in this patch: beda9f3a13bbb22cde92a45f230a02ef2afef6a9
> 
> I cannot remember why - but it would be good if you could dig up
> why - just so we do not hit an old issue again.

Well, he used printf "$(1)", that's different from printf "%b\n" "$(1)"
since format strings inside $(1) would be interpreted.

But maybe Roman can comment on that? Cc'ing him.


Regards,
Bernhard



