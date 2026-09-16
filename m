Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDAC48BD5B;
	Wed, 16 Sep 2026 22:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789597464; cv=none; b=tLXTd43SkYXqe29S/azjod4/e0Yl7/eBUpQosIpeKb6ZnbQjWMkU9mdYbf0HT6DzchinvhNDXqJDK2Af4SNj5sNNt2TymA18ABKwU4LxFjcur/9nqzP/K5QS02YsSajOQ/0P/SNcj2tNMeQsvkrmtKsWmTEFhGnU6w3J++ByVr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789597464; c=relaxed/simple;
	bh=QXdQHNb1TukjMgCPdvAcejVlJtM4M3QphZ/sjJ7AhrM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LE8AUufO1g48g1jY3I8ByoFBMuac5mP5VIaLg0PZkA68hy+u2F5zmNIfec9n/C4om6GmTjta6r+clq4BlGOwy4/9pJVIzpjc7OOH8sNPIJVR3zAHz4QN1XTSGPvloZ473IBPKt/pTEVQz9OocmmKAiTOgcDTr5gARXlvsmPDXpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ZlwfIkQB; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ZlwfIkQB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=1NGrDf2rk+nOG1UnigdB8hAXztoK/GtPlDhkg8GS5n8=; b=ZlwfIkQBQQ5/Z89HM749uKCDpV
	H32bmK0XPU84WZ59DFsvyIo1sLpM0NGPmAm7dnPXsg6QaRx1/yXfGQYm9QA+KvfCXrr4RKSRr+MQQ
	0IKCoDt0flYXuPXu6GlWwznolsyVJD33OZtBLz6TmV2JUPC6QjwbbntjdtpEkK05xPAUFjovMXl7a
	ciQH9L1+wxx/ElUWthi343fKmDRwvkCUbQTfz9RSbm1GUJ7RWeC8W7mZHD2IZ88QJD7WD/MnQdHHP
	tnN2ZQ+b3h+CNw/aoY6567LmR1rm2fVz4StngvQzSPAFWMTPOOph+gfR1yIoGf/o398lVdrSI1flf
	qQSWbMuA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6y30-0000000ACNT-1V9S;
	Wed, 16 Sep 2026 22:24:10 +0000
Message-ID: <211fcac1-d85d-4680-8e55-598b2064a002@infradead.org>
Date: Wed, 16 Sep 2026 15:24:09 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kbuild: add header check facility as a manually run
 static analyzer
To: Jani Nikula <jani.nikula@intel.com>, linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Masahiro Yamada <masahiroy@kernel.org>,
 linux-kbuild@vger.kernel.org
References: <20260915104331.255636-1-jani.nikula@intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260915104331.255636-1-jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jani,

On 9/15/26 3:43 AM, Jani Nikula wrote:
> There have been various attempts at adding a header test or check
> mechanism in the kernel build system. The header check primarily
> consists of ensuring headers are self-contained, have include guards,
> and, in some cases, pass kernel-doc.
> 
> The main problems have been:
> 
> - The dependency tracking creates undesirable artefacts (infamously also
>   known as disgusting turds) in the build directory.
> 
> - Gating the feature behind a kconfig option is complicated due to
>   allyesconfig builds. It's possible, but requires a verbose and
>   confusing negative proxy config option.
> 
> - Naming the dependency tracking files with a dot prefix or placing them
>   in a dot prefixed subdirectory in the build directory to hide them has
>   been exceedingly difficult to achieve. (In part due to some Makefiles
>   building files in subdirectory hierarchies.)
> 
> - The debate which headers, if any, should really be self-contained is
>   virtually open-ended.

I would expect that headers in include/uapi/*.h should be self-contained,
but apparently that's just a pipe dream on my part, or maybe it's just
a maintainer option.


With 'make HEADER_CHECK="include/uapi/" headercheck'
I see over 70 errors (mostly typedefs or defined constants, but not only
those), such as:

In file included from <command-line>:
./../include/uapi/linux/hdlc/ioctl.h:74:21: error: ‘IFNAMSIZ’ undeclared here (not in a function)
   74 |         char master[IFNAMSIZ];  /* Name of master FRAD device */
      |                     ^~~~~~~~
In file included from <command-line>:
./../include/uapi/linux/input.h:29:6: warning: ‘__BITS_PER_LONG’ is not defined, evaluates to ‘0’ [-Wundef]
   29 | #if (__BITS_PER_LONG != 32 || !defined(__USE_TIME_BITS64)) && !defined(__KERNEL__)
      |      ^~~~~~~~~~~~~~~
./../include/uapi/linux/input.h:34:9: error: unknown type name ‘__kernel_ulong_t’
   34 |         __kernel_ulong_t __sec;
      |         ^~~~~~~~~~~~~~~~
In file included from ./../include/uapi/linux/papr_pdsm.h:14,
                 from <command-line>:
../include/linux/ndctl.h:19:33: error: ‘PAGE_SIZE’ undeclared here (not in a function)
   19 |         ND_MIN_NAMESPACE_SIZE = PAGE_SIZE,
      |                                 ^~~~~~~~~
In file included from <command-line>:
./../include/uapi/linux/patchkey.h:15:2: error: #error "patchkey.h included directly"
   15 | #error "patchkey.h included directly"
      |  ^~~~~
In file included from <command-line>:
include/uapi/xen/gntdev.h:159:25: error: unknown type name ‘grant_ref_t’
  159 |                         grant_ref_t ref;
      |                         ^~~~~~~~~~~
include/uapi/xen/gntdev.h:161:25: error: unknown type name ‘domid_t’
  161 |                         domid_t domid;
      |                         ^~~~~~~



I like it; I think it's useful.

Tested-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>

> Approach the problem from a slightly different angle. Add a top level
> "headercheck" static analysis target which you have to explicitly run,
> and where you have to explicitly state which headers to check:
> 
> $ make HEADER_CHECK="(headers|dirs)" headercheck
> 
> For example:
> 
> $ make HEADER_CHECK="include/drm drivers/gpu/drm/drm_draw_internal.h" headercheck
> 
> You can specify multiple path/to/header.h or path/to/dir, relative to
> $(srctree), where path/to/dir is recursively scanned for any .h files.
> 
> Add a generic %.header-check rule in scripts/Makefile.build to support
> this. Note that this rule should *not* be used in, say, driver or
> subsystem makefile targets, precisely because of the problems listed
> above.
> 
> While this still generates the .header-check dependency tracking
> artefacts in the build directory, you will only get them as a result of
> manually running 'make headercheck', not as part of the regular build.
> 
> This approach also allows anyone to check any headers in the tree, with
> no makefile modification or kconfig changes required. What you do with
> the results is up to you, and the header check facility does not enforce
> anything like it would as part of the regular build.
> 
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nicolas Schier <nsc@kernel.org>
> Cc: Jason Gunthorpe <jgg@nvidia.com>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: linux-kbuild@vger.kernel.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  .gitignore             |  1 +
>  Makefile               | 25 ++++++++++++++++++++++++-
>  scripts/Makefile.build | 21 +++++++++++++++++++++
>  3 files changed, 46 insertions(+), 1 deletion(-)


thanks.
-- 
~Randy
