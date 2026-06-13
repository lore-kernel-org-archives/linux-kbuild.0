Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D30230FC1B;
	Sat, 13 Jun 2026 10:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781347846; cv=none; b=nYSM8MriDca0C1Um6NwFV9oHdxJqqzW+RlekvPFADEJ7osxdWCkCeDcEzZVoCWNMXAbxGrtckpsYg8HDyLZnsCHOnkX22l2az6KJ7rX89JvZzlYMKxeVVAJTVMqF48qe0eEXxsVjAvgdWgieFhYf6CwDIZr1Dsg+M4QjkmtG2SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781347846; c=relaxed/simple;
	bh=WP8VzpvierdmBjFBurAudRt6S0GlTLUprcqSzlcKKPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ALZfR6UxaAafIhNJtPlyypDIdXqdBc/5RjJpcKcsZon8KfIHXrXOesmm5vVmEOldrUoLQc8kx3xEZ/1aqJqRXKqLQ1eG461vCjthhEy8gcDOVthX8MsEnAuhG8dintTQrVMlfTrJnLizUM4Dj/YF7VwyiIrX+jAeqU0321WjyxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bJE9VgLu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bJE9VgLu"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 00B0B1F000E9;
	Sat, 13 Jun 2026 10:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781347844;
	bh=IiyC/V6vaWoJ1zDDcXwKdklMF8ShJoMIJ06FZKzXDwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bJE9VgLuHN6EviPsjCt8T3IlQnbtDeQCSz3a73RPHTPyGudEsqg0QLyyB8rnpF9Tb
	 /5bJ0vDiqWJs/QIGLCrpyYxudPjrcMIcR32dv5b01vKxuM5oYONfFI/ok4+4O85Yib
	 XTp2f/5wjMwO5xznAVTp8UHrYKfJviXfDX2FrSZIKO46bLqwYq30gQ7JkpRXqVNYhn
	 OSv6GvdgPRPs9lfBr5ETYMSYM0UNbjZaxa5agfbHeXcN+VIYudfy77v4TdPmAMOWo+
	 agR0+jkEfZXxRBaf29vQzFY2uJtG0gWhC8h5ioLWYejRI9rmFXxIjKwMQLz4nN7iMJ
	 1mEbZ1/kmsVOw==
Date: Sat, 13 Jun 2026 11:58:03 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Ping-Ke Shih <pkshih@realtek.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	David Sterba <dsterba@suse.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Hariharan Basuthkar <quic_hbasuthk@quicinc.com>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Filipe Manana <fdmanana@suse.com>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Wei Yang <richard.weiyang@gmail.com>, Takashi Iwai <tiwai@suse.de>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	Chih-Kang Chang <gary.chang@realtek.com>,
	David Lechner <dlechner@baylibre.com>,
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	Tamir Duberstein <tamird@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Pagadala Yesu Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Aleksander Jan Bajkowski <olek2@wp.pl>, Boris Burkov <boris@bur.io>,
	Blake Jones <blakejones@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v5 3/4] dt-bindings: wire style checker into
 dt_binding_check
Message-ID: <ai0pqz9904tzrDGl@levanger>
Mail-Followup-To: Daniel Golle <daniel@makrotopia.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Ping-Ke Shih <pkshih@realtek.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	David Sterba <dsterba@suse.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Hariharan Basuthkar <quic_hbasuthk@quicinc.com>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Filipe Manana <fdmanana@suse.com>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Wei Yang <richard.weiyang@gmail.com>, Takashi Iwai <tiwai@suse.de>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	Chih-Kang Chang <gary.chang@realtek.com>,
	David Lechner <dlechner@baylibre.com>,
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	Tamir Duberstein <tamird@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Pagadala Yesu Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Aleksander Jan Bajkowski <olek2@wp.pl>, Boris Burkov <boris@bur.io>,
	Blake Jones <blakejones@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
References: <cover.1779908995.git.daniel@makrotopia.org>
 <a14fdbded0acdc4fef1c1278100f2f4c6a93a488.1779908995.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a14fdbded0acdc4fef1c1278100f2f4c6a93a488.1779908995.git.daniel@makrotopia.org>

On Wed, May 27, 2026 at 08:32:26PM +0100, Daniel Golle wrote:
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
> v5:
>  - no change; depends on the new jobserver-exec fix in 2/4 so
>    style failures stay visible instead of being cached
> 
> v4:
>  - build the @argfile with f=$(mktemp) and remove it with rm -f
>    (matching cmd_mk_schema), instead of Kbuild's $(tmp-target)
>    which leaves a stale .tmp_.dt-style.checked in the build tree
> 
> v3:
>  - use Kbuild's $(tmp-target) instead of mktemp so build output
>    stays inside the build folder (Nathan)
>  - collapse the conditional cleanup tail into the familiar
>    "&& touch $@ || true" pattern, matching cmd_chk_bindings;
>    keeps future warnings non-fatal (Rob, Nathan)
>  - retained the explicit $(PYTHON3) prefix (Rob asked why it
>    differs from the rest of this Makefile): per
>    Documentation/kbuild/makefiles.rst "Script invocation",
>    in-tree scripts should be called through their interpreter so
>    the executable bit and shebang are not relied on and the
>    user's $(PYTHON3) override is respected. The neighbouring
>    recipes invoke their Python helpers directly because those
>    come from external packages (dtschema's dt-extract-*,
>    dt-check-compatible, dt-doc-validate), which is the case Rob
>    asked about and which sits outside that rule.
> 
> v2:
>  - dropped xargs -n200 -P$(nproc) sharding; single Python invocation
>    with file list via @argfile
>  - dropped `|| true`: relaxed mode is zero-output today
>  - wrapped under scripts/jobserver-exec so worker count follows the
>    make jobserver
> 
>  Documentation/devicetree/bindings/Makefile | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/devicetree/bindings/Makefile
> index 7b668f7fd400..00149e824261 100644
> --- a/Documentation/devicetree/bindings/Makefile
> +++ b/Documentation/devicetree/bindings/Makefile
> @@ -46,6 +46,18 @@ quiet_cmd_chk_bindings = CHKDT   $(src)
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
> +		      $(PYTHON3) $(DT_CHK_STYLE) @$$f \
> +		      && touch $@ || true; rm -f $$f

As usage of $(mktemp) requires an unconditional 'rm -f $$f', too, I'd
like to repeat Nathans suggestion to use Kbuild's $(tmp-target) instead.
The rationale, as Nathan wrote, is to keep generated files within the
build tree.


-- 
Nicolas
