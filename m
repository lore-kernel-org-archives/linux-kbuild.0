Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D01648B389;
	Tue,  9 Jun 2026 17:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781024887; cv=none; b=CpvdGFFGUOj0nTI7R3oYHRjyh/MvHJRLh/eddl3CA7Ki69kPIs42xt8UhTqXTvp2izJdPaUY1qfcS4G9GqGRbPbIZLoQQSgzMEDYqsNS0tm1xCBozuoTdise7hrcKI2Z4oRcuGmwZJHKFlX+w/SnADJPWkiOkQvP326LAGvQ6EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781024887; c=relaxed/simple;
	bh=TWticakF4lsCd+LJNURSo9PTN1fmU7xSrDoT1KoM52Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nXmPcLdZzUJNyuwwFOJcAiaoxofCfuHt2MpGc+YI8wJ5ScDc1mNm+CuPAHtLl3yZ11XsXPADl1psrQXlg4y7h9fy6dy3vaZPoJ08jhDYJLv/lHPVeBcRAzEUqrGUIt86ufM6LnxkPMebd4PuA1earVWPPknlQ47+8Txoftr9R4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P3OIWRCa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P3OIWRCa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E363A1F00893;
	Tue,  9 Jun 2026 17:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781024886;
	bh=G07BoObhKste5pzhCvWzVieE17MhkuJWd46kgmO594g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P3OIWRCamIglcHyNYS7Hq+y8/uvM/ciIRhGSoC1tsT6yVDI2BOot/UzSenGbGR2xP
	 NYJjSqA0/pj9c0PiRwYOBvkYiLz1VX3SYQwoqXB3OwsAZWydsfw6kNAt4rpauDZeX4
	 ANazaxqo2Q7b/0bqymc4QVEMdAMFX+hV6qt5We/jO3QeItXR1RaOWXFpJkKrlgRO0v
	 udfab0Hk6eBoGvXy5YB53RS0CzF+gOJSR2gyVUlBuu9ex3ioa5MObsYxI5qrkr1rgt
	 td1WNhypQnecUW+GsU0SkiyvLuDpxuScFtCQhujN+5wGVDLlRTdDchZDc7OcrJrHif
	 bdP7faOZQCsBw==
Date: Tue, 9 Jun 2026 19:08:02 +0200
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
Subject: Re: [PATCH v5 2/4] scripts/jobserver-exec: propagate child exit
 status
Message-ID: <20260609-cunning-aboriginal-moose-2da14d@quoll>
References: <cover.1779908995.git.daniel@makrotopia.org>
 <660368ca16e2d3845577a9fd157d2f37f0e09e85.1779908995.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <660368ca16e2d3845577a9fd157d2f37f0e09e85.1779908995.git.daniel@makrotopia.org>

On Wed, May 27, 2026 at 08:32:18PM +0100, Daniel Golle wrote:
> main() called JobserverExec().run() and discarded its return value,
> then the script exited with the implicit status 0. As a result, any
> Makefile that wired a build step through jobserver-exec saw the step
> silently succeed even when the wrapped command had failed.
> 
> Two in-tree callers were affected:
> 
>   Documentation/devicetree/bindings/Makefile
>     cmd_chk_style runs a python checker via jobserver-exec and uses
>     "&& touch $@ || true" so failures leave the stamp file untouched
>     and the next make rerun reports them again. The swallowed exit
>     code made the stamp file get created even on failure, caching the
>     failed run and hiding the reported issues until the inputs change.
> 
>   scripts/Makefile.vmlinux_o
>     cmd_gen_initcalls_lds runs scripts/generate_initcall_order.pl via
>     jobserver-exec; a perl failure was masked by the wrapper.
> 
> Return the subprocess exit code from main() and pass it to sys.exit()
> so the wrapped command's status reaches make.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> v5: new patch; prereq for chk_style in 3/4 so style failures
>     leave the stamp file untouched instead of being cached
> 
>  scripts/jobserver-exec | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

