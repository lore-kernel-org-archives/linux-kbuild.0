Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C63234252D;
	Wed,  6 May 2026 18:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778093090; cv=none; b=WILHgZEIthbDfBax6farY1srm81pj20kktLrlQwUofNXWhlEXBDcYLWYCRvMCroP7dmL9vBqG9Ehj07e5Sv4dtDualgyf35efyOY2y1MRhnXbANQ2ZWMP9bnQjbcPt4Xbs9Gw8qKZK0K1oRAiM0rvsFkl8rztwi7cU5UgoIGnhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778093090; c=relaxed/simple;
	bh=PhUTFwNZhL26mBnCQolEZhAS8rM1PlBSjQ8H1nTgPh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kmGQoFqPh/Arkk+nnRYsO/1Tid6SPNG+JtDMYqIeA368w2zbxPLTWXCqwMXhiflWdaLmDYVnaBVotyGcG8j48fmPD/IGOJtc3DBijYpHRg8qmilF6BC0pUTRTfF8vZfr6iN0h9irJqZjW8aVfRHwI10cnpOljMkMQJ7jYC9yuYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FylzyLg3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FylzyLg3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE66C2BCB0;
	Wed,  6 May 2026 18:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778093090;
	bh=PhUTFwNZhL26mBnCQolEZhAS8rM1PlBSjQ8H1nTgPh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FylzyLg3tP5NRy+iz162qz9JGnBXJjmgYQZ9opVu2Dt+be+20VCYvGLhnG7o1nYtc
	 eq1qEXqsga4sIaDUfD1FbqJga8MY1xHTgrCEHK9k+iMvhdIhxBk9oVP5jWVk6hlF1b
	 yqWXWXoRBZpzR82G6NJYBwS49tA5qkLWOf2O1Pd+gE16f5veLuMdRfCwHgdP2UZi5W
	 d9GPNBwT/LX9lFdu8+rXe1CXB/KCYSNMMolOcgeG74lNLfXpWzo4fUFfHNrWo1+iaR
	 V5a8Jin246HLZH+AJHkzyTlIhokpOztBfx/Xf02MVWBFHohPfcWS08QqnKWwtW5Q+O
	 MA47VBZwWgoxg==
Date: Wed, 6 May 2026 13:44:47 -0500
From: Rob Herring <robh@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Tamir Duberstein <tamird@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Aleksander Jan Bajkowski <olek2@wp.pl>,
	Test User <test@example.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: wire style checker into
 dt_binding_check
Message-ID: <20260506184447.GA2816439-robh@kernel.org>
References: <cover.1777471439.git.daniel@makrotopia.org>
 <ed254ed45f19f37a7e7933a33f2f00195d8e5f20.1777471439.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed254ed45f19f37a7e7933a33f2f00195d8e5f20.1777471439.git.daniel@makrotopia.org>

On Wed, Apr 29, 2026 at 03:21:33PM +0100, Daniel Golle wrote:
> Run dt-check-style as part of dt_binding_check_one. The recipe wraps
> the tool with scripts/jobserver-exec so worker count follows the GNU
> make jobserver -- `make -j N dt_binding_check` constrains the checker
> to N workers rather than spawning one per CPU.
> 
> Default mode (relaxed) is zero-violation on the current tree, so this
> does not introduce new warnings into make dt_binding_check. Stricter
> rules are available via --mode=strict (eg. for use by checkpatch.pl in
> a future series).
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> Changes since v1:
>  - dropped xargs -n200 -P$(nproc) sharding; single Python invocation
>    with file list via @argfile
>  - dropped `|| true`: relaxed mode is zero-output today

Just to make sure, when there is a warning added, we don't want to error 
out the build. Because they will sneak in.

>  - wrapped under scripts/jobserver-exec so worker count follows the
>    make jobserver
> 
>  Documentation/devicetree/bindings/Makefile | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/devicetree/bindings/Makefile
> index 7b668f7fd400..35ddd0b7a349 100644
> --- a/Documentation/devicetree/bindings/Makefile
> +++ b/Documentation/devicetree/bindings/Makefile
> @@ -46,6 +46,19 @@ quiet_cmd_chk_bindings = CHKDT   $(src)
>  			  xargs -n200 -P$$(nproc) $(DT_DOC_CHECKER) -u $(src)) \
>  			  && touch $@ || true
>  
> +DT_CHK_STYLE = $(srctree)/scripts/dtc/dt-check-style
> +
> +# Feed the file list to the checker via @argfile in a single Python
> +# process so the ruamel.yaml import is paid once. scripts/jobserver-exec
> +# claims slots from the GNU make jobserver and exposes the count via
> +# $PARALLELISM, which dt-check-style picks up to size its worker pool.
> +quiet_cmd_chk_style = STYLE   $(src)
> +      cmd_chk_style = f=$$(mktemp) && $(find_cmd) > $$f && \
> +		      $(PYTHON3) $(srctree)/scripts/jobserver-exec \
> +		      $(PYTHON3) $(DT_CHK_STYLE) @$$f; \

What's the reason to run via PYTHON3 vs. running dt-check-style 
directly? It's just different from the rest of this makefile.

> +		      r=$$?; rm -f $$f; \
> +		      if [ $$r -eq 0 ]; then touch $@; else exit $$r; fi
> +
>  quiet_cmd_mk_schema = SCHEMA  $@
>        cmd_mk_schema = f=$$(mktemp) ; \
>                        $(find_all_cmd) > $$f ; \
> @@ -62,13 +75,16 @@ override DTC_FLAGS := \
>  $(obj)/processed-schema.json: $(DT_DOCS) check_dtschema_version FORCE
>  	$(call if_changed,mk_schema)
>  
> -targets += .dt-binding.checked .yamllint.checked
> +targets += .dt-binding.checked .yamllint.checked .dt-style.checked
>  $(obj)/.yamllint.checked: $(DT_DOCS) $(src)/.yamllint FORCE
>  	$(if $(DT_SCHEMA_LINT),$(call if_changed,yamllint),)
>  
>  $(obj)/.dt-binding.checked: $(DT_DOCS) FORCE
>  	$(call if_changed,chk_bindings)
>  
> +$(obj)/.dt-style.checked: $(DT_DOCS) FORCE
> +	$(call if_changed,chk_style)
> +
>  always-y += processed-schema.json
>  targets += $(patsubst $(obj)/%,%, $(CHK_DT_EXAMPLES))
>  targets += $(patsubst $(obj)/%.dtb,%.dts, $(CHK_DT_EXAMPLES))
> @@ -82,7 +98,7 @@ dt_compatible_check: $(obj)/processed-schema.json
>  	$(Q)$(srctree)/scripts/dtc/dt-extract-compatibles $(srctree) | xargs dt-check-compatible -v -s $<
>  
>  PHONY += dt_binding_check_one
> -dt_binding_check_one: $(obj)/.dt-binding.checked $(obj)/.yamllint.checked
> +dt_binding_check_one: $(obj)/.dt-binding.checked $(obj)/.yamllint.checked $(obj)/.dt-style.checked
>  
>  PHONY += dt_binding_check
>  dt_binding_check: dt_binding_check_one $(CHK_DT_EXAMPLES)
> -- 
> 2.54.0
