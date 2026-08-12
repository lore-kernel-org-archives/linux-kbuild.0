Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E793FC5B9;
	Wed, 12 Aug 2026 09:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786525832; cv=none; b=k/18+W8RW3ZmQKNPc8ikVcndjjb8T88O7ebA5cxp51Gx6M8mvDyLR9jX/XFyup456tcU6BTsJ6JKkf4Jicyj2824XYkiwsRh7h8rMDf/S6x4zc6m3LYCPatYEUrRA49sbddu23s1AmhBaS1hSP/hByZM+3i8NqBafAMSFp6TEm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786525832; c=relaxed/simple;
	bh=LlSlC2XBoGBa2O7Ah7cZpj5ywnpH6leXj2oEmCpYe7I=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=QG/odxyfoC5PUhsL4/rN2wpWynflhoNG2htLwNZfejvrqtqY3kRH72ctmvsO8xX5VWbfQs7Asf5zCjZdwmJfVz2mXRm45S/vPRxqR34zqnCZSYsUNFGXi/vpY7mNki4FS36axlzOQH0tDLDb4DEfdAw4uNQ94B6Ji/jNK8yc5Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=ebuYXKZw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lKy6kshP; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="ebuYXKZw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lKy6kshP"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 972A714000FF;
	Wed, 12 Aug 2026 05:10:25 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 12 Aug 2026 05:10:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786525824;
	 x=1786612224; bh=m43/NCxgYLAmMjSMLcEsEYangpIMm56Zhl7/o3eXPj8=; b=
	ebuYXKZwxPi7GaNUK9oaW4s9ZoyYuZtE6z4Vk7Ag8WpTQHhoLyAdVC5AmMlkcR72
	b2ZgNJMbQhqI5FDPPqwyDdtiP8s+0AoEKWinh2f2ALkDl1pda6F1oDDbdyvgK06g
	26ol5+VipRUJ6NbRFrBei42xEy2iqGeDidS5Y6y3QqtMdhFpP9laVksJaVMSX2L/
	qhmlWPrd8qL29DGKyCx89XbcohdzXavbYr8+k28w+xHF2cC3IBQ3aa0ZG/+TuT8q
	cSu+GAxsUtdfhcFfJ2JNVjJMDnymAykJaa2hnj0RKoMzz8WQtfZG8SN47tGm1p8A
	NpHV5GPCCJydkdBVsy3JUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786525824; x=
	1786612224; bh=m43/NCxgYLAmMjSMLcEsEYangpIMm56Zhl7/o3eXPj8=; b=l
	Ky6kshPQU8wWPN4/Lr2NMAHy24Hnw/MMWkCbwT70us8cY4pI1r+u7zrOKZAC+zAk
	zrvyjJthE4y0/B6iiJV6wXuQQoAiNM9C1qg6RCrrTqGhxG2lBN+Uz+Iz5FBW2cQ2
	KTpaNz51WFdAc7JUZXm6ZQkF1rushyAE8rpB3o4FJ+kV/cwVEr4F02ec1YZ7vg16
	JFrvdkF+geAtNBKWG27uqFIjRwZbFRRjZNTlXKxpUTvH8fx8xofi/3JCJAmmKJnX
	Mr94V+Dhd3Dn+IPD/ORBEyjIz2CgnXOv4rg/ZQbucncpdMM0uKlcakdweP+XMUIJ
	mBNNl+u5HfIPAFtlXV6Eg==
X-ME-Sender: <xms:fDh8amxc47gB9kYP_1kYKPMEwHsJXVJYnHFhZtxArhrk9FeqLs0JkA>
    <xme:fDh8atE19rQyhksZBfzCtt-3relQZ4xa0FzN68eQI2RgqS9PgcQDC8kGsY0wEHKcg
    hr6R9K756HxpbYA8RJqYzRYnpF5qCwXEwaqInFKQjR83js2Sw7uxd4>
X-ME-Proxy-Cause: dmFkZTFdIhn5hHb5V558QRGjUpbW+zxDlt9QLcRAwNtIyTiMh5QSnlLXx10c2du9ipXiVW
    gStStPe1U0f5qx1ZdZMkaJxh7C/+mtOR8a0j+5wGCidyxwXBvkRe6bothSzhF7neVogH+1
    7RO7Us0zUY4US+Bp81PMDiMNysl33VfYprT0CSNFCnMTvboDPCtrkiq7Y0TyhZdsOXfv/+
    02/YRfKS0oOrQvAloo8u7s3h5Jx239Fw7WVow7oewihA41uGZv/Q3kzuQhaUHWQ/YwRpuD
    IH/ePtzD6p4GCF+H4tAzcH0TFbVfTQZAOUzvPedVeAHazrF1JKcKcypsL0J5wMX5QmTyhn
    zRqiDA6CcXJ+Co5fUIcv7cIZpxPba9eUhddBDEz6ZG1dSZyIpwwdZSLTno6poIj8ms+EtR
    6WzBDvAvOfKqHuZWii5PzG5sDPPFSTSUxJtSkFxYKA/DjSr77mZ3WSXIbvaybhDGlLlcRc
    CBfo89+9HqnIOVQrNTAC7of10N81mnadR/LFnVKUK2lNuO+k9KucVOnJplDTn07YhwkFck
    exhj9l8jkLSImalysnxfGfnV8FdkJvVxXkDeMqqkiI6GWqcBRFZm7L7PR0OTejQoIIDNGq
    YFTQ5aPYCJdDl0ckXX5MBBxSXojIMA0CBtjy1XiNrFYVPjBdczEf+TYJCFdQ
X-ME-Proxy: <xmx:fjh8asY3v_kuXHXw3E1_2Wya1rQ8viNi13qYrMxenNteYEHqB4eQlQ>
    <xmx:fjh8ahcDXJPhgkn4scSd3xkLHF_UQKZ6O42gve0oCsjLDCgXlrFfvw>
    <xmx:fjh8am1WAqjZARVzp3w5Jc-3y8z_gKFthRSSNI9X35K2SbXyjfEqaQ>
    <xmx:fjh8aoK1iWMKhojD6XQaowNIDIVRQQj5J1_B5mtlZA5XYlPmgbKVlQ>
    <xmx:gDh8ampoVgODlSEPFGab6HJgvsYzLRE2fZ5WjBZCHKcdQDovvxuxYlRN>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 8EC2432A006E; Wed, 12 Aug 2026 05:10:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ALvAeZC0UQTs
Date: Wed, 12 Aug 2026 11:09:44 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 "Thomas Gleixner" <tglx@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>,
 "Masami Hiramatsu" <mhiramat@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 kernel-dev@igalia.com
Message-Id: <581ec9d7-d308-4fcf-bcf9-f243661fcc59@app.fastmail.com>
In-Reply-To: <20260812-tonyk-syscall_table-v4-12-748d0229ad40@igalia.com>
References: <20260812-tonyk-syscall_table-v4-0-748d0229ad40@igalia.com>
 <20260812-tonyk-syscall_table-v4-12-748d0229ad40@igalia.com>
Subject: Re: [PATCH v4 12/12] alpha: Use the common syscall table
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026, at 05:33, Andr=C3=A9 Almeida wrote:
> Remove some of the duplicated code by using the common syscall number
>=20
>  quiet_cmd_syshdr =3D SYSHDR  $@
> -      cmd_syshdr =3D $(CONFIG_SHELL) $(syshdr) --emit-nr $< $@
> +      cmd_syshdr =3D $(CONFIG_SHELL) $(syshdr) --emit-nr \
> +		   --common-tbl $(systbl_common) --common-offset 110 \
> +		   --abis $(abis) $< $@
>=20
>  quiet_cmd_systbl =3D SYSTBL  $@
> -      cmd_systbl =3D $(CONFIG_SHELL) $(systbl) $< $@
> +      cmd_systbl =3D $(CONFIG_SHELL) $(systbl) \
> +		   --common-tbl $(systbl_common) --common-offset 110 \
> +		   --abis $(abis) $< $@

The --common-offset agument does seem simple enough here and it
avoids processing the files separately.

> @@ -45,6 +45,7 @@
>  434	common	pidfd_open			sys_pidfd_open
>  435	clone3	clone3				sys_clone3
>  435	__clone3	clone3			__sys_clone3
> +435     alpha  	clone3                          alpha_clone3
>  436	common	close_range			sys_close_range
>  437	common	openat2				sys_openat2
>  438	common	pidfd_getfd			sys_pidfd_getfd

I think it would be nicer to change the "fork_like" macro in
arch/alpha/kernel/entry.S to use the same __sys_clone3 name
(and fork/vfork/clone) that we have on
m68k/mips/nios2/openrisc/sparc and save another special case.

Or we could do this the way that nios2 does with a redirect
in the syscall_table.c file, which does:

#define __SYSCALL(nr, call) [nr] =3D (call),
#define __SYSCALL_WITH_COMPAT(nr, native, compat)        __SYSCALL(nr, n=
ative)

#define sys_clone3 __sys_clone3

void *sys_call_table[__NR_syscalls] =3D {
        [0 ... __NR_syscalls-1] =3D sys_ni_syscall,
#include <asm/syscall_table_32.h>
};

This could just completely avoid having two entries for clone3.

     Arnd
