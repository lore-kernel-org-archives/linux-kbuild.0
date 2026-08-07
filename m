Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AB4390CA3;
	Fri,  7 Aug 2026 20:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786135279; cv=none; b=S0kuWGAromuNKtpzuq8JbSfYu59usW9yhRSUpjtWDKbp4pOp5Oa3DOj0maGs+FoYcaDZNrRFkBlK0sodYZ5JZUGup/Y1Oto+e/E43oWqK2oLMg3dYYGniqH4yuvF9bjD9odTzFvGS2JQXjdPzDKsj/yEaE4zpFEzE+OIbdIQoXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786135279; c=relaxed/simple;
	bh=NnartyaZ7ceia49SEkv4G/Dj6KYs/XZgervUUrTQ0EA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Il6CnJWi2LiMXSfmrzSxQ8ywj/cDVI2GTI8g5xAG2nLB681+5HXW5mr9UWuZmjiMSudtTIVrpYi3YOEGnUl3nG4ElHo1qDx1pb+1RFDPB9XyTBNPjd8sw/9aajQ/odaJpFoO8MvyUuo1pXquvsQXgU82okxICszZy4AwTYSQ8O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Yfi8JOMC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fZCZ9M/8; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Yfi8JOMC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fZCZ9M/8"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id 0C0A21D000AC;
	Fri,  7 Aug 2026 16:41:15 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Fri, 07 Aug 2026 16:41:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786135275;
	 x=1786221675; bh=GOhCCnK0cIDdn8QJuIBEBehpxloePDDBXCiYgRxKjQc=; b=
	Yfi8JOMC9qV7KVVJffSMy4yyOP+X7hjELMNS1EtNSKAtDxz5YuO1GowAGbJKLoIo
	0SLvEY2Gom3k3T6oRYESWm4Z0LuzyZxqAgQIpLQ3s50nMmfAWG09BR9gWX+krfzz
	kzry7hZBxEmeU7QJDibElhgYbPtSVs2NUWkvMfmMLBcRFhrqodTbLOPR8LXw/6h9
	SOmjPTQMwPXG8vfLEIT3h6SOVnrHpu9eCs3UilOWMhLwEgHNWxtsLRo2UUdYVhyA
	Gg0h4Y0sJeHwzadoSv0qSn1nEItQTZUkkZELQ4rHNpH/3D4fbBTjvQN9VOfRqtwc
	gBKRf5DrBbkzf00hjhBmng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786135275; x=
	1786221675; bh=GOhCCnK0cIDdn8QJuIBEBehpxloePDDBXCiYgRxKjQc=; b=f
	ZCZ9M/85XQsZdQPbQfBxnyP7abCvMZBlOVd8N7WSbnTb2QSNHZGMxbQh0FWa0nBg
	RDdtcQ/zjnlb2kbMpeN5FoCGdr8zEV3P+kl7NCkwogeAXGTZx6Wbe/d8SvhVdKyr
	hVjCG9thiAiSUEggrFQisq9CzG/BW6ZwQfDDFOPT1EpIc8jd/7vCYNmqEWRuoiue
	mMSWNE/RDhCg/iyGQToSI7X9DCW/TlsBpNpbDEH9vt67bXqvHMv61wyoO/NqF1WZ
	PrmtxIP60ZT2daNFMhbmQHToBlnpWUJ/fDCFCoeaxrZ6ZiRux/wBkI/pWwh689Xb
	0oziEZlDxTKTA9QDmPLMA==
X-ME-Sender: <xms:50J2aqOK0Mv3VCIDl58YCbkFyNZu3yW7rsCRsrZG5HHJoO8ap-o7-w>
    <xme:50J2ajxNLCiCuw2t4A5kiQiAMur7QakOwGPzDMLrCOHG3UdEDsgHGFMC7mEziOFu3
    BSig5w_OP8fE3LKPRiR42dgrENHFP7FiUrBtia-xppQDarOhqinono>
X-ME-Proxy-Cause: dmFkZTEXNyXWEATFGgz6BhZSRTr94ryKg0MjOr36388heP8jAuvelj7ouVmNANbYdQY76Q
    yeVRiIOj/InoBNLYQOSLq5rD1NzpLzJjslD9OSaMa4saRd+r7ulZJE6Au0TXCqsIYQpkWp
    lct4+N+EpX4j3lJomVysOnb26PhVc03sAFapBeuO2/SKKt1dvWFBlJvhJkVyXlN5kVj/lM
    vgSO1uj1BgXl8HHTrIZJKeYwph1vJFEy/dCFhZZwirjxpsPsGqUOmGZNAR8JaYD6xK62WM
    pSAYfju2w4gvMzlyDcNT30PFNfvofbVeTBS+Km0EuRuOLh1Z5wLGVSLx95+GSxry979rUw
    03M+AhoWKvTqcnnlbhhLP22ZuKUFO9zzRc/7bzWpKpO4ExJv4qeHcXktUbcqlQChcdmM14
    DjKZVY/2rhUdNSh1Dm2ztG4Qds7iEK2a2GMZOr8Gyf65xzc3NpBk667XFAGxnB5sysI8Zk
    FqbENkM0H3sVkFhMd1g0Fc5skhC+XPgcuW8NsR5k7rUc4Y/kzO865p18n1LGB/cVprIiCy
    +/IWpmTRE3BygdY2RSIAg4ob+XtIU3GEPO+Eln0IckygyJzVxo+QzNhnbigiEsADOLzILd
    SMnqCeOavWyz+ZeibWtU6uHZLlFXFK1NiDcw7MsCzxJtxSd/0v7EhnWu2K4Q
X-ME-Proxy: <xmx:6EJ2aj2px8oAwKYfVP-I7Q8o_zVEUpGAXbL1PwWA6pMhZLRwrNxGsQ>
    <xmx:6EJ2asI8mfXiC4mAROSqcRYGv5Iu7uzbVe1gFLDXRI061T6JyOc6FA>
    <xmx:6EJ2ajyGh_HcjQCz9tp28VrkFdqy1XI54iF07bCYddtpOCT3NBWPqQ>
    <xmx:6EJ2aqUKB-8qLjczEPoQk4DPiIZr8B6XTBvaPbFOgHuZeuj3sfbGBQ>
    <xmx:60J2apFBygjpM5I-jkZfIhlvQSOuQlD6_iWMLSmvmAWgq7iJoAqSTFL2>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id F00D132A0065; Fri,  7 Aug 2026 16:41:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Aq3x9tlyO1VR
Date: Fri, 07 Aug 2026 22:40:50 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 "Thomas Gleixner" <tglx@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>,
 "Masami Hiramatsu" <mhiramat@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 kernel-dev@igalia.com
Message-Id: <fc9361d7-2505-4ec7-9d47-966b4f5a9fc2@app.fastmail.com>
In-Reply-To: <20260807-tonyk-syscall_table-v3-2-7c45a23c50b5@igalia.com>
References: <20260807-tonyk-syscall_table-v3-0-7c45a23c50b5@igalia.com>
 <20260807-tonyk-syscall_table-v3-2-7c45a23c50b5@igalia.com>
Subject: Re: [PATCH RFC v3 2/8] syscalls: Create unified partial table for all archs
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026, at 21:34, Andr=C3=A9 Almeida wrote:
> To take advantage of the subset of syscall numbers that are guaranteed=
 to
> be shared, create a new table and adapt generation scripts to use it. =
In
> that way, every new syscall can be added to a single file.
>
> Create special ABIs in order to make the table work for different arch=
s:
>
>  - `memfd_secret` for archs that implements it

This was already there, so it's not really a new addition. We could
also avoid this entirely and just rely on the stub implementation
from kernel/sys_ni.c for those architectures that don't need it.
They still get the macro definition, but it should be fine to define
that for everyone.

>  - `cln3` for archs that use the common clone3 entry
>  - `__cln3` for archs that use their own special entry point

I guess that's one way to do it. I would probably use the full
clone3/__clone3 name here for consistency.

> Some archs only care about the native entry point and have no compat, =
so
> create a option to never generate __SYSCALL_WITH_COMPAT() and always
> generate __SYSCALL().

I don't see the purpose of this and would prefer to not add that
extra option if the scripts works fine without it.

>  usage() {
> -	echo >&2 "usage: $0 [--abis ABIS] [--emit-nr] [--offset OFFSET]=20
> [--prefix PREFIX] INFILE OUTFILE" >&2
> +	echo >&2 "usage: $0 [--abis ABIS] [--emit-nr] [--offset OFFSET]=20
> [--prefix PREFIX] [--common-tbl] INFILE OUTFILE" >&2

This needs to be changed to include the argument of common-tbl

> diff --git a/scripts/syscalltbl.sh b/scripts/syscalltbl.sh
> index c4b1f85c2dd6..c0fd6af2d892 100755
> --- a/scripts/syscalltbl.sh
> +++ b/scripts/syscalltbl.sh
> @@ -16,18 +16,23 @@
>  set -e
>=20
>  usage() {
> -	echo >&2 "usage: $0 [--abis ABIS] INFILE OUTFILE" >&2
> +	echo >&2 "usage: $0 [--abis ABIS] [--common-tbl] [--no-compat] INFIL=
E=20

same here

     Arnd
