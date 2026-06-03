Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F63A37FF58;
	Wed,  3 Jun 2026 01:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780451128; cv=none; b=cMPKaQ9kKt8aOWRlQEG1pxLxrbDFzQZcy6C6hJ6HxpJIiYIHtVXCkDKaLEtpm/n/40yZu3IvFErpQoa6mm+CgEw6r2t3TfDq/ZaYx7IFUGa2hNgR9qD3AFMz7V5IzOlLs2glzp4TQjv1Nn0ykGkZFQSlCuFGIzzbNiHu/gGpGcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780451128; c=relaxed/simple;
	bh=o2pEgWL8ErSo80JaLZ19GTO1yu/9Wz6Esfs/iUTJ5uw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PWgWUOwK/usqF2g36D9uGyFbugvx3tVwP8/3WidqIZadNF8bvoB9Oy7jiqJQ3RSgEBLO1m8WSUdCnmkWTxLXag1TCikPW82dUxqxrF48Gsyes1zM/2CIfdnmDE4QDXUhCR67IZKEVUyVCZ33W1I1kzWHpyAgpc1iaCy4hJBX/l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eSKXrD00; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eSKXrD00"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE0A31F00898;
	Wed,  3 Jun 2026 01:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780451127;
	bh=2vV1i75kDb0Ju7Ri1Wtzoop1KZcCIXZsmzTsVwJ549s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eSKXrD00aOnJYmrclr28/LaEbZ+NIdjn/UuauW/TUcO4Y0V3XjsWeDVCSVo352JLU
	 vv2BRRb3elQLsd3GTsQ97gOVSRAdQGIkN4uzgvCf3/jMBPuXJiqqNviI8biXIJijwt
	 rF4rtHpcxGn3dlq0X9k9+7q5AcwQhSPl80szHJo1G2qwDEiwoyDxrLuOdgLAp0Iuh/
	 qA+o/vsQzJcHh98/Zpnh/gE1APuDB3xNMijqWX1rKMim4CU7K3C/Lz7ljXBoftKR76
	 ak3Od430znod7aBOYTat02+qJPZiw6ZTwiqrUFixuTH26hjMJFwDxIF6nlV2zGKClv
	 uCnWw/enM+Umg==
Date: Tue, 2 Jun 2026 18:45:20 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Rong Xu <xur@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Yonghong Song <yonghong.song@linux.dev>,
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
Subject: Re: [PATCH v12 2/3] kbuild: change --thin back to 'T' in $(AR)
Message-ID: <20260603014520.GC1940387@ax162>
References: <20260529185347.2418373-1-xur@google.com>
 <20260529185347.2418373-3-xur@google.com>
 <ah6DleoCYipTwcO_@levanger>
 <CAF1bQ=Q+KN+p8RmmVDF3bP=11EWj=8fOPBg7wa7QQRW1XWF4iw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF1bQ=Q+KN+p8RmmVDF3bP=11EWj=8fOPBg7wa7QQRW1XWF4iw@mail.gmail.com>

On Tue, Jun 02, 2026 at 09:51:27AM -0700, Rong Xu wrote:
> Thanks Nicolas for the review!
> 
> It looks like Nathan already merged the patch series and squashed this
> specific patch into the previous one, which
> removed the commit message and that comment. These changes actually
> incorporate your review feedback.

Actually, I think the comment removal is still relevant. I plan to queue
up the following patch.

From a48bd961fb203a7ce68f8110fc53a85f90e24b33 Mon Sep 17 00:00:00 2001
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 2 Jun 2026 18:41:50 -0700
Subject: [PATCH] kbuild: Remove unnecessary 'T' modifier in
 cmd_ar_builtin_fixup

In cmd_ar_builtin_fixup, the 'T' modifier was added to '$(AR) mPi' to
work around a bug in llvm-ar that caused thin archives to be silently
converted to full archives [1]. Since commit 20c098928356 ("kbuild: Bump
minimum version of LLVM for building the kernel to 15.0.0"), all
supported versions of llvm-ar have this issue fixed, so the 'T' modifier
and comment can be removed.

Link: https://github.com/llvm/llvm-project/commit/d17c54d17de22d2961a04163f3dbc8e973de89b8 [1]
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 scripts/Makefile.vmlinux_a | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/Makefile.vmlinux_a b/scripts/Makefile.vmlinux_a
index bd141b893748..395e29998d7d 100644
--- a/scripts/Makefile.vmlinux_a
+++ b/scripts/Makefile.vmlinux_a
@@ -10,12 +10,11 @@ include $(srctree)/scripts/Makefile.lib
 # Link of built-in-fixup.a
 # ---------------------------------------------------------------------------
 
-# '$(AR) mPi' needs 'T' to workaround the bug of llvm-ar <= 14
 quiet_cmd_ar_builtin_fixup = AR      $@
       cmd_ar_builtin_fixup = \
 	rm -f $@; \
 	$(AR) cDPrST $@ $(KBUILD_VMLINUX_OBJS); \
-	$(AR) mPiT $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F -f $(srctree)/scripts/head-object-list.txt)
+	$(AR) mPi $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F -f $(srctree)/scripts/head-object-list.txt)
 
 targets += built-in-fixup.a
 built-in-fixup.a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt FORCE
-- 
2.54.0

-- 
Cheers,
Nathan
