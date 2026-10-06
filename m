Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752571D54FA;
	Tue,  6 Oct 2026 08:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791274282; cv=none; b=qN/6oMkYBL9VHaUsrPULw0wzK9wQu6hGXeVJxi9rmtVIICtYwAmnl4gI1uiKaJtyLTJLMRD0bIXRpwBcVU9VzvFzxzJ2LxAhzDgNuZubRTyMPS2Oc4eO0Fq+2vFq2sFR8LiUKQ8S9gJl0NFBDpIN1omqlhzTqmtc6Y6eXavnWOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791274282; c=relaxed/simple;
	bh=ymAudHdAiT2usM8bzD+En9ax5jW+AnNTUw7C/PvsE7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ePKhcjhNC/+6wYRpEOTURWpP+Un9MJDT3LNrBc711j98SK2I3QI70VqOmZiIIDic3BoEBX3lvS0a8VrWBua+EYwMPQH2i2+udiHRYwm6T6OFZRMw2W2H/IIkdp9BnOlPN6qHCbZ9tf8mIqd3s9jPa7B/lKeSCYgT8Y76AxWVbO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P3T5jfbZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P3T5jfbZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 127BD1F000FF;
	Tue,  6 Oct 2026 08:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791274281;
	bh=slwXC1hdG5VUEikD62TjJ3zlUcocHL1wSfrBV9dr1Y0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P3T5jfbZYCl/nN9japeFJMHzln7SBz0m5KIQWvzvjQw81BIPzD8Lu4SyDKhY6Iix1
	 /Inj813rMfUzvIKhxyU7hAVuLvWYVUiNoWYdBUG4PkvsjG/iZT9jjO/ERwBJpJYf6Z
	 rsB/CD6qbyS0rcWFcKwZ4PVGgIaIn5J6I7DJNeu3e5yXQYC6d3H90h5GNlTnouLrCs
	 iI9PxsOEp4TM1EFJCGM1M+IPIdVnmTked5hT72as3SFTEKcSD3UbGT22na1sVKOzr0
	 epu2VMMeqwjpwuREsCTiBNrBM1UQVoRAz5RMgCnuwF0m+/tNGNoA3Xyq0+BvlJ3dXc
	 pW9LZKXZ45VlQ==
Date: Tue, 6 Oct 2026 10:11:16 +0200
From: Nathan Chancellor <nathan@kernel.org>
To: Denis Benato <denis.benato@linux.dev>,
	Jim Cromie <jim.cromie@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kbuild@vger.kernel.org, nsc@kernel.org,
	thomas.weissschuh@linutronix.de, chewi@gentoo.org,
	abelvesa@kernel.org, linux-kernel@vger.kernel.org,
	Kees Cook <kees@kernel.org>
Subject: Re: [PATCH] kbuild: install-extmod-build: install
 kernel/kallsyms_internal.h
Message-ID: <20261006081116.GA830598@ax162>
References: <20261005200123.146822-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005200123.146822-1-denis.benato@linux.dev>

Hi Denis,

On Mon, Oct 05, 2026 at 08:01:23PM +0000, Denis Benato wrote:
> The tree staged by install-extmod-build contains no kernel/ files, but
> since commit 4fafd1165b33 ("kallsyms: increase marker density to 16:1
> to accelerate lookups") scripts/kallsyms.c includes
> ../kernel/kallsyms_internal.h.

You did not add either the author or the committer of 4fafd1165b33, I
have done so now. This would need to be handled by them. However...

> install-extmod-build rebuilds the host programs inside the staged tree
> whenever CC differs from HOSTCC (cross builds, or a ccache-wrapped CC).
> scripts/kallsyms is hostprogs-always-y, so that rebuild fails with:
> 
>   scripts/kallsyms.c:39:10: fatal error: '../kernel/kallsyms_internal.h' file not found
>      39 | #include "../kernel/kallsyms_internal.h"
>         |          ^~~~~~~

I would rather not ship an internal kernel header in the external module
build. If these defines are needed to build scripts/kallsyms.c, they
should live in a separate header that is included in
{kernel,scripts}/kallsyms.c that is safe to expose to the external
module build but I defer to the 4fafd1165b33 folks.

> Stage the header so the linux-headers-* and kernel-devel style packages
> can rebuild scripts/kallsyms.
> 
> Fixes: 4fafd1165b33 ("kallsyms: increase marker density to 16:1 to accelerate lookups")
> Assisted-by: ZCode:glm-5.3
> Signed-off-by: Denis Benato <denis.benato@linux.dev>
> ---
>  scripts/package/install-extmod-build | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/scripts/package/install-extmod-build b/scripts/package/install-extmod-build
> index f12e1ffe409eb..aad2cd59a37ba 100755
> --- a/scripts/package/install-extmod-build
> +++ b/scripts/package/install-extmod-build
> @@ -20,6 +20,8 @@ mkdir -p "${destdir}"
>  (
>  	cd "${srctree}"
>  	echo Makefile
> +	# scripts/kallsyms.c includes this header
> +	echo kernel/kallsyms_internal.h
>  	find "arch/${SRCARCH}" -maxdepth 1 -name 'Makefile*'
>  	find "arch/${SRCARCH}" -name generated -prune -o -name include -type d -print
>  	find "arch/${SRCARCH}" -name Kbuild.platforms -o -name Platform
> -- 
> 2.47.3
> 

-- 
Cheers,
Nathan
