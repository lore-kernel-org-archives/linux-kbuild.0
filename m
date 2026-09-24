Received: from mail.avm.de (mail.avm.de [212.42.244.120])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225D2476CCE;
	Thu, 24 Sep 2026 11:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790248962; cv=none; b=FDmRoMetVuqmhe+8wqT1MhbMt6jalstaesHVRvW9lndpMf6krXQKWwf3VTuO/33qvyTNpSRD6zqi7ZfXdtE7QAjlIp3ynRi4lcUFND6oatzvGMNcKKDq8RTwGsHtNiOXVnEnbJ32a7Z9RCJLDmv75yk+4g11x1HFfjzKBGxUTzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790248962; c=relaxed/simple;
	bh=6hH7Wlf+AspOG8Y2qep5h3rbS8Qq94M7b1LYOTXo3vI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rnvbY0PHtaxfEYkuzvuy3L8Ju5DgWPgk1wDNCSRLAxWvXPxi6sM+S8iRF4X1INaz+oK21AaLl+SGUdjOye6Kxkz/Dl0PeV3ALIqagMduPG5hg2JvSrr6De7Qs7M4++TIQVaeMen6z7xVqOSiOiXr8lraENePxDi0XESpydUN6LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b=BtkQaYxw; arc=none smtp.client-ip=212.42.244.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b="BtkQaYxw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1790248949; bh=6hH7Wlf+AspOG8Y2qep5h3rbS8Qq94M7b1LYOTXo3vI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BtkQaYxwuIEBqbzYntct9uEX2y1p+3aq9aux/qXoGGHAbwZNdXGBQK3wwl2qr4NBh
	 FO9hczByL9tCVtLiyvuwzjBuDexw5crLejWezuolU6EiYdJJrpfhKMSpMxgizaLZwr
	 8evAj8Mzj70s5igPhT+GOIMAV/GrbPVTq4Nfj2n1QzFlKDIPqVRh0aYVD9Y97vHxr8
	 fm55fGCQCcEhZy26KhJoNryxUFMYH6N53870NOjPcHoNyr5yYiVbG2nr7kjU6hsQTE
	 Pzrfdf+NT+x/4urgM7jWv0XQd+rvGOQmUIaeLTS5TgUkE5x1eYLRPTDaJBVRVCwg0K
	 /aZPoqkbCVX9w==
Received: from [212.42.244.78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6ab507f5-0449-7f0000032729-7f0000018db8-1
	for <multiple-recipients>; Thu, 24 Sep 2026 13:22:29 +0200
Received: from mail-auth.fritz.com (unknown [212.42.244.78])
	by mail.avm.de (Postfix) with ESMTPS;
	Thu, 24 Sep 2026 13:22:29 +0200 (CEST)
Date: Thu, 24 Sep 2026 13:22:29 +0200
From: Nicolas Schier <n.schier@fritz.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>, Gary Guo <gary@garyguo.net>,
	rust-for-linux@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>
Subject: Re: [PATCH v3 23/28] kbuild: Do the per-module objtool pass right
 before linking
Message-ID: <20260924-industrious-guan-of-expertise-d7caad@l-nschier-z2>
References: <cover.1790028654.git.jpoimboe@kernel.org>
 <0ed8faeff899d3e9f101b6b6cddec0bf89735669.1790028654.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0ed8faeff899d3e9f101b6b6cddec0bf89735669.1790028654.git.jpoimboe@kernel.org>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1790248949-43FED965-7FAD8FFE/0/0
X-purgate-type: clean
X-purgate-size: 4080
X-Notice: Whitelisted
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-01  mail-id: D8313A07EA  external: no

On Mon, Sep 21, 2026 at 03:31:24PM -0700, Josh Poimboeuf wrote:
> With CONFIG_OBJTOOL_CONTROL_FLOW, the objtool pass on vmlinux.o is going
> to be generating a list of its exported noreturns which will then be
> read by the modules' objtool pass, so there will need to be a build
> dependency between them.
> 
> In preparation for that, run objtool right before the module link so its
> no longer done on the descend in the deferred case.
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> ---
>  scripts/Makefile.build      | 31 +++++++++++++++----------------
>  scripts/Makefile.modfinal   | 20 +++++++++++++++-----
>  scripts/livepatch/klp-build | 12 ++++++------
>  3 files changed, 36 insertions(+), 27 deletions(-)
> 
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 87993362595ce..c1b22b4a4e217 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -271,15 +271,21 @@ cmd_record_mcount = $(if $(findstring $(strip $(CC_FLAGS_FTRACE)),$(_c_flags)),
>  	$(sub_cmd_record_mcount))
>  endif # CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT
>  
> -# 'OBJECT_FILES_NON_STANDARD := y': skip objtool checking for a directory
> -# 'OBJECT_FILES_NON_STANDARD_foo.o := 'y': skip objtool checking for a file
> -# 'OBJECT_FILES_NON_STANDARD_foo.o := 'n': override directory skip for a file
> -
> +ifdef CONFIG_OBJTOOL
> +#
> +# NOTE: these variables are deprecated, and have no effect when
> +# CONFIG_OBJTOOL_DEFERRED is enabled.  Objtool-allergic code can instead be
> +# marked with STACK_FRAME_NON_STANDARD() or ANNOTATE_*().
> +#
> +#   'OBJECT_FILES_NON_STANDARD := y': skip objtool checking for a directory
> +#   'OBJECT_FILES_NON_STANDARD_foo.o := 'y': skip objtool checking for a file
> +#   'OBJECT_FILES_NON_STANDARD_foo.o := 'n': override directory skip for a file
> +#
>  is-standard-object = $(if $(filter-out y%, $(OBJECT_FILES_NON_STANDARD_$(target-stem).o)$(OBJECT_FILES_NON_STANDARD)n),$(is-kernel-object))
>  
> -ifdef CONFIG_OBJTOOL
> -$(obj)/%.o: private objtool-enabled = $(if $(is-standard-object),$(if $(CONFIG_OBJTOOL_DEFERRED),$(is-single-obj-m),y))
> -endif
> +# Enable per-TU objtool for !CONFIG_OBJTOOL_DEFERRED
> +$(obj)/%.o: private objtool-enabled = $(if $(CONFIG_OBJTOOL_DEFERRED),,$(if $(is-standard-object),y))
> +endif # CONFIG_OBJTOOL
>  
>  ifneq ($(findstring 1, $(KBUILD_EXTRA_WARN)),)
>  cmd_warn_shared_object = $(if $(word 2, $(modname-multi)),$(warning $(kbuild-file): $*.o is added to multiple modules: $(modname-multi)))
> @@ -497,17 +503,10 @@ $(obj)/lib.a: $(lib-y) FORCE
>  	$(call if_changed,ar)
>  
>  quiet_cmd_ld_multi_m = LD [M]  $@
> -      cmd_ld_multi_m = $(LD) $(ld_flags) -r -o $@ @$< $(cmd_objtool)
> +      cmd_ld_multi_m = $(LD) $(ld_flags) -r -o $@ @$<
>  
> -define rule_ld_multi_m
> -	$(call cmd_and_savecmd,ld_multi_m)
> -	$(call cmd,gen_objtooldep)
> -endef
> -
> -$(multi-obj-m): private objtool-enabled := $(CONFIG_OBJTOOL_DEFERRED)
> -$(multi-obj-m): private part-of-module := y
>  $(multi-obj-m): %.o: %.mod FORCE
> -	$(call if_changed_rule,ld_multi_m)
> +	$(call if_changed,ld_multi_m)
>  $(call multi_depend, $(multi-obj-m), .o, -objs -y -m)
>  
>  # Add intermediate targets:
> diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
> index 01a37ec872b90..56b4227cc6863 100644
> --- a/scripts/Makefile.modfinal
> +++ b/scripts/Makefile.modfinal
> @@ -32,11 +32,18 @@ ifneq ($(WARN_ON_UNUSED_TRACEPOINTS),)
>  cmd_check_tracepoint = $(objtree)/scripts/tracepoint-update --module $<;
>  endif
>  
> +$(modules:%.o=%.ko): private objtool-enabled = $(CONFIG_OBJTOOL_DEFERRED)

Reviewed-by: Nicolas Schier <n.schier@fritz.com>

I understand that the variable name objtool-enabled is used across 
Makefiles and that it makes sense to have it here, too, for consistency 
and better spotting.

So, just for my understanding: in Makefile.modfinal it is not strictly 
necessary but could be replaced by direct use of 
$(CONFIG_OBJTOOL_DEFERRED); is that correct?

-- 
Nicolas
