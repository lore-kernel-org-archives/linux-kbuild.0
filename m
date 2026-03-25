Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E960303CA0;
	Wed, 25 Mar 2026 09:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774430254; cv=none; b=b9TmMS20JOTRp8E8mss8oPDY8KG7mk6N1Pt1EW/7jXyeRmkx8do4CpHsZH5xGePEiyU0edN/r8iN44lSy7ffiXUPq16OyNvPs+5yiY6RSPoBGHw2sOCC9RsS9ukHrnxONKlE96JPczFp7JM09Fcm8flZAhyPrBOHaDS//RWbmGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774430254; c=relaxed/simple;
	bh=4ScwFqn171HX1Hi0UuginrgxA6UZYGvppnqNjJyOGIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DZazeAyFLm7zYcGCi+McukqKnPtODi/WW/UNOhxFsDnYSyukLh+FH/WX4o39qK6E95+3bth8HjrJSS4MHuDIFMNIHTu5pgIEPWhEvz0Ldk5soP8ZPm8tvmirLwx4I6V3k87y66Cf8ri0P3z0HwXHR02DoHIczbJsH5wkweQARwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=egVCFxAj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="egVCFxAj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1EB8C4CEF7;
	Wed, 25 Mar 2026 09:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774430254;
	bh=4ScwFqn171HX1Hi0UuginrgxA6UZYGvppnqNjJyOGIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=egVCFxAj2i8/RJNz5i78aEfTQAFC0JOdptowRn7Ru9l50SIS/yGSNKzbfvorwVJbU
	 zCxPBAxEZhwRFBavx+FfJZhgPwtFTQ6f+wHVtMhszsjzFZ+ylCqh9wb4WVIF0486iG
	 MWs8Uqg93VWC/KU9eNeRDr8imS7jHhaliKMdtyvJ6UvSUOUXl4QQubFx6RTuRVPDjE
	 NtxH9f6Z+x1fTJwKsNj4lVVL2h73NuDcMD/qV+NWkOvWxVP6p+K0fbdNqMDViAVXow
	 b0olsaDb9R1FvjZbtSvje1GjQaaCjC5p3uM7lU6g2cIXz7UX1eTZEIFibaFXv6xTJ2
	 HqefLbPXb+xjg==
Date: Wed, 25 Mar 2026 09:45:05 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Mohamad Alsadhan <mo@sdhn.cc>
Cc: nathan@kernel.org, ojeda@kernel.org, gary@garyguo.net,
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Yoann Congal <yoann.congal@smile.fr>
Subject: Re: [PATCH v5] kbuild: host: use single executable for rustc -C
 linker
Message-ID: <acOgkfn-cOOy2YNG@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Mohamad Alsadhan <mo@sdhn.cc>, nathan@kernel.org, ojeda@kernel.org,
	gary@garyguo.net, linux-kbuild@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Yoann Congal <yoann.congal@smile.fr>
References: <20260317112021.14353-1-mo@sdhn.cc>
 <20260321150034.9915-1-mo@sdhn.cc>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260321150034.9915-1-mo@sdhn.cc>

Hi Mohamad,

On Sat, Mar 21, 2026 at 06:00:34PM +0300, Mohamad Alsadhan wrote:
> rustc's -C linker= option expects a single executable path. When
> HOSTCC contains a wrapper (e.g. "ccache gcc"), passing
> `-Clinker=$(HOSTCC)` results in the shell splitting the value into
> multiple words, and rustc interprets the additional word as an
> input filename:
> 
>   error: multiple input filenames provided ...
> 
> Generate a small wrapper script and pass it to -Clinker e.g.
> 
>   ```
>   #!/bin/sh
>   ccache gcc "$@"
>   ```
> 
> This fix should be general enough to address most if not all cases
> (incl. wrappers or subcommands) and avoids surprises of simpler fixes
> like just defaulting to gcc.
> 
> This avoids passing the user command as an environment variable as
> that would be more challenging to trace and debug shell expansions.
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1224
> Suggested-by: Yoann Congal <yoann.congal@smile.fr>
> Signed-off-by: Mohamad Alsadhan <mo@sdhn.cc>
> ---

Thanks!

Reviewed-by: Nicolas Schier <nsc@kernel.org>
Tested-by: Nicolas Schier <nsc@kernel.org>

Unfortunately, I overlooked the missing entries for 'clean'/'mrproper'
and scripts/.gitignore.  Is it ok for you if I the following diff to
your patch?


diff --git a/Makefile b/Makefile
index a8d8ed711f9b..69fa18565219 100644
--- a/Makefile
+++ b/Makefile
@@ -1676,7 +1676,8 @@ MRPROPER_FILES += include/config include/generated          \
 		  vmlinux-gdb.py \
 		  rpmbuild \
 		  rust/libmacros.so rust/libmacros.dylib \
-		  rust/libpin_init_internal.so rust/libpin_init_internal.dylib
+		  rust/libpin_init_internal.so rust/libpin_init_internal.dylib \
+		  scripts/rustc-wrapper
 
 # clean - Delete most, but leave enough to build external modules
 #
diff --git a/scripts/.gitignore b/scripts/.gitignore
index 4215c2208f7e..b3948b148c4b 100644
--- a/scripts/.gitignore
+++ b/scripts/.gitignore
@@ -6,6 +6,7 @@
 /kallsyms
 /module.lds
 /recordmcount
+/rustc-wrapper
 /rustdoc_test_builder
 /rustdoc_test_gen
 /sign-file


Kind regards,
Nicolas
