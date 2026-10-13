Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A3933B6F8;
	Tue, 13 Oct 2026 07:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791876565; cv=none; b=T9A73tt+6VDYXf5QmkJkQ/FpV9BxW96Kc7G26oZ89vhe4Vi5+iKA3Qhmru/hYZRsA6GwuTvGforLo/6GMCEpu+ROO2TNyBFcklXeJxVmVP/hEjb4biYvYGwVcjMHEjgyNLqsBVzAbuoBVEcltPCyNV3ysl98+Y3DRaWG5hoXSco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791876565; c=relaxed/simple;
	bh=nmXxwJ1VVg6mIMjHgDedWilo3xtHxPxKNXVORAf0SWU=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=NWdBoBprW1CGNgm/q1xbxbOU6g5Gwh2ouxOCXvH2GyLf2/04oztHA8VtpAaZPgu8ixEX/FSLVmzYrF/1xTJgBJWi9yKgR8lz2qgR/p3Nn15NKmUEhHZ4JYAi+h6XBRQOAnMPgJqTsL5CifBG6JG0RlTssacFx8rmMAe0QrNztfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BRsWNKFX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BRsWNKFX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 654DB1F000FF;
	Tue, 13 Oct 2026 07:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791876563;
	bh=mJScJXZtyLkyGDkgb32kc98lmQTUau9kFJyfqNy01XY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=BRsWNKFXNFuJ2AthhGKI5U0r7AA/NAhdHCPfGG6bavvKfGTbC8S9LVTFFZJPCNu2u
	 K1UD3eOpBqnu20aswIVhG9THgfSkoMpVj7jK6IHRT3tbo9qP9UPFnAm/kamCylFv3i
	 FkdUocXr5DzswyTcyNhTfMzRZaCThSbH+ZI2OR7kFmgAqh6LaVFviWpwOQpi0s0gVY
	 n+i6SWQxZtn6cdujgmwyiE3Y1eck+++YZVDP+ZC8trpdxSOJN1Q7EMX7RQP0rRoIVb
	 HgzsJ2Dirdw3snUhk+AEVtl3a9aocp7C+yY4C7VSIhCfGHhi8ilXHQPWJ+O1iyhTWJ
	 2fERk8fU+GXbw==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 2/2] kbuild: Support directory targets for building
 DTBs
From: Nicolas Schier <nsc@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Saravana Kannan <saravanak@kernel.org>, David Heidelberg <david@ixit.cz>, 
 Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261007-dtb-dirs-v3-v3-2-b3ab32b64fa6@kernel.org>
References: <20261007-dtb-dirs-v3-v3-0-b3ab32b64fa6@kernel.org>
 <20261007-dtb-dirs-v3-v3-2-b3ab32b64fa6@kernel.org>
Date: Tue, 13 Oct 2026 09:29:14 +0200
Message-Id: <179187655459.507775.1775352187317756159.b4-review@b4>
X-Mailer: b4 0.17-dev-fde28
X-Developer-Signature: v=1; a=openpgp-sha256; l=3061; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=nmXxwJ1VVg6mIMjHgDedWilo3xtHxPxKNXVORAf0SWU=;
 b=kA0DAAoBB1IKcBYmEmkByyZiAGrN3cygxY3k+uRUn/31jkIwGpUSI6N3Nb7JSP9WBiRQcnRZ2
 YkCMwQAAQoAHRYhBIdBN6eHNySngb7CxgdSCnAWJhJpBQJqzd3MAAoJEAdSCnAWJhJpNQkP/RTM
 HTkKSyebKtZoKAB7NVWxUVxYudp2u3Rz0WuvAGgBEALEwpMyUO76lYv79rXh5qAN+yrYRrdYHlr
 alr6TL6YWKkpJaNHqGpmblLJqFVjWS9LxaxSJ3Va6PBD1VA00d2DUP1WKeZLu/aKffPy93JqMg/
 ToxupwY0zxmo7LOKVYKR5P2E67e1xSClb1yFf8UkTq9TTq17RDr3m5kf1r0x5UJ6V8yKjRV6xNK
 98CnpbPq1D7I8g6e7WG5A2QfNfqTVjK3wXGPLBvrDdz9fN/hxntB941+dlVXghyzzxct/LFnU4K
 8CI4muzUoM5EpjJHIKwpVtGmMsVdT1hXsogGtcFyWhC0AvpjDcMlRNI3VPznheQiRdw6iCJtTGP
 8aMl3m/5AZYZYGM1cQajaDlC15Xqz2xlEfPprapI1ikFlYf/3LjjGXUCa8VI++k0OS6Lpfq7GZA
 zbVKSkrOF92/XWJsDgi/Px/9C6GhB7EhbfGVs6Ms/FjYpWPMIWSgfNyjjMYfbg8oo8XP7tojMiM
 ZOy3A1El0YBcK/QPf1qjV7LqHOibaBaErtahmPmU5hI03jxZhL+iCCXJEfYGCunbVdHI6Wabmfa
 /z927J9BQxCrQVuwZ+PNvs3qxx3oombWMajY7ovaKYRl0SYKU+SigHobEuStassTXOHn1N1GCXY
 Qu8Kq
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

> It is useful to be able to build all the DTBs for a vendor. One can list
> all the .dts files in a directory and convert those to %.dtb targets,
> but that doesn't work for base+overlay DTB targets.
> 
> The 'dtbs' and 'dtbs_check' targets can use the directory rule targets
> as well which avoids different make paths for building DTBs.
> 
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v3:
>  - Reworked on top of single target rule for %.dtb
>  - Make dtbs target use directory rule.
>  - Move adding boot/dts subdir out of the arch code. Now supported on
>    every arch (not that useful without vendor dirs).
>  - Removed the need to look at MAKECMDGOALS
>  - Fixed unnecessary rebuilding DT base+overlay targets
>  - Link to v2: https://lore.kernel.org/all/20251120204812.1983452-4-robh@kernel.org/
> 
> v2:
>  - Convert arm, mips and riscv. The other DT enabled arches don't have
>    vendor directories.
>  - Link to v1: https://lore.kernel.org/all/20251113225952.867138-1-robh@kernel.org/
> ---
>  Makefile               | 8 ++++----
>  scripts/Makefile.build | 7 +++++++
>  scripts/Makefile.dtbs  | 2 ++
>  3 files changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index c307ee9293bc..75d290c2b7d8 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1664,8 +1664,8 @@ dtbindingtree := Documentation/devicetree/bindings
>  ifneq ($(dtstree),)
>  
>  PHONY += dtbs dtbs_prepare dtbs_install dtbs_check
> -dtbs: dtbs_prepare
> -	$(Q)$(MAKE) $(build)=$(dtstree) need-dtbslist=1
> +dtbs:
> +	$(Q)$(MAKE) $(dtstree)/
>  
>  # include/config/kernel.release is actually needed when installing DTBs because
>  # INSTALL_DTBS_PATH contains $(KERNELRELEASE). However, we do not want to make
> @@ -2216,7 +2216,7 @@ single-goals := $(addprefix $(build-dir)/, $(single-no-ko))
>  
>  # DT-only targets need host tools, but no architecture-specific preparation.
>  ifneq ($(dtstree),)
> -single-dt-patterns := $(addprefix $(dtstree)/,%.dtb %.dtbo)
> +single-dt-patterns := $(dtstree)/ $(addprefix $(dtstree)/,%.dtb %.dtbo %/)
>  ifeq ($(filter-out $(single-dt-patterns),$(single-no-ko)),)
>  single-build-prep := dtbs_prepare
>  endif
> @@ -2234,7 +2234,7 @@ prepare: outputmakefile
>  # Error messages still appears in the original language
>  PHONY += $(build-dir)
>  $(build-dir): $(single-build-prep)
> -	$(Q)$(MAKE) $(build)=$@ need-builtin=1 need-modorder=1 $(single-goals)
> +	$(Q)$(MAKE) $(build)=$@ need-builtin=1 need-modorder=1 need-dtbslist=1 $(single-goals)

Thanks for the series!  I think it's a good idea to make single and
directory targets work for DTBs.


Always settings need-dtbslist=1 leads to inclusion of
scripts/Makefile.dtbs for each single subdir that is entered and creates
a dtbs-list file on each of them.

When do we really need the dtbs-list files?  Would it be sufficient to
generate it only if $(filter %/dts %/dts/%, $(obj)) (= /dts/ subdirs)?
Or if there are %.dtb %.dtbo targets?

-- 
Nicolas

