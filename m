Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE3D26ED3C;
	Mon, 30 Mar 2026 10:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774864886; cv=none; b=YwbtmS0lQtXikFbaygSbP+oxzcwvXbGbaqMtreJ9HKfUUsbqYbxBS/QPANvKcbNLC/rt+MKLU8TPQ0zm5NVPye8ToOr7Ip+tKxHgn8Pp0XZ57z/94YhkFTVsHPYTy4OQE/YXddXU/Mme7kUDUF1Ki3idX+jiHQSt/EtKnr1L2rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774864886; c=relaxed/simple;
	bh=oWAZhWutoIplcfPHT8Pvfyhm6Nt6jt60jMo4pxen+Zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UYsdOkFk30qJWPudy0FBBMTQYvK9jrTXyZsEX4T/yIUYy/IsRqRDu+/XavPzcnP9/jNgqf9FJ09h5RAFIvb/bQEpcDFvDwA/gzjw4kvdM29G7aX8jDxgi4x6KDVs+FDYcEGlT/pJeJ4xe1NrHtVtYjFhf4f/66/h81gvEabeZis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BlDy8aMW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BlDy8aMW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D047C2BC9E;
	Mon, 30 Mar 2026 10:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774864885;
	bh=oWAZhWutoIplcfPHT8Pvfyhm6Nt6jt60jMo4pxen+Zw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BlDy8aMWJGYmu2Nr+YzVbLSJg4J/6LPUkX01dOkU2W5J0aswGKDLCAQ2P3eqZdgPu
	 AccNVeqRVOvQdnBKwENb4mT9nJKV4rCwZ3TJlC+1COuGywgMxEA0ML2YeQXCr3CFxI
	 Bfy/0jgOg0rk1xUDziN+EfjMsZrKM1/Fx6/FqeWXjr9Xo8Y7Ig8bExSUmU0ztsYKjv
	 DlYE2DwPXA4F8Wd4t8S41vr/eWtwr0g3MBfB+a4uEA13HPagvvJT8Ipa+vvZ3p+pgx
	 ijvgvInAi+ezGAJne7/iIauJPT2Avq006BWzi6AGMZ4/UxwoDafvlfMvtoh9r81G/P
	 z5u8kSSD6NrpA==
Date: Mon, 30 Mar 2026 12:01:19 +0200
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>, Rong Xu <xur@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alice Ryhl <aliceryhl@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Rafael Aquini <aquini@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Stafford Horne <shorne@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Piotr Gorski <piotrgorski@cachyos.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Teresa Johnson <tejohnson@google.com>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v7 3/3] kbuild: distributed build support for Clang
 ThinLTO
Message-ID: <20260330100119.GA1953970@ax162>
References: <20260328011927.3569802-1-xur@google.com>
 <20260328011927.3569802-4-xur@google.com>
 <acmF7nvIh2nX5hjK@levanger>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acmF7nvIh2nX5hjK@levanger>

On Sun, Mar 29, 2026 at 10:05:02PM +0200, Nicolas Schier wrote:
> On Sat, Mar 28, 2026 at 01:19:27AM +0000, xur@google.com wrote:
> > diff --git a/Makefile b/Makefile
> > index 69ccf9b8507d..d474b6f0f212 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1047,11 +1047,11 @@ export CC_FLAGS_SCS
> >  endif
> >  
> >  ifdef CONFIG_LTO_CLANG
> > -ifdef CONFIG_LTO_CLANG_THIN
> > +ifdef CONFIG_LTO_CLANG_FULL
> > +CC_FLAGS_LTO	:= -flto
> > +else
> >  CC_FLAGS_LTO	:= -flto=thin -fsplit-lto-unit
> >  KBUILD_LDFLAGS += $(call ld-option,--lto-whole-program-visibility -mllvm -always-rename-promoted-locals=false)
> > -else
> > -CC_FLAGS_LTO	:= -flto
> >  endif
> >  CC_FLAGS_LTO	+= -fvisibility=hidden
> >  
> 
> This hunk is just reordering but does not change any functionality,
> right?

It does, as CONFIG_LTO_CLANG_THIN and CONFIG_LTO_CLANG_THIN_DIST are two
distinct options. That said, this hunk still does not look right based
on Yonghong's comment?

  https://lore.kernel.org/044bebc0-d996-4be3-9330-a64195c19a84@linux.dev/

Rong, have you tested this with a recent version of LLVM? Or has support
for this flag been added to the distributed mode since Yonghong's
comment?

> Nathan, Piotr: your tags got dropped from v6 to v7.  Do you want to
> renew them?

Yes, once the above is sorted out.

Cheers,
Nathan
