Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122]:49186 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754347Ab1EQNrZ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 17 May 2011 09:47:25 -0400
Subject: Re: [RFC][PATCH 2/2] ftrace/kbuild: Add recordmcount files to
 force full build
From: Steven Rostedt <rostedt@goodmis.org>
In-Reply-To: <20110517133646.GP13293@sepie.suse.cz>
References: <20110517021027.390391519@goodmis.org>
	 <20110517021423.661004726@goodmis.org>
	 <20110517133646.GP13293@sepie.suse.cz>
Content-Type: text/plain; charset="ISO-8859-15"
Date: Tue, 17 May 2011 09:47:22 -0400
Message-ID: <1305640042.5456.727.camel@gandalf.stny.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Tue, 2011-05-17 at 15:36 +0200, Michal Marek wrote:

> We could add recordmcount.c as a dependency in scripts/Makefile.build
> directly, without playing with fixdep, like this (untested):

I actually tried this first, and it didn't seem to work. I'll go ahead
and give it another try (maybe I did something wrong). But I do prefer
this over my fixdep change.

Thanks, I'll let you know the outcome.

-- Steve

> 
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index f133641..bc2c8d3 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -268,6 +268,7 @@ sub_cmd_record_mcount =					\
>  	if [ $(@) != "scripts/mod/empty.o" ]; then	\
>  		$(objtree)/scripts/recordmcount "$(@)";	\
>  	fi;
> +recordmcount_source := $(srctree)/scripts/recordmcount.c
>  else
>  sub_cmd_record_mcount = set -e ; perl $(srctree)/scripts/recordmcount.pl "$(ARCH)" \
>  	"$(if $(CONFIG_CPU_BIG_ENDIAN),big,little)" \
> @@ -275,6 +276,7 @@ sub_cmd_record_mcount = set -e ; perl $(srctree)/scripts/recordmcount.pl "$(ARCH
>  	"$(OBJDUMP)" "$(OBJCOPY)" "$(CC) $(KBUILD_CFLAGS)" \
>  	"$(LD)" "$(NM)" "$(RM)" "$(MV)" \
>  	"$(if $(part-of-module),1,0)" "$(@)";
> +recordmcount_source := $(srctree)/scripts/recordmcount.pl
>  endif
>  cmd_record_mcount = 						\
>  	if [ "$(findstring -pg,$(_c_flags))" = "-pg" ]; then	\
> @@ -295,13 +297,13 @@ define rule_cc_o_c
>  endef
>  
>  # Built-in and composite module parts
> -$(obj)/%.o: $(src)/%.c FORCE
> +$(obj)/%.o: $(src)/%.c $(recordmcount_source) FORCE
>  	$(call cmd,force_checksrc)
>  	$(call if_changed_rule,cc_o_c)
>  
>  # Single-part modules are special since we need to mark them in $(MODVERDIR)
>  
> -$(single-used-m): $(obj)/%.o: $(src)/%.c FORCE
> +$(single-used-m): $(obj)/%.o: $(src)/%.c $(recordmcount_source) FORCE
>  	$(call cmd,force_checksrc)
>  	$(call if_changed_rule,cc_o_c)
>  	@{ echo $(@:.o=.ko); echo $@; } > $(MODVERDIR)/$(@F:.o=.mod)
> 
> Michal


