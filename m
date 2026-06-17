Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF4C19DF55;
	Wed, 17 Jun 2026 04:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781670122; cv=none; b=qDlRMgJ7dDUwgfYOis1aT1NN5KlHLTo53XB/I8GpVDTmAqRC1l/CZd8vpJTjZ/Uv+NSm5Ptn1ET9/KzHoze5DMXwPx0XJGd8CdFvTJ/M+mMJlp5BzCpXLRt6silMjpKY88j9B72yrO5ttAr4dJV2H+tHJamFY3w+6YvJlgBGHHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781670122; c=relaxed/simple;
	bh=35DEzLO5ORXnNrvPEy+FOgRJHSFAGlodR7f8F449hsU=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=qVoPcvlPEArbft8vI2h9iIvqAmcFssgQJyGP+bAurBVcTevEkI0KNxbHlDbYVOVZJmQxh+INyB+qimvz5j/0e+r4IL5J+c2w8JHwVQ/GkLXGf1K8bgI29f0X0+qGIJY2Z68GzE0AHG5NRN94oPUyu5g/rRkE5/b0T0ttSsxaBK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O4G3SEB3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O4G3SEB3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E28B1F000E9;
	Wed, 17 Jun 2026 04:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781670121;
	bh=fUF3YzkrYB+RRcfsJuk2wfkqiVjO5X03v+8FeRfbDKw=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=O4G3SEB3lpIALqka75onflTJ39hWm6DM1PxEl+NruzoPMhKHrXjn9tIBE2lZ26qI7
	 x8BIvJT+F/hJJtmqieTB0M/ljPTmcqtuavl+4H/LztyC28MuAMwBDi24f/EXJjj18L
	 m2o4kzJVxAwLR2rGUpTCd4NVuzf2oILPkww984q/NAPPn+sG2ADxtsyHpPowugK39Z
	 Su89Qesof9i8z84iAW65immWL/BxyDc92IIDpEQN2CGwtsJM/47dNPHKRDjtBOavu0
	 yWFWM6QPQwD/KZwtQVivVMPbSrbLkZzy/lVIQJAq0MHCGiHixmJL+CROh+CHypnjg5
	 1uDVafkOXi9dw==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] modpost: release allocation when early return no
 suffix .o in read_symbols()
From: Nathan Chancellor <nathan@kernel.org>
To: Robertus Diawan Chris <robertusdchris@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org, 
 me@brighamcampbell.com
In-Reply-To: <20260610052550.187006-1-robertusdchris@gmail.com>
References: <20260610052550.187006-1-robertusdchris@gmail.com>
Date: Tue, 16 Jun 2026 21:21:52 -0700
Message-Id: <178167011232.2064238.5669414796099955471.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=974; i=nathan@kernel.org;
 h=from:subject:message-id; bh=35DEzLO5ORXnNrvPEy+FOgRJHSFAGlodR7f8F449hsU=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlGCs8Ll1ze2eO5g2nyzBAjYe97Djm7Fp9JidhrbtZ82
 ujf12lXOkpZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBECj8zMvReM10urMu/e7kk
 U76tYZn3TK/l61XeB4Txq9q+mbZhihzDH+4LogKa+yL8n7OfEBOb9M503g7NGteZKzfyqFyukBX
 8xQQA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On Wed, 10 Jun 2026 12:25:50 +0700, Robertus Diawan Chris <robertusdchris@gmail.com> wrote:
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index abbcd3fc1394..8e231544f9f3 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1585,6 +1585,7 @@ static void read_symbols(const char *modname)
>  
>  	if (!strends(modname, ".o")) {
>  		error("%s: filename must be suffixed with .o\n", modname);
> +		parse_elf_finish(&info);
>  		return;
>  	}
>  

Thanks for the patch! While this change appears to be correct, would
moving the strends() if block before the parse_elf() one resolve this as
well? I think I would prefer going that route because neither check
really depends on the other and we have to think less about unwinding
with the checks flipped. Furthermore, modpost is a relatively short
running host utility, so I don't really think it is worth optimizing for
resource leaks like this.

-- 
Cheers,
Nathan

