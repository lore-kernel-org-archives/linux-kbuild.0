Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793775672;
	b=xvn9bq+dWaJkwNSCT0ub8bx3zBPoWnxqwesk1wg01X9tmkyBS+X2ld1+WXEByuYAJjK8
	 3v3FSpqFrhyYLdeYv3fJwuRBd4U+Nxe2PqyjhhJ4NB6OkjoTDIqoEc0XC26JJXKJsxAs9
	 UEO9iRLc4NNsbSk7HmNmI1oxzL592NrA9Vn/2/PMx2CXBynuOHv5+2eJe5IadV/qBZgzL
	 iCdn2M9gYbMoc2Mbwv6PSL+I/P9HQXLqpeS8hNDY4ZAo30LmH39Diix+aGcP0EL9lghR3
	 Zm6QRGqfKLQa7C1U5EMUF9qKP8Rt4YIIW9jfzbQWw6TfbMIogh9SxB3gfV9Jg3cK7bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793775672;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=9PqgmI4vaK8PTHFVjw6T1+vHdmZTRz/ClS5Af2kY2fc=;
	b=RtZxxDsQ21iODkB+p4KWZ8MbuwTqXQ521/l57bJ4K0xv7NbQgsI1IfoDa2wWkMbkF7y/
	 oAYZ7S0Fw4WmY2GR00B7GawS8XISGGi0t1KezCVq7h4DLPGhqpgMYbhPiVdvtCbaEtWyz
	 OVdJnTQoO7KFuZ7GCGEPK4RWpxbGih2fQ21h9sx9NNkiuNomrN6Yl2bycdO3CY+Hn0nPK
	 c9hlF547GLypoA32MYPhBFpO9Gl/56k8coNuCjhtxYxS8QCNHbLQAN1RpCzHdoiWowBID
	 UVMtT4swwdd3tcVy4gBVgTKQUB/n8qhU9PAvzOy7Ll4/uk8XlKgQf4DrNnCPUAZX8RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LFNd9q63;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D30606A31B;
	Wed,  4 Nov 2026 07:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LFNd9q63
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F8A41F000C1;
	Wed,  4 Nov 2026 07:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793775671;
	bh=9PqgmI4vaK8PTHFVjw6T1+vHdmZTRz/ClS5Af2kY2fc=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=LFNd9q63porHJyx3XjZqUV5gO10lQHx3w9rD1Rn4q5B3e9qansqF6k82JA6+8US4x
	 E0qe9ulqVjHMKLNVyJWLNH8isFiHTnSp6RZQ6n5UAu2decl2StV+urh328N0/rN2w5
	 4atcO3w5rzuzI17FkUFmIjOz2tLfvDnYpESoR7Gtq2RvXZ/DnGW9dVkwcOT3pWuTr9
	 D9m4e3aXXDaWUQaXSM2rSN5KprJ4zQMntm9F3AoXRUrNacvrz7hoAnEGKe5Tf1qxEn
	 Jqs/7poIdQnJOsp+idMVkRLDlgG7jGATSvLPBEJlvVDcYRTWRUcDbN+zRPrY6oJzvG
	 zzF5z76UlCJDA==
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] kbuild: prevent building single targets twice
From: Nicolas Schier <nsc@kernel.org>
To: Mathias Krause <minipli@grsecurity.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260923123936.2227924-1-minipli@grsecurity.net>
References: <20260923123936.2227924-1-minipli@grsecurity.net>
Date: Wed, 04 Nov 2026 07:56:17 +0100
Message-Id: <179377537785.66367.14877215103677858550.b4-review@b4>
X-Mailer: b4 0.17-dev-fde28
X-Developer-Signature: v=1; a=openpgp-sha256; l=2801; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=vgypLRblLZ7jhKE5P9rWjzikOl2ck8JFlM6tCeVbDO0=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBq6tcTH79tlceo4HhSjKaOYGMrAbsajm9DNADu1
 chiLKqIrleJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCaurXEwAKCRAHUgpwFiYS
 aebEEADCfs9XpdlevapJ6ibzel8J0qeIGyPYPDVqndKl9MCGpObBvjlMx/mcWteQywQovh/WDn/
 0QljDUaK/BYepgJV+WEZFHnWznu3y5URM5rYHoqMuHUWGCS8PwWx3/HSTmJt4Z6evoFzu+clK7N
 cvQ7hsoQikdXc65+f4bUT/PDSMAuFoMD2b3j4HM9ATqFU9Ewk+chaxz6wHcIq1cDoRasYJKUvNi
 qE/iC87mWOWwnbdgqvygjuViLWwuMGodkA5UGMKEyBO+Ql9vNIftI5HGcOCSu/S6nc59+7xsys7
 x4PGkbipxcpWK72opG41vyeG+/MUmQr+XLiZZLnv86yVzzuUdd+VaxBqdfuiSdxNuJnUknO3R+6
 b4hZk3BW7LVn4IhpmBccwWVCBsqFea7uW7yfJxGRCBGfXrI0gHBLbbvA7uPBmwSETLP3sVuiB9T
 fmNH907E3pBdXWmZ3eJPwPcZTY1vQSdwn7/fdJErjcmijsGVPVGKyT+sCztDG3tDsAvmc5qJcEz
 HSPUv/UFnuI2t19WyKRWq3rQa47JLAzL0+PejebnEENLeEDepxYyvE4rnYYc9bBzP985KvSNyzh
 g3eoXEvdjlQnsVVduZF82p6qPxzWzZNUAkrNbQTFNLk8Q9SXosDzNfMbTWiktxI+yPa+xlmV+49
 /9QjxU9znjeg8qQ==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

> When building individual targets via 'make path/to/target.o', target.o
> may be build multiple times concurrently, leading to build errors like
> below:
> 
> $ make O=~/O/vanilla-7.1/ -j$(nproc) arch/x86/pci/intel_mid.o
> make[1]: Entering directory '/scratch/minipli/obj/vanilla-7.1'
>   DESCEND objtool
>   DESCEND bpf/resolve_btfids
>   CC      arch/x86/pci/intel_mid.o
>   CC      arch/x86/pci/intel_mid.o
> fixdep: error opening file: arch/x86/pci/.intel_mid.o.d: No such file or directory
> make[4]: *** [/scratch/minipli/src/linux/scripts/Makefile.build:290: arch/x86/pci/intel_mid.o] Error 2
> make[4]: *** Deleting file 'arch/x86/pci/intel_mid.o'
> make[3]: *** [/scratch/minipli/src/linux/scripts/Makefile.build:551: arch/x86] Error 2
> make[3]: *** Waiting for unfinished jobs....
> make[2]: *** [/scratch/minipli/src/linux/Makefile:2229: .] Error 2
> make[1]: *** [/scratch/minipli/src/linux/Makefile:248: __sub-make] Error 2
> make[1]: Leaving directory '/scratch/minipli/obj/vanilla-7.1'
> make: *** [Makefile:248: __sub-make] Error 2
> 
> Please note that arch/x86/pci/intel_mid.o gets output twice and, in
> fact, tried to get built twice, causing the two parallel builds to
> interfere with each other.
> 
> The reason for the double build attempt is that the target can be
> reached twice, via arch/x86/'s Makefile and via arch/x86/pci/'s which
> both end up in '$(single-subdirs)' as both fit the prefix match.
> 
> Only the latter should be used as it contains a cflags override for
> CONFIG_PCI_DEBUG=y which would be skipped when using arch/x86/Makefile
> to build arch/x86/pci/intel_mid.o.
> 
> Fix the multi-match issue by using only the deepest match instead of all
> possible ones, which requires two changes:
> 1. Limiting 'single-subdirs' to a single match per target and
> 2. filtering out deeper targets in the recursive make invocation.
> 
> Also de-duplicate the list of target subdirectories to simplify the
> use of '$(single-subdirs)' in filter expressions for multiple targets in
> the same directory.
> 
> Fixes: cc306abd19e8 ("kbuild: fix and refactor single target build")
> Assisted-by: LLM
> Signed-off-by: Mathias Krause <minipli@grsecurity.net>
> ---
> I ran into this quite a few times in the past and only now gave the LLM
> a try to dig into it. The bug only affects certain targets and only when
> mentioned on the command line, so regular 'make -j$(nproc)' isn't
> affected.
> 
>  scripts/Makefile.build | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>

Thanks a lot for the patch!  I will happily take it for the v7.5 cycle,
and add a

Cc: stable@vger.kernel.org



Reviewed-by: Nicolas Schier <nsc@kernel.org>
Tested-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas

