Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3661349B09;
	Thu, 12 Mar 2026 08:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773303323; cv=none; b=G4aZr0fd8L2S9lLasXTN+FfmrENA6VYv4I7v4URl8vgv1QA2qFQYz+rm1VrPtxwWNVvSW2QOlxP7ildsM5z8T4ZtIbfy+k7p51qlr61zNA787+aIcF5VDHs/noO98SsAKlOoPSg73TcyIDRQUCUnbrK8A8tYa3dvt5yUD0nlRuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773303323; c=relaxed/simple;
	bh=fbfiYqNbsI7umyqTv1r4VNqV1QlFsyQ8fkCiaBcMszE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=flJgNA159YzGeztRRsdR/y4u2Yu0g7aXh75ZFwVEXfhzfilSHimj28tFUSrYqT2ZG2k1/3OeLDDGLSj/+RHNXnK4uYQkEEpJdEc28VN8PodW7pfBwChrlApXBOFCj+XvxcYFVQfPqaoAprFN9ykRMguJEO2k+kbmY8/VHLX9v7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gBO7oNq2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gBO7oNq2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ABECC4CEF7;
	Thu, 12 Mar 2026 08:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773303322;
	bh=fbfiYqNbsI7umyqTv1r4VNqV1QlFsyQ8fkCiaBcMszE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gBO7oNq2hH71J7R//82u6ArGbgBl8wiqfzzzo8OrLjwt4ZHZAWj24Co7gWNPTahJ3
	 PgLwcDzvM+1VKuZv5PgvxtU6VVOOaQ0k7L/7tohUi1kBVFMXjmvh4ayEjatLGbI9wK
	 xoaZLGGD7CK+xwCgvAzlKa5dtnFODw4TGThet4t8OqCU5U9w6/HtKjRvaxWb/ezMpo
	 kZUiog9POJTWEt4B38LxL3K4u6qut3/A8FB/c9erpr1THp+ecm4zrfBeu0c0OXJpJz
	 zOg+P6D1+1SxysYnkdYXoHTm+b89JDJCq2rgM1CU54ZxO4Y8z7pVD5Sf8ltE4sgDoJ
	 MPspmaApv6S6g==
Date: Thu, 12 Mar 2026 01:15:18 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	David Howells <dhowells@redhat.com>
Subject: Re: [PATCH RFC 5/5] kbuild: uapi: also test UAPI headers against C++
 compilers
Message-ID: <20260312081518.GA3161678@ax162>
References: <20260308-kbuild-uapi-c-v1-0-86aae09a7f1d@weissschuh.net>
 <20260308-kbuild-uapi-c-v1-5-86aae09a7f1d@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260308-kbuild-uapi-c-v1-5-86aae09a7f1d@weissschuh.net>

On Sun, Mar 08, 2026 at 10:24:05PM +0100, Thomas Weiﬂschuh wrote:
> C++ language requirements differ from those of C.
> 
> Also test the headers against C++ compilers to make sure no errors
> creep in accidentally.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> ---
>  usr/include/Makefile | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/usr/include/Makefile b/usr/include/Makefile
> index edeaf9d778c4..0e23aeace410 100644
> --- a/usr/include/Makefile
> +++ b/usr/include/Makefile
> @@ -10,6 +10,7 @@ UAPI_CFLAGS := -std=c90 -Werror=implicit-function-declaration
>  UAPI_ARCH := $(or $(HEADER_ARCH),$(SRCARCH))
>  
>  override c_flags = $(KBUILD_USERCFLAGS) $(UAPI_CFLAGS) -Wp,-MMD,$(depfile)
> +cxx_flags = $(filter-out -Wmissing-prototypes -Wstrict-prototypes -std=%, $(KBUILD_USERCFLAGS)) -std=c++98
>  
>  # The following are excluded for now because they fail to build.
>  #
> @@ -61,6 +62,27 @@ endif
>  # asm-generic/*.h is used by asm/*.h, and should not be included directly
>  no-header-test += asm-generic/%
>  
> +# The following are not compatible with C++.
> +#
> +# Do not add a new header to the list without legitimate reason.
> +# Please consider to fix the header first.
> +#
> +# Sorted alphabetically.
> +no-header-test-cxx += linux/auto_dev-ioctl.h
> +no-header-test-cxx += linux/map_to_14segment.h
> +no-header-test-cxx += linux/map_to_7segment.h
> +no-header-test-cxx += linux/netfilter/xt_sctp.h
> +no-header-test-cxx += linux/target_core_user.h
> +no-header-test-cxx += linux/vhost.h
> +no-header-test-cxx += linux/vhost_types.h
> +no-header-test-cxx += linux/virtio_net.h
> +no-header-test-cxx += linux/virtio_ring.h
> +no-header-test-cxx += scsi/fc/fc_els.h
> +
> +ifeq ($(UAPI_ARCH),x86)
> +no-header-test-cxx += asm/elf.h
> +endif
> +
>  # The following are using libc header and types.
>  #
>  # Do not add a new header to the list without legitimate reason.
> @@ -138,8 +160,12 @@ endif
>  
>  always-y := $(patsubst $(obj)/%.h,%.hdrtest, $(shell find $(obj) -name '*.h' 2>/dev/null))
>  
> +# $(cc-option) forces '-x c' which breaks '-x c++' detection.
> +cc-can-compile-cxx := $(call try-run,$(CC) -c -x c++ /dev/null -o "$$TMP", 1)

Include $(CLANG_FLAGS) here just in case clang cannot generate code for
the host target (I know, sounds weird, but I have seen people build
LLVM only targeting arm/arm64 with an x86_64 host...).

> +
>  target-libc = $(filter $(uses-libc), $*.h)
>  target-can-compile = $(filter-out $(no-header-test), $*.h)
> +target-can-compile-cxx = $(and $(cc-can-compile-cxx), $(target-can-compile), $(filter-out $(no-header-test-cxx), $*.h))
>  
>  hdrtest-flags = -fsyntax-only -Werror \
>  		-nostdinc -I $(obj) $(if $(target-libc), -I $(srctree)/usr/dummy-include)
> @@ -149,6 +175,8 @@ quiet_cmd_hdrtest = HDRTEST $<
>        cmd_hdrtest = \
>  		$(CC) $(c_flags) $(hdrtest-flags) -x c /dev/null \
>  			$(if $(target-can-compile), -include $< -include $<); \
> +		$(if $(target-can-compile-cxx), \
> +			$(CC) $(cxx_flags) $(hdrtest-flags) -x c++ /dev/null -include $<;) \
>  		$(PERL) $(src)/headers_check.pl $(obj) $<; \
>  		touch $@
>  
> 
> -- 
> 2.53.0
> 
