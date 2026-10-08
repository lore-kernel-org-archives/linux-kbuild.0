Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64583939DA;
	Thu,  8 Oct 2026 15:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791473919; cv=none; b=Gfq82EIXIOnahnnRv3RydRPvScI+SUqf9D+LUuUSxWt8ddvl1e0k8LpIrVmuBhkFAmQPAE1RokZTVGtmsWRGioHYI6xGBlZW3U4AJPyc1yDeGa1oNUPMRY6WzwMkCGkIJts3zZX7HaIigdv0kr0P7Ivj5nV6MUWMoDkV7TbIVd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791473919; c=relaxed/simple;
	bh=IdjkUm2rEYtd4L3rKKMYLJ+OlOFm/l6+RvlNoj3CY/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hs8dmDmCAmzvpY6cBAZ3wkl25iHY2MIQLDGqvYTWX55CIfHCHNLqfgg70durghsIEZgnSwjxoS7mBY1Q0u8vQ7gf2WtQhL1ZMpVlp1ZM5KZecX36KjEckrffPE28LQwUQPiCthP0snaL7R95iHLFk51p8e2UqqWmWigdNT2wPzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IS6es9ML; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IS6es9ML"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57AA51F000FF;
	Thu,  8 Oct 2026 15:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791473918;
	bh=MXdITqxLgSSUpRhxRccAsJ6d7ByUZdAQeqa9bUFE0gI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IS6es9MLS3+ErVgCpFiORPEMyWhwf7m5tMxXtrnzAdIEuQ0Vo3dzX21yhPYbiVnbM
	 2exihNTALChxOpPBsu843E+WVXp/AYJqeumreLhTbftgXu+q10pHrXm/Nn70XuoLkZ
	 5uB64Qtnd6vOVoN7uWZpXTyGueH9CBTl8MNArlefSTkvmItiu15I0SfpjfTUvd3iV5
	 6M1nKptXLj2VqGXBCrUipbF0YGavCtBxg1SK8mkPcGDhR/C1H8ywvoKwmg73YnV1D+
	 SQxVzh16pDNunADTgNqjPCNNyVRsemQhv7KgUoTdlaraImWHNjgdX1IGbPugY9YAtN
	 gSQKZ483I9X4Q==
Date: Thu, 8 Oct 2026 10:38:37 -0500
From: Rob Herring <robh@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>
Cc: David Heidelberg <david@ixit.cz>, Arnd Bergmann <arnd@arndb.de>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/2] kbuild: Support directory targets for building
 DTBs
Message-ID: <20261008153837.GC183998-robh@kernel.org>
References: <20261007-dtb-dirs-v3-v3-0-b3ab32b64fa6@kernel.org>
 <20261007-dtb-dirs-v3-v3-2-b3ab32b64fa6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007-dtb-dirs-v3-v3-2-b3ab32b64fa6@kernel.org>

On Wed, Oct 07, 2026 at 01:39:41PM -0500, Rob Herring (Arm) wrote:
> It is useful to be able to build all the DTBs for a vendor. One can list
> all the .dts files in a directory and convert those to %.dtb targets,
> but that doesn't work for base+overlay DTB targets.
> 
> The 'dtbs' and 'dtbs_check' targets can use the directory rule targets
> as well which avoids different make paths for building DTBs.
> 
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v3:
>  - Reworked on top of single target rule for %.dtb
>  - Make dtbs target use directory rule.
>  - Move adding boot/dts subdir out of the arch code. Now supported on
>    every arch (not that useful without vendor dirs).
>  - Removed the need to look at MAKECMDGOALS
>  - Fixed unnecessary rebuilding DT base+overlay targets
>  - Link to v2: https://lore.kernel.org/all/20251120204812.1983452-4-robh@kernel.org/
> 
> v2:
>  - Convert arm, mips and riscv. The other DT enabled arches don't have
>    vendor directories.
>  - Link to v1: https://lore.kernel.org/all/20251113225952.867138-1-robh@kernel.org/
> ---
>  Makefile               | 8 ++++----
>  scripts/Makefile.build | 7 +++++++
>  scripts/Makefile.dtbs  | 2 ++
>  3 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index c307ee9293bc..75d290c2b7d8 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1664,8 +1664,8 @@ dtbindingtree := Documentation/devicetree/bindings
>  ifneq ($(dtstree),)
>  
>  PHONY += dtbs dtbs_prepare dtbs_install dtbs_check
> -dtbs: dtbs_prepare
> -	$(Q)$(MAKE) $(build)=$(dtstree) need-dtbslist=1
> +dtbs:
> +	$(Q)$(MAKE) $(dtstree)/
>  
>  # include/config/kernel.release is actually needed when installing DTBs because
>  # INSTALL_DTBS_PATH contains $(KERNELRELEASE). However, we do not want to make
> @@ -2216,7 +2216,7 @@ single-goals := $(addprefix $(build-dir)/, $(single-no-ko))
>  
>  # DT-only targets need host tools, but no architecture-specific preparation.
>  ifneq ($(dtstree),)
> -single-dt-patterns := $(addprefix $(dtstree)/,%.dtb %.dtbo)
> +single-dt-patterns := $(dtstree)/ $(addprefix $(dtstree)/,%.dtb %.dtbo %/)
>  ifeq ($(filter-out $(single-dt-patterns),$(single-no-ko)),)
>  single-build-prep := dtbs_prepare
>  endif
> @@ -2234,7 +2234,7 @@ prepare: outputmakefile
>  # Error messages still appears in the original language
>  PHONY += $(build-dir)
>  $(build-dir): $(single-build-prep)
> -	$(Q)$(MAKE) $(build)=$@ need-builtin=1 need-modorder=1 $(single-goals)
> +	$(Q)$(MAKE) $(build)=$@ need-builtin=1 need-modorder=1 need-dtbslist=1 $(single-goals)

sashiko points out that this creates dtblist files in every directory. 
Will make it conditional on having DTB targets.

Rob
