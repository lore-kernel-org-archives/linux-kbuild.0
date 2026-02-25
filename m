Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE9929BD95;
	Wed, 25 Feb 2026 20:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772049862; cv=none; b=psiaOzccWe0FvdrgyyvQu0bi/Q5ksYC7rpVNN8qluSRSOi9M9zFSd6IvA+GUBdRiVqnaPuWtx59DHIQTE2pFLwnILMpcYs5RKgLvEeD6MCLcbqNS4ZU2vFWmfKwVQQBwf4zVhOV/l8j3rF4C3kSR/Jxm+BXG3Cyh7wDxrzgLhpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772049862; c=relaxed/simple;
	bh=+KChc48/1p7dN2mSJ2+AcDiaWpJHEogul0nLOxtEjMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iUgaDUe+RllGqCnhhGPC8AXYaTYfy3zHpw9ehH34B7ElOFXNJCvq/XG3/TlnYNLlSolrRZJo39nzR5ZerYegEresSCj4GlHSL/lhdG4FslOYT1+mkjq5VPcSh91NjLzm3s+a/LBnTpWGUOUzJPwwgkQFwTlTVkkwUWiHkko342A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oK8rEvkg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oK8rEvkg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4329C116D0;
	Wed, 25 Feb 2026 20:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772049862;
	bh=+KChc48/1p7dN2mSJ2+AcDiaWpJHEogul0nLOxtEjMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oK8rEvkgjLqhte4fNd4TvEVanSaNR5zPOFEr/3NZdrT5bI+xeBeB+CEAGmXs3vOmS
	 g3hYp6k78OM4mptOmXX9bBkUHXRX2f8HWfbDgagu0838SZ7f33nhzSwn+Vs3FZZW7u
	 ErYjMjtFDYGC7lq6CSu20Nl0UrCSG0mQu8jsneNg0U29zBl9QTkyyp1arJACDD5TZa
	 Ik+ebqiqasVDXTeYbjWqibpxSQ6CwFoDMKYKLncbOiE7mXqd7OPNBAIPJTYH3eXdKW
	 iJ0/ZPbZgmevwyUa8KbbuxqAvAUVgFqzYIsuIrBnDdb3n/U2SBsp75AQ2WU02785Np
	 ZNcj3qdmUlDEQ==
Date: Wed, 25 Feb 2026 13:04:17 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Michal Suchanek <msuchanek@suse.de>,
	Josh Poimboeuf <jpoimboe@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Nicolas Schier <nsc@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Tamir Duberstein <tamird@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
	Jiri Slaby <jslaby@suse.cz>
Subject: Re: [PATCH] kbuild: only clean objtool on mrproper
Message-ID: <20260225200417.GE2755225@ax162>
References: <20260225112633.6123-1-msuchanek@suse.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225112633.6123-1-msuchanek@suse.de>

On Wed, Feb 25, 2026 at 12:26:29PM +0100, Michal Suchanek wrote:
> For packaging purposes I want to be able to grab the tool binaries
> without the .o files
> 
> Fixes: 68b4fe32d737 ("kbuild: Add objtool to top-level clean target")
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>

Wouldn't resolve_btfids need the same treatment? Why is objtool special
here? Also, what's the use case? Running 'make clean' then copying what
is left? Josh, thoughts on this change?

> ---
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index e944c6e71e81..e9b8811a02f5 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1675,7 +1675,7 @@ vmlinuxclean:
>  	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/link-vmlinux.sh clean
>  	$(Q)$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) clean)
>  
> -clean: archclean vmlinuxclean resolve_btfids_clean objtool_clean
> +clean: archclean vmlinuxclean resolve_btfids_clean
>  
>  # mrproper - Delete all generated files, including .config
>  #
> @@ -1686,7 +1686,7 @@ PHONY += $(mrproper-dirs) mrproper
>  $(mrproper-dirs):
>  	$(Q)$(MAKE) $(clean)=$(patsubst _mrproper_%,%,$@)
>  
> -mrproper: clean $(mrproper-dirs)
> +mrproper: clean objtool_clean $(mrproper-dirs)
>  	$(call cmd,rmfiles)
>  	@find . $(RCS_FIND_IGNORE) \
>  		\( -name '*.rmeta' \) \
> -- 
> 2.51.0
> 
