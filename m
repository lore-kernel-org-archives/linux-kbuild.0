Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F24E14B097;
	Tue, 20 Aug 2024 21:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724190623; cv=none; b=F3g82DZsCXgucXvTTXcIKf/popPGjIeOmpHcIJ2R8yoiKSmD268m6fV9AxT9LD+yd16mxtgKCW4QKpdqxNurk00qX1UbmKjm/etjVQmLgLxNHBqoE8l8tkwEtk/fY6xAkAFovduEhxRBta/qveRJpUFoQ3bELi9VRNxyoKPJnq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724190623; c=relaxed/simple;
	bh=b1LSMxMugc+o6TT6FRC2cEJRI1nzdL1w+j95nWOf2Bc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MvFjmj+PugkksmJcwNyM/qMazut9lK3YTy5K5iwDpffILazqDIk7GsAxtEUEmPcHhEWaEgxV8C0g44bHAtl0Les8867fg8Es9/AN+mcN61JPPg/1aDx4e09NC6obNVJpFewEW3PmVH5Jq3pgNH3TLwKjrs+6XfJIRKt2SG9urio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PkqVk35i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PkqVk35i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92403C4AF09;
	Tue, 20 Aug 2024 21:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724190622;
	bh=b1LSMxMugc+o6TT6FRC2cEJRI1nzdL1w+j95nWOf2Bc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PkqVk35i0CfwnGj//Y4nxftVpxtLfhJapjDdnpZoTJEmuj6kmbAWzMLt5/ecdfr6f
	 bprQulIunJbdMkCcMdJosO0zwQRyGaPkPrr4d0RM668daxlTM3pq40MFtdYDyehXsO
	 m+R5+IAdkDdO8PpFFrKI4pt88YGwoT1iuZugU//uPg+sRr5IFjoSfvSvuoEu4R/kpF
	 BKlAP/NJjr1ghTzfrABm1HGjED6lOVrJOLdfjnKuUktfytqOx3EEDAL2WoRopyIDUS
	 4ycDSy7Mdb+h91Yt8yhBeFAPQLahScH+0geo5vT9GrF1Ez9pctjYF7rGBXCdQEq3b2
	 C/iMHt6he2I4A==
Date: Tue, 20 Aug 2024 14:50:20 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: Re: [PATCH] kbuild: fix typos "prequisites" to "prerequisites"
Message-ID: <20240820215020.GA2335251@thelio-3990X>
References: <20240818070736.80286-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240818070736.80286-1-masahiroy@kernel.org>

On Sun, Aug 18, 2024 at 04:07:11PM +0900, Masahiro Yamada wrote:
> This typo in scripts/Makefile.build has been present for more than 20
> years. It was accidentally copy-pasted to other scripts/Makefile.* files.
> Fix them all.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Ha, cute, good catch!

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
>  scripts/Makefile.build     | 2 +-
>  scripts/Makefile.modfinal  | 2 +-
>  scripts/Makefile.vmlinux   | 2 +-
>  scripts/Makefile.vmlinux_o | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index efacca63c897..a5ac8ed1936f 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -487,7 +487,7 @@ $(subdir-ym):
>  	need-modorder=$(if $(filter $@/modules.order, $(subdir-modorder)),1) \
>  	$(filter $@/%, $(single-subdir-goals))
>  
> -# Add FORCE to the prequisites of a target to force it to be always rebuilt.
> +# Add FORCE to the prerequisites of a target to force it to be always rebuilt.
>  # ---------------------------------------------------------------------------
>  
>  PHONY += FORCE
> diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
> index 1fa98b5e952b..306a6bb86e4d 100644
> --- a/scripts/Makefile.modfinal
> +++ b/scripts/Makefile.modfinal
> @@ -62,7 +62,7 @@ endif
>  
>  targets += $(modules:%.o=%.ko) $(modules:%.o=%.mod.o)
>  
> -# Add FORCE to the prequisites of a target to force it to be always rebuilt.
> +# Add FORCE to the prerequisites of a target to force it to be always rebuilt.
>  # ---------------------------------------------------------------------------
>  
>  PHONY += FORCE
> diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> index 49946cb96844..5ceecbed31eb 100644
> --- a/scripts/Makefile.vmlinux
> +++ b/scripts/Makefile.vmlinux
> @@ -33,7 +33,7 @@ targets += vmlinux
>  vmlinux: scripts/link-vmlinux.sh vmlinux.o $(KBUILD_LDS) FORCE
>  	+$(call if_changed_dep,link_vmlinux)
>  
> -# Add FORCE to the prequisites of a target to force it to be always rebuilt.
> +# Add FORCE to the prerequisites of a target to force it to be always rebuilt.
>  # ---------------------------------------------------------------------------
>  
>  PHONY += FORCE
> diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
> index 6de297916ce6..d64070b6b4bc 100644
> --- a/scripts/Makefile.vmlinux_o
> +++ b/scripts/Makefile.vmlinux_o
> @@ -87,7 +87,7 @@ targets += modules.builtin
>  modules.builtin: modules.builtin.modinfo FORCE
>  	$(call if_changed,modules_builtin)
>  
> -# Add FORCE to the prequisites of a target to force it to be always rebuilt.
> +# Add FORCE to the prerequisites of a target to force it to be always rebuilt.
>  # ---------------------------------------------------------------------------
>  
>  PHONY += FORCE
> -- 
> 2.43.0
> 
