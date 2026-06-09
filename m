Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884543B635F;
	Tue,  9 Jun 2026 16:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781021993; cv=none; b=a57oRLvoHzpSRp/lB/FUD9Hcqx311RziBDsqsQx/pMm676YJTv1mTo3wyKkUOCw5RZ8w6ZKYmiUrGSMuqLXIvw6C0AmenJWzxvXouxLPe+oOtMqAp5iI5VlA9nL+ELXGTjWt271pjwkNo+4B9lkT/LU+2RTZF4QCvIhmh9FSRBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781021993; c=relaxed/simple;
	bh=j/TcUkAADk/ErOnVG4elqZ0QlOTbpBt/BsP3nJ8TlYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ugQq6kuPfDJqPyzMjRHG6GcAGf8pKiEiCLsBnMs63I3O2rZZx5EqqvTYGnxhSb1cximCg/BLNkA+jIrkbpna00o70XxBsPSCT2onO3lElnWYVq8Ld67l3vOyvd4RxJLKyH7Y8u9zDL0qbY0zcG7kiW+7tLZ/DgmQwZJYXRceIyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dtpgYK8H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dtpgYK8H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D137A1F00893;
	Tue,  9 Jun 2026 16:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781021991;
	bh=OwEVouHGm4j2bBK7dp3Q0GarnuDfIaAGqapIB+1/34I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dtpgYK8HOu48Rr7sxNw9QNxturYLrnJHo3Vs7u2wbJX27WEN1fslVQI1BUhVZktGL
	 BwvGaATv1aF3wrRLBGDReHhVFsApzyK2a/OMeZAqazYLxrYo3QCEVWult4N4NZghYc
	 h+QxAKa8gySA4yUENJ8wPm+6/Da6D+mIQ1KSLPAgjSQS9WtUhYq64en6+fZ5+bD7mJ
	 mMaMtVJZdvrMgyi9xfTLQVIexVtrHyCoV3wiULqKfZaQAvCHHRjykXQCA2q5QRjf2Q
	 bTJou7RwqplIZpJoanCLwekwvbim3/M147cEVOKSNi0R988UAYlMxSukeM32heVJmP
	 OoFhytEcc7H9g==
Date: Tue, 9 Jun 2026 18:19:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Ping-Ke Shih <pkshih@realtek.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, David Sterba <dsterba@suse.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Hariharan Basuthkar <quic_hbasuthk@quicinc.com>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Filipe Manana <fdmanana@suse.com>, 
	Bitterblue Smith <rtl8821cerfe2@gmail.com>, Wei Yang <richard.weiyang@gmail.com>, 
	Takashi Iwai <tiwai@suse.de>, Aurabindo Pillai <aurabindo.pillai@amd.com>, 
	Chih-Kang Chang <gary.chang@realtek.com>, David Lechner <dlechner@baylibre.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Tamir Duberstein <tamird@kernel.org>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Pagadala Yesu Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Aleksander Jan Bajkowski <olek2@wp.pl>, 
	Boris Burkov <boris@bur.io>, Blake Jones <blakejones@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: add DTS style checker
Message-ID: <20260609-rebel-hummingbird-of-maturity-2325b1@quoll>
References: <cover.1779908995.git.daniel@makrotopia.org>
 <224923f3d1c73ff55cebb3e0796f119e32c1bb43.1779908995.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <224923f3d1c73ff55cebb3e0796f119e32c1bb43.1779908995.git.daniel@makrotopia.org>

On Wed, May 27, 2026 at 08:32:10PM +0100, Daniel Golle wrote:
> Add a Python tool that checks DTS coding style on examples in YAML
> binding files and on .dts/.dtsi/.dtso source files. Rules are kept in
> a small declarative registry, each tagged 'relaxed' (default; must be
> zero-violation on the current tree) or 'strict' (opt-in for new
> submissions). Promoting a rule from strict to relaxed is a one-line
> edit once the tree is clean.
> 
> Relaxed mode covers trailing whitespace, tab characters in YAML
> examples, mixed tab+space indents, and missing tabs in .dts files.
> Strict adds indent unit and consistency checks, blank-line placement,
> sibling address ordering, "compatible" and "reg" ordering, and unused
> labels.
> 
> The tool reads file paths from @argfile and parallelises across CPUs
> via -j N. With no -j given it picks up $PARALLELISM (set by
> scripts/jobserver-exec from the GNU make jobserver) and falls back to
> os.cpu_count() otherwise. Running as one Python invocation amortises
> the ruamel.yaml import across the whole tree -- ~2s on a 32-CPU host
> vs ~28s sequential.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---

Probably by relying mostly on regex instead of proper token parsing we
will hit a wall at some point, but it's better than what I would write.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

