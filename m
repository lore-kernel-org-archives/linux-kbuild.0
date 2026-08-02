Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF09175A81;
	Sun,  2 Aug 2026 19:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785698029; cv=none; b=jn0w+9WktvqdBwi4G6EfIAAot1qZBHOFQPaiyLQgL+W1fjUfB14LqvjBFpeK+PwPF0K4XuuVrkNACSPpXhCFBFF/SEdOR2KxD9h0eenNJjqiRhDC5XuxPJzmjs+dDVSrBVDk6Pn9SJO1NCQlKS98CH1ZeRvTgfKhe4rB3/XMfdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785698029; c=relaxed/simple;
	bh=4B+TfG9hs3sMlC0VjdeRN/9shppCeN3jKuWMuFbA8iI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sR7BeMEFaq9HighXzvcJizNJVIIFhWfVaAY6G5FTCgXYMQ7iWAx5Ht2BUUgQuZ1uhianYSpDHud8G0gN7EuBX3yXHBc5tHz8LC/JZSWmyidIAKYB78W+rdJ/ZLmAo2YfyC1PgIFoYSEsClWh4OsRTyiWNntw56sEkQatCN8VDp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FvLWiXG1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FvLWiXG1"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id BAC861F000E9;
	Sun,  2 Aug 2026 19:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785698028;
	bh=wGMp1wQPRot4anMbPLB8rvxZ34UMz7OxAJDdy9LKYc4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FvLWiXG1d07NTnf76Le4LGKpiDLs4b+ZV82tby7OcczUDQADVtmzBBYACei5usbod
	 8id9ou4XPJGxalroCAdo5fkSOtv+5Cn+kv/swJzd7KV7Mh/BNHUlJiETH4vja8yrJj
	 wHXIu0AfeVnWCzjrKdK1XT7a7dN9OnKP5IQj+tCGlO9QThSDlzLEuFtJB2D23oPA72
	 B+5piu14DlHwyHMIDYXxofJlD0uxJ4pKyLT8HS0mpGq4wYuQgaI4TcXVxeuLnrSw9H
	 tWYqZH9HPKuaAYlCJX1+qZjCJhxEBSfHfvsiyzApWm7HML8Lb0mQAWmRyoYpXg1k0+
	 NHjbaSCmn2T/w==
Date: Sun, 2 Aug 2026 21:13:38 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Julian Braha <julianbraha@gmail.com>
Cc: nathan@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	arnd@arndb.de, stefan.hengelein@fau.de,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, nico@fluxnic.net,
	officialnaumansabir@gmail.com, rdunlap@infradead.org,
	vegard.nossum@oracle.com, kees@kernel.org, tj@kernel.org
Subject: Re: [PATCH] Documentation: warn users not to use select on choice
 options in Kconfig
Message-ID: <am-W4tuI0k7MKXVP@levanger>
Mail-Followup-To: Julian Braha <julianbraha@gmail.com>, nathan@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org, arnd@arndb.de,
	stefan.hengelein@fau.de, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	nico@fluxnic.net, officialnaumansabir@gmail.com,
	rdunlap@infradead.org, vegard.nossum@oracle.com, kees@kernel.org,
	tj@kernel.org
References: <20260715220149.48700-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715220149.48700-1-julianbraha@gmail.com>

On Wed, Jul 15, 2026 at 11:01:49PM +0100, Julian Braha wrote:
> Hengelein's master thesis about Kconfig from 2015 wrote that 'select'
> does not work on member options inside of a 'choice'.

is this true also for 'imply'?  Adding the check to kconfig seems to be
pretty simple:

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index b2d8d4e11e07..149d3ee59b58 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -287,6 +287,11 @@ static void sym_check_prop(struct symbol *sym)
 				    "'%s' has wrong type. '%s' only "
 				    "accept arguments of bool and "
 				    "tristate type", sym2->name, use);
+			if (sym_is_choice_value(sym2))
+				prop_warn(prop,
+				    "config symbol '%s' uses %s for '%s', "
+				    "but '%s' is a choice value", sym->name,
+				    use, sym2->name, sym2->name);
 			break;
 		case P_RANGE:
 			if (sym->type != S_INT && sym->type != S_HEX)

which currently reveals

kernel/time/Kconfig:136:warning: config symbol 'NO_HZ_FULL' uses select for 'VIRT_CPU_ACCOUNTING_GEN', but 'VIRT_CPU_ACCOUNTING_GEN' is a choice value
drivers/mtd/maps/Kconfig:104:warning: config symbol 'MTD_PHYSMAP_IXP4XX' uses select for 'MTD_CFI_BE_BYTE_SWAP', but 'MTD_CFI_BE_BYTE_SWAP' is a choice value
drivers/tee/qcomtee/Kconfig:8:warning: config symbol 'QCOMTEE' uses select for 'QCOM_TZMEM_MODE_SHMBRIDGE', but 'QCOM_TZMEM_MODE_SHMBRIDGE' is a choice value

on linux-next, with the NO_HZ_FULL also being addressed by Julian [1].

Julian, please call out if you want help for pushing these.

I am considering to prepare a patch and add it for kbuild-for-next (but
not to kbuild-next) to raise attention.


Kind regards,
Nicolas

[1]: https://lore.kernel.org/r/20260801160140.2391000-1-julianbraha@gmail.com
