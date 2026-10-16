Received: from mail.avm.de (mail.avm.de [212.42.244.119])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7AA4C8C48;
	Fri, 16 Oct 2026 13:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158529; cv=none; b=R/TelbzK2zkUt5nfd9pgyokpOI7pQbwdi955sQJRBklMfU00fqgZHpxBlKyvW6Y871ZQ1fCtOpdzBiGpGzlwaYBEG4OpaTWMElQH9D0SkPuD/OeZK+Lj3GoHZa6IX82fEmG/+Z/vgghoTyYbuU1KheXeCVLexQ2NyyuJaun3Zqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158529; c=relaxed/simple;
	bh=zlQWcttho1vyPbsQg0Xn2LU8NAcWx23gixdtx0PGqHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gHn775xdSpKgJXzbK04kCdxZpUaFhL+HiFm4sKdwfK8riNC7SkNekiPNARfxrnunfmKaRmR39GsAcNDKY7YQGtDUPROErDOrhTiPI5yXuWLShDRsRUfZNG5sj6v/k/jKMC9OQ/LchY+ZuIWzhykTfHdcZHZvsl5OBKbiPTZ7fPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b=FfWVDKYA; arc=none smtp.client-ip=212.42.244.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b="FfWVDKYA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1792158167; bh=zlQWcttho1vyPbsQg0Xn2LU8NAcWx23gixdtx0PGqHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FfWVDKYAiOIYpMdsxizgJ8SripUI215Sy5onHIqmI32OzRHKt/Q0Z4y7qZcFEoDcy
	 usNqeelRXIwcsAy+AU0OKgqQEU8eiszqresIFhFFHUCVkl9+ho6u5CxmuNTJ17TCmJ
	 wTE1z2EFcSHLJOl5tdTt8APo3I7+RBUw4jiwEdA/sr8E7dr+W+8DcwagYjU1o+nOMl
	 QOScddDUQyl2mBtV+TCj+bOU9V2AUdSHn8a/0Pci1Z6hv+lLPqelIGW7J3JxeAfPwl
	 0xDmSBvN33ZNR8bnG++Bz0449Xux1s8oHr8LInwL8yqyDehH0QiDC+DFnJpgN354EH
	 ZQb0pl92Eg9AA==
Received: from [2001:bf0:244:244::78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6ad229d7-c83a-7f0000032729-7f000001ea90-1
	for <multiple-recipients>; Fri, 16 Oct 2026 15:42:47 +0200
Received: from mail-auth.fritz.com (unknown [IPv6:2001:bf0:244:244::78])
	by mail.avm.de (Postfix) with ESMTPS;
	Fri, 16 Oct 2026 15:42:47 +0200 (CEST)
Date: Fri, 16 Oct 2026 15:42:46 +0200
From: Nicolas Schier <n.schier@fritz.com>
To: Van Vo <vngocvan@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, ndesaulniers@google.com,
	morbo@google.com, justinstitt@google.com, masahiroy@kernel.org,
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gen_compile_commands: honor the build directory for
 modules
Message-ID: <20261016-fast-lyrical-frigatebird-dcd303@l-nschier-aarch64>
References: <20261015135752.17028-1-vngocvan@gmail.com>
 <20261016012148.GD3329673@ax162>
 <CAJavoFk+zgySyNps5tuKmntmvuAyev=kKL640TFrfCc-njeWBw@mail.gmail.com>
 <CAJavoFkpO29P_oD_YLBkkp6_k080mN-ctRPXSvB+oj_-vpcR0w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJavoFkpO29P_oD_YLBkkp6_k080mN-ctRPXSvB+oj_-vpcR0w@mail.gmail.com>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1792158167-3CFFB515-A91D54D9/0/0
X-purgate-type: clean
X-purgate-size: 3158
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-02  mail-id: 52EEDA03FD  external: no

On Fri, Oct 16, 2026 at 01:25:33PM +0700, Van Vo wrote:
> Hi Nathan,
> 
> > How was this discovered?
> 
> This came from code inspection of standalone use of -d with an explicit
> modules.order argument, followed initially by a constructed reproducer.
> It was not a failure encountered through Kbuild's compile_commands.json
> target.
> 
> I have now reproduced it using real Kbuild-generated artifacts from
> 0fcb05b72344f40806cbe810de8872f1698bf053 on Linux/aarch64, with Python
> 3.11.13 and GCC 12.2.0. This was a partial lib/ build with CONFIG_TEST_LKM=m.
> 
> The following uses a disposable source tree at that base. The guards
> prevent overwriting an existing output directory or result file:
> 
>     (
>         set -eu
>         test ! -e out
>         test ! -e outside.json
>         test ! -e inside.json
>         make O=out -j1 allnoconfig
>         bash scripts/config --file out/.config --enable MODULES \
>             --enable RUNTIME_TESTING_MENU --module TEST_LKM
>         make O=out -j1 olddefconfig
>         make O=out -j1 V=1 lib/
> 
>         outside_exit=0
>         python3 -B scripts/clang-tools/gen_compile_commands.py -a ar \
>             -d out -o outside.json out/lib/modules.order ||
>             outside_exit=$?
>         printf 'outside_exit=%s\n' "$outside_exit"
> 
>         inside_exit=0
>         (cd out &&
>          python3 -B ../scripts/clang-tools/gen_compile_commands.py -a ar \
>              -o ../inside.json lib/modules.order) ||
>             inside_exit=$?
>         printf 'inside_exit=%s\n' "$inside_exit"
>         test "$outside_exit" -eq 1
>         test "$inside_exit" -eq 0
>         python3 -c \
>             'import json; assert len(json.load(open("inside.json"))) == 1'
>     )
> 
> Kbuild generated lib/test_module.o, lib/test_module.mod,
> lib/.test_module.o.cmd and lib/modules.order under out/. Both .mod and
> modules.order contain lib/test_module.o.
> 
> The old script's invocation from the source directory fails with:
> 
>     FileNotFoundError: [Errno 2] No such file or directory:
> 'lib/test_module.mod'
>     outside_exit=1
> 
> The same artifacts work when the old script is invoked from out/:
> 
>     inside_exit=0
> 
> The successful invocation produces one JSON entry for lib/test_module.c.
> The patched script succeeds from the source directory and produces an
> identical entry. The old script also fails with absolute paths for -d
> and modules.order; the patched script succeeds with those paths too.
> 
> Only the standalone generator invocation is outside the build directory;
> compilation itself runs under out/. This is not a full kernel build or
> a boot/runtime test.

Thanks for the detailed reproducer.

Quoting from Nathan:
| How was this discovered? This cannot happen within Kbuild because this
| script is always invoked from within the build folder, so was it a
| manual invocation or something else?

So, if I get youre reply correctly, the issue this was not discovered 
"in the wild" but can only be reproduced by manual use of 
gen_compile_commands.py.

-- 
Nicolas
