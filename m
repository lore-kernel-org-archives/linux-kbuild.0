Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E08B411611;
	Tue, 31 Mar 2026 15:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774971166; cv=none; b=StNlXQGOoeXsoIRR61cuscQzxevWcUzdAGq31wmSRlijoZeYJd+8m2FMj5MmsYFz8jiivnYqrv8LKzZqPYbtoALTRzj7b2a3BqkUvUsxKerhjTHS9XCgJTbpvpOYj4WHZ1ZsyyXArBRLwMTTdC/1BWVusgQThf73q6BeTMWQg/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774971166; c=relaxed/simple;
	bh=YztkdcVwx0f+l7X6VNzBz+tYdrUS7mC5f1x7arJCixc=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=rTnOT60XG7cC/wCTuUgRmkPuJNOoxI4poK+MDqb5XgWysBXuW8ai+GCNGbYwee5MD4KSmoJiT9xSwcMQR+HIm35Mex/OD93rQTNz6E3B4QQ65OCmP06F/iwcQr3ZeuEtq0jkiYbfJrEAXFSydFx6nUynHtrHoDUFXDDi4PhX2Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LvxNrIpr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LvxNrIpr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD153C19423;
	Tue, 31 Mar 2026 15:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774971165;
	bh=YztkdcVwx0f+l7X6VNzBz+tYdrUS7mC5f1x7arJCixc=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=LvxNrIprbGD7fOSnSdzc4DRNsgmSFDl64Ws6vCW3TJfN4JtB4XNp7WbzDNS47jRsR
	 TrrwiHb1JxHvSZw9mz5eBE8QLA5pxpQhx2CAyUquaO1YtJ3xn7DAhZvKrAUefOEhc2
	 mWQAK4qRzYSBDaDBa1VYBVCDL4RpaGO++zX4iNOXYdkQpvF7oXWFTV7yzgn9B9ZIRL
	 SHA2NLYK9/Hc5f0MMRCS61XxJJ+FVDcV0xNt6yZ6NIWQ2AIRewOi2sId9uAdkFyPEZ
	 sJ6xVrRFKut8WIS7bPzLcQHQa7hziaTQ1k90NRBjhdwVkpXJ1/ueU9QIEbiZ1WyyG7
	 IlQ4JCceLAKzA==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 2/4] kbuild: vdso_install: hide readelf warnings
From: Nicolas Schier <nsc@kernel.org>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260320-kbuild-vdso-install-v1-2-e2e8a0970889@weissschuh.net>
References: <20260320-kbuild-vdso-install-v1-0-e2e8a0970889@weissschuh.net>
 <20260320-kbuild-vdso-install-v1-2-e2e8a0970889@weissschuh.net>
Date: Tue, 31 Mar 2026 17:15:33 +0200
Message-Id: <177497013330.2338582.5564722190225676953.b4-review@b4>
X-Mailer: b4 0.16-dev-ad80c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1257; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=YztkdcVwx0f+l7X6VNzBz+tYdrUS7mC5f1x7arJCixc=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBpy+UY83SxSKE7lL6LQR/4ARGFGmfsc/o0aK6c9
 qLl/kqGs1uJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCacvlGAAKCRAHUgpwFiYS
 ab3tEAC4cTjiS9+L+cJKSIhdZD8OHI6B1LFa7x6xzCDWpV9R9sii5L+RqjB88n54aIRufJ58Tis
 YVUb1Dm6Bci8sOrAvCOsFukHX4XwNTmHn9JR6y+FUDx2q7cSGriBAgiESkm6P0+GutjnM9i38Kv
 q0IkalaKri9PxRxrU10rB6mW3NMzl854a2zybdZVt8lOedtCI19jVnTh0FeC538ib9rj/jfYG7/
 q4hupcpwm+qZwFRh5asWUmZXl1/KEf2zFUIf9MO+TS8+ksSpFmfjTji78P/j2E1YmXDLf5K82jo
 BaTQiegjevX0IvJHc4gym+VQoU9424dYMzDj1F+4j4CHH+3B58bXJINjZ/UlWu+xWiPkBkcfKKk
 ow4hsFOM1Bl0fCw9o684X2UsoESszu/zzZt68qeUDJn+HO8JJQIAkzxIWfAvORlLuIeTiYM2gXw
 17Q68K0ELSHY1r8jwIdKB9eEm3uBMnyp1BvM9Y0HZtVn4SgPkRVIuIdyrcXM3NR4VI/O5WlqehS
 NLQH/C1TA3pzaTfzjyL7oaileF6VWt+y8nvwxbsMIk2CWAA0Ysx9Tl6KSqmuQaLtOpqHtoavebG
 rCn0pIHzMI7napPz3hz5TfXkSEgxqgrotJSu4JAPQ9Anyb0k5sKUIvRCcK6bTA4yJWR74HapRa6
 o3G+9OMRIDs21Sw==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

On Fri, 20 Mar 2026 17:36:54 +0100, Thomas Weißschuh <linux@weissschuh.net> wrote:
> If 'readelf -n' encounters a note it does not recognize it emits a

,

> warning. This for example happen when inspecting a compat vDSO for

happen -> happens

> which the main kernel toolchain was not used.
> However the relevant build ID note is always readable, so the
> warnings are pointless.
> 
> Hide the warnings to make it possible to extrace build IDs for more

extrace -> extract

>
>
> diff --git a/scripts/Makefile.vdsoinst b/scripts/Makefile.vdsoinst
> index 214c561651cf..aed153b3120b 100644
> --- a/scripts/Makefile.vdsoinst
> +++ b/scripts/Makefile.vdsoinst
> @@ -21,7 +21,7 @@ $$(dest): $(1) FORCE
>  
>  # Some architectures create .build-id symlinks
>  ifneq ($(filter arm s390 sparc x86, $(SRCARCH)),)
> -build-id-file := $$(shell $(READELF) -n $(1) | sed -n 's@^.*Build ID: \(..\)\(.*\)@\1/\2@p')
> +build-id-file := $$(shell $(READELF) -n $(1) 2>/dev/null | sed -n 's@^.*Build ID: \(..\)\(.*\)@\1/\2@p')
>  link := $(install-dir)/.build-id/$$(build-id-file).debug
>  
>  __default: $$(link)

Sound reasonable and the diff looks appropriate.  Thanks!

Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas

