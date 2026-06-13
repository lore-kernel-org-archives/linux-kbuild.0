Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C22321420;
	Sat, 13 Jun 2026 17:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781372499; cv=none; b=qdfElrvMZJJUq32MBZeBmoOJMo1T7e04sZf+4yMbe//38UZzDoCjcKDXZv7GHG/4eiVjX8aSIo/3rkSSoxLRit72m1IoQ3cSS64eyqaAR+tEyccg5zGeYdxCTDW/VUcFUT/kumjrh8evYl+UzqCoAKIaStmvCrTznHjrADyRf7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781372499; c=relaxed/simple;
	bh=Yu34RnKrBOohm55m9lVO18WTTRs0FIgd/HBlln191Uw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C1jrd4TkmHMzXyfHu2A+rtqfRrAqwMuOVkxfeT737Khi2gA/vq2De2J/j2t2Huk8rwwuyU5uBq2erzJBnPNpT05p06SmpD6jchl6kWxtD8aaj7seVp52O5hphlQlPDZMMFK7lEvq/XJnp1AL6bn3odSdKPXVCT5iOX4Ab6Hl7aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FkzL/nFv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FkzL/nFv"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 2ED241F000E9;
	Sat, 13 Jun 2026 17:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781372497;
	bh=CrVbd8XiWduTJRK7vc9W39csYSLbgHJhf+UYLd6BDuM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FkzL/nFvNt1fcsrClUg1MSbg9oBfgW/svfpZ6dVZVwz1+EGeToY0wNgOdzbvlnKqB
	 7bp/HlnAPrb+zPhZRY5LKx2Kb65TnHsSF7hc11RG020tdbPmMffIVnbhkCjXib1H5h
	 zrSmKndqowCxYQyP+0rpuqakU0sOlkaqKUf7Q+uHOiE5BfXTDnqwc/sRBOtV5wVZ68
	 3VG5/njFW1mE3F1i/rhydVd0WwjU85tDFbw8N1rLKmJ7KQ1L6wlTtbzNc/bB/smo2e
	 dIEYmdbFhdUau9TGdM3zr3ig+OOYnmP7IxY0fxNtM3kidJkJZ5zRh1+31KVQQ/AFsl
	 YjZkEHzaoPvbw==
Date: Sat, 13 Jun 2026 19:39:04 +0200
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
Subject: Re: [PATCH v5 2/4] scripts/jobserver-exec: propagate child exit
 status
Message-ID: <ai2VuFWUxVRGjGKR@levanger>
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
 <660368ca16e2d3845577a9fd157d2f37f0e09e85.1779908995.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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
> 
> diff --git a/scripts/jobserver-exec b/scripts/jobserver-exec
> index 758e947a6fb9..21b319e6c9a5 100755
> --- a/scripts/jobserver-exec
> +++ b/scripts/jobserver-exec
> @@ -28,8 +28,8 @@ def main():
>          sys.exit("usage: " + name +" command [args ...]\n" + __doc__)
>  
>      with JobserverExec() as jobserver:
> -        jobserver.run(sys.argv[1:])
> +        return jobserver.run(sys.argv[1:])
>  
>  
>  if __name__ == "__main__":
> -    main()
> +    sys.exit(main())
> -- 
> 2.54.0

Good catch, thanks!

For kbuild:
Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas
