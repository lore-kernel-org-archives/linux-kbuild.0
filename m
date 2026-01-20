Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17E33C1FEF;
	Tue, 20 Jan 2026 23:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768950064; cv=none; b=AmZPRAuAXgz6BOIsaK1aT2qrjm/ZrYEt9jlYj6oZ57rPwjFxFn5DoB486xVKXRSyUhTz89MmkS1t8kO1dXFhAlw56dJMY003gQwM1m0YzqsmgxPNHj/twqXi1Pm8j+Zw7OhiKDwXKG8qVX9l2OPtc/ue8E9VUXpLpoXokiyf6D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768950064; c=relaxed/simple;
	bh=dClrHcKLkN3Omg1AAuVft+c2sQj8sX7paCLkftkiBBc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tGaoX3nyo54HwlujCC9Ml3DBhggRmZv9NblJxuqs49PNgyHLuWUWjy5gpDrJvWdEb9N2a2vQmC7ehJHVzkFv3jbTeJbFxu57bi21oIhUx5r4T75ep3z9LVzbJ5VimQnCo7PhoCNRFI2zQAvPdqPMRGIWVaAPnFcRJbmU1fdRxtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=popOrSrT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="popOrSrT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1907BC16AAE;
	Tue, 20 Jan 2026 23:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768950064;
	bh=dClrHcKLkN3Omg1AAuVft+c2sQj8sX7paCLkftkiBBc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=popOrSrTL9zTWJldNDPUB2j/MRzDfzsPuDzrbGZEMz2xV40sXWFd2sKeg2EY4sjqR
	 L0eryVBnxe5jnFEBcFxlvb5PVt1l7BrJxRnIGEPt80GYYVNsJcH639kCJy+hpbwKS8
	 CEGdEWam6jmlu6Ig7XcnTwnroRUvpOEKqzUR9ZHmwRpcUtEKr3lw+DFcTl2X6Ly8hB
	 YpQw6oZ3LmlQ698uP+J1c0w7g96Yt7qi/iEzBfbdCOGX9ZMmZ73NgtEa5HSVcPZATa
	 W3U3abd+19StFhluNNTVpRntJ/48m7uV4OJyrpb29gzWdaPqNl1AecSeVWDo+Lu3pT
	 Wrx/3WLNCpeAQ==
Date: Wed, 21 Jan 2026 00:00:53 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Alex Shi <alexs@kernel.org>, Carlos Bilbao <carlos.bilbao@kernel.org>,
 David Airlie <airlied@gmail.com>, Federico Vaga <federico.vaga@vaga.pv.it>,
 Hu Haowen <2023002089@link.tyut.edu.cn>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier
 <nsc@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter
 <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>, Yanteng Si
 <si.yanteng@linux.dev>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org, Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?=
 <thomas.weissschuh@linutronix.de>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Avadhut Naik <avadhut.naik@amd.com>,
 Chenguang Zhao <zhaochenguang@kylinos.cn>, David Disseldorp
 <ddiss@suse.de>, Dongliang Mu <dzm91@hust.edu.cn>, Gang Yan
 <yangang@kylinos.cn>, Kees Cook <kees@kernel.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Randy Dunlap
 <rdunlap@infradead.org>, Shuah Khan <skhan@linuxfoundation.org>, Steven
 Rostedt <rostedt@goodmis.org>, Tamir Duberstein <tamird@gmail.com>, Vincent
 Mailhol <mailhol@kernel.org>, WangYuli <wanyl5933@chinaunicom.cn>
Subject: Re: [PATCH 0/9] docs: Fix kernel-doc -Werror and moves it to
 tools/docs
Message-ID: <20260121000053.5e274248@foz.lan>
In-Reply-To: <87wm1bhozz.fsf@trenco.lwn.net>
References: <cover.1768823489.git.mchehab+huawei@kernel.org>
	<87wm1bhozz.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Jon,

On Tue, 20 Jan 2026 15:56:48 -0700
Jonathan Corbet <corbet@lwn.net> wrote:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > Hi Jon,
> >
> > After a restful weekend and revisiting both yours and my series,
> > I'm opting to send a patch series merging both into one:
> >
> > - The first 4 patches are from my series (no changes since v5):
> >     https://lore.kernel.org/linux-doc/cover.1768642102.git.mchehab+huawei@kernel.org/T/#m81211c0ff38bbaa82b8b0b6606f242ccc0c2a9ac
> >
> > - It follows by the 2 patches from your renaming series:
> >     https://lore.kernel.org/linux-doc/20260119111745.4694546b@foz.lan/T/#m51099c31a99dccccdb4d17cbaadc818e9e4df8c4
> >
> >   with the fix I proposed for kernel-doc to find its libraries
> >
> > I added 3 patches afterwards:
> >
> >   - patch 5: move possible return values from docstring to helper message;
> >   - patch 6: improve MsgFormatter description;
> >   - patch 7: moves kerneldoc_bin from conf.py to the sphinx/kerneldoc.py
> >     (this is now just a debugging message - no need to pick it from env)
> >
> > IMO, this series is ready to be merged.  
> 
> Patch 7 adds a new warning:
> 
>   WARNING: unknown config value 'kerneldoc_bin' in override, ignoring
> 
> It needs to be taken out of sphinx-build-wrapper; I've appended the
> following patch to the series to deal with it. 

True, thanks for checking it!

> I think I'll go ahead
> and tack on a patch putting in the scripts/kernel-doc symlink, then I
> guess it's ready to go.

Go ahead. Yeah, I think that, with such changes, this series is
ready to go.
> 
> Thanks,
> 
> jon
> 
> From 4a3efd128f7da996b677151790d043ec44a00561 Mon Sep 17 00:00:00 2001
> From: Jonathan Corbet <corbet@lwn.net>
> Date: Tue, 20 Jan 2026 15:50:38 -0700
> Subject: [PATCH] docs: sphinx-build-wrapper: stop setting kerneldoc_bin for
>  Sphinx
> 
> Now that the Sphinx build does not use the kerneldoc_bin configuration
> variable, we shouldn't try to set it in the build wrapper or we get a nifty
> warning:
> 
>   WARNING: unknown config value 'kerneldoc_bin' in override, ignoring
> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> ---
>  tools/docs/sphinx-build-wrapper | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-wrapper
> index cb2a5005e633..9f1ae1485f84 100755
> --- a/tools/docs/sphinx-build-wrapper
> +++ b/tools/docs/sphinx-build-wrapper
> @@ -750,7 +750,6 @@ class SphinxBuilder:
>  
>              build_args = args + [
>                  "-d", doctree_dir,
> -                "-D", f"kerneldoc_bin={kerneldoc}",
>                  "-D", f"version={self.kernelversion}",
>                  "-D", f"release={self.kernelrelease}",
>                  "-D", f"kerneldoc_srctree={self.srctree}",

Thanks,
Mauro
