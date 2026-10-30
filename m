Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793370024;
	b=frVUUCXWwr3FeDf6rWRsp45Ib0tDM/L3+yRleqbqVG4zxNzFtEjACRH6skj6HC0l1/0l
	 EAchzbXSR7GclTuDKGiA6YAvLUYUDcFEahppmLHHTRJLXtieOLMGebD2GQIIo4lqeGDkH
	 pBMPcABylqQbPEP0ufamSUl+bxUjLo+9dSNPixe/PsGc+354SDGDgB28MekRvdbgP+yZH
	 PJlIfIRQr1HCg9vCJKTnRD4he4tps0kvr7//mIu4X5ngmS/98kWi2Qx46k9INP45fdwAQ
	 3CARfyGc8Hw3iozurvcYrmCYRPa7ukw2boyuU4biWl5p4Ec4dBEYx4XbW8evvMGEjCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793370024;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Gz8tufo0m0wCulzcu/zCog+PiMQz+E7r7KmJRLFYN0k=;
	b=sgtM448n9b/wBTkk+U60yxiir4MXnlbxa4sjlAEsOuj+ZOiArlz9BgkSMOuZArIEqXCy
	 EBQ+uf/9MO81cijqHlyHnfPQKC8ZAKWRpKCDQssD8JfLua6EBcTstyt9204bntI8iJkiv
	 cF8JugLpkrJiLsVBluQaIqjo+K4FG+HxKGr+0D1PEOMCZH3GzCR28YmbseBZSvtpNceUF
	 gw1330oTzeeTf1gZKxuxdwunvO7pQob4KNlP1YVkgsbTnab6bAhK3VzWqVG4D4mFj3Kl0
	 EN0iyeydfk8HLpQX9367/XhNLnxKN6TlGQgE/fEYWxJTq05784OuNL3EDXUmyA+saJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VKcRmLii;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 57CBC606A31C;
	Fri, 30 Oct 2026 14:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VKcRmLii
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 7F44C1F0093A;
	Fri, 30 Oct 2026 14:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793370024;
	bh=Gz8tufo0m0wCulzcu/zCog+PiMQz+E7r7KmJRLFYN0k=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=VKcRmLiinGZk1rDYI30Cd7gr58jw5KY9OdMpYcEaX7iGvoWRWz77o7i7RjKqfDEnz
	 PVjQMTYzAG/ZswC9q7LV2AZehWjqg5U+X74OuG4ghf8KzjkR0jaWpIh6O0T1mKRasl
	 JIQDbCBftxoDLrn595kLzlNd05ocT0njCEJ6g5MkmHIrVsAngOCbc+iMVXx5McRhEm
	 RpcpdgHEwrCqJ3TPN8jt1whmrJ4mFIm+5A3VXljLpf/cHOIfgtjNq1049dEijOcWB+
	 E3AhNQ4BAbhOfyx2s3ohOlJhvlaevyBLJJ2W76kHiB7mm+lRQwgANf0IjB/FlRKpvN
	 crrdo+GwzxKOg==
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
Subject: Re: [PATCH v5 2/2] kbuild: Support directory targets for building
 DTBs
From: Nicolas Schier <nsc@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Saravana Kannan <saravanak@kernel.org>, David Heidelberg <david@ixit.cz>, 
 Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261023-dtb-dirs-v3-v5-2-dfe13d47aa64@kernel.org>
References: <20261023-dtb-dirs-v3-v5-0-dfe13d47aa64@kernel.org>
 <20261023-dtb-dirs-v3-v5-2-dfe13d47aa64@kernel.org>
Date: Fri, 30 Oct 2026 15:16:48 +0100
Message-Id: <179336980813.3139600.12365744632390730361.b4-review@b4>
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2025; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=xjoqRoFBUlJo0LxZQBS7KJFWVkqGKDnz+QZfxjGxBic=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBq5KbTXElPAg1iNDSd8mx2dOh46umDBQfUYOF9d
 XwzwqbSlrSJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCauSm0wAKCRAHUgpwFiYS
 aX9lEADyP0y324BnGj0w37NJTRd5zotHQwsbDz+f7cpsOePQpXuPO8gtRgguPBB1kPGguwiLidR
 gutaGPK7lFhHrHgk8jkoLo6wBRsZSAs7Z4ReLHKv5bs62Zu1D3ZXGfkDIqXdnWXtzRA3Bq+bSUc
 kp5ENeVReaX5FPFIiquN5d+pGQEDJ+n0efvwWFS3/ro8Bih6lhGoD6S0TZhCAT763UUadxyUjJJ
 NjB4Y+onSQIyMqlXlsncHepeA/fijrcycITUCN/S87yf2FO4vhyBBQ4yqQ8jkiXIqKWEoeJ4ngv
 buhEWzEGzYTlU4qkj+SpiJ4FiVQM2xG1Ay50bEaAdbE9brEiJahDuF9k+HDiMd0+eVEwaPh6YoT
 DGE5f22H9wbjIRmAHymOaOaAe675Vvq+u4bVhPmq5fPMwp0xDX6x3NtXPatZL3ydXpgRTcZc3j5
 EyamjcBntP3X10xy5Zq4xSuDy5hLdUCY73aKXlUb8TKlcfwfhYAAoxVCr3lfXIjJqCyoZTnLUsO
 XlAitU35AZHuyJcocR6/UI011zZWDC0v506llQBS5sGuV7m+URgVo3+xLuR3vsMO1hZePm7xQrz
 MeDB5jo+vtt1+j4xSeWtoRc/vphPSh4QRXRGgURB0w/V9LEKD3jc/EAqYuCcf1aPDlzv3QJxeHz
 glYF5Zbad+yyGVg==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

> It is useful to be able to build all the DTBs for a vendor. One can list
> all the .dts files in a directory and convert those to %.dtb targets,
> but that doesn't work for base+overlay DTB targets.
> 
> The 'dtbs' and 'dtbs_check' targets can use the directory rule targets
> as well which avoids different make paths for building DTBs.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
[...]
> ---
>  Makefile                          | 12 +++++++++---
>  drivers/of/unittest-data/Makefile |  5 +++++
>  scripts/Makefile.build            |  7 +++++++
>  scripts/Makefile.dtbs             |  2 ++
>  4 files changed, 23 insertions(+), 3 deletions(-)
>

[...]
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 4349108e75e1..22fbd5199091 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -38,6 +38,13 @@ include $(srctree)/scripts/Makefile.compiler
>  include $(kbuild-file)
>  include $(srctree)/scripts/Makefile.lib
>  
> +# Make DT directory targets reachable for architectures with a DTS tree.
> +ifeq ($(obj),arch/$(SRCARCH))
> +ifdef need-dtbslist
> +subdir-y += boot/dts
> +endif
> +endif
> +
>  # flags that take effect in current and sub directories
>  KBUILD_AFLAGS += $(subdir-asflags-y)
>  KBUILD_CFLAGS += $(subdir-ccflags-y)
> diff --git a/scripts/Makefile.dtbs b/scripts/Makefile.dtbs
> index c4e466390284..c7ec2a2a308e 100644
> --- a/scripts/Makefile.dtbs
> +++ b/scripts/Makefile.dtbs
> @@ -23,7 +23,9 @@ dtb-y           := $(addprefix $(obj)/, $(dtb-y))
>  multi-dtb-y     := $(addprefix $(obj)/, $(multi-dtb-y))
>  real-dtb-y      := $(addprefix $(obj)/, $(real-dtb-y))
>  
> +ifdef need-dtbslist
>  always-y        += $(dtb-y)
> +endif

Looks good to me, thanks!

Reviewed-by: Nicolas Schier <nsc@kernel.org>

To prevent too many ifdef/endif lines, we could use substution variable
references in scripts/Makefile.{build,dtbs}, e.g.:

always-$(need-dtbslist:1=y) += $(dtb-y)

-- 
Nicolas

