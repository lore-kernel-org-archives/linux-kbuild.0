Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E143E316C;
	Mon, 10 Aug 2026 14:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786371816; cv=none; b=rUbV/pi8TrC333AY2oWKF/bA1/pGUsLR9cQsTV8ISft4Mk1DWTe31skDZNymJxrchHNE/6L5A32YqD8L2ClKV/1du+vgqx3zHrlLPEn6fY4CU6rS/sJHqc+SKFYrfMyT11U+eYByzmB15VRPQDZkcYbeNB6NNUDgNHvFxiDR3Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786371816; c=relaxed/simple;
	bh=9jNxGlXallHAdyL9sjZpIow6/2sSIuEbXpQOx0hWBek=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=GTYrHO3uzcSW6b2jOu2ginbqgkZn1rw5vGi+ayCLGefzLd0vZYPSUHTjj3PERgtGc17B4myG/2/LJsRp7jg2JoXg+wfK2TnhqZes7WT952kqTp3nq6BB3xQY3SN7WevJDGSYxDNFYHhbElAW8dCRedqO4/rceezZ3MVQMEsn3YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Sf5LQk42; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZuY1Jp6+; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Sf5LQk42";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZuY1Jp6+"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 3CF4514000DD;
	Mon, 10 Aug 2026 10:23:33 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 10 Aug 2026 10:23:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786371812;
	 x=1786458212; bh=01aWyB0jO+hirf4mpVEx6ve0TtGZ5raTV9mAo/SKW8I=; b=
	Sf5LQk42X/q42nG7BnEsJB3oUURfU3Yrdwm6//0HQzC8XmeBUwYlxjD8QQD26hjL
	YFwYHtqLb/NENAm/6nqSV8018x09SVSEtujuggrBp7NXIMHr8RdfoAWFe8BEpVt2
	L6X21emS0SYm7KjVPuRyjU7PAGkTxCmvICJS5T6ohHJJpit5ruBqTwgZX0qkjDHG
	D9iSVwossxsLuNFbcCH9S+smWam0YCL/3W4TiMbnb7OHadXY0/qqBzwWacrSKa+O
	Imj/WfGucOiPRCnfNU1GF2SCRiLj+/1o9oVEQE8mIlrp0GIgJ7Ha0Owsz7uk3Ftd
	mabgFcUiKvgsijEHWkGLTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786371812; x=
	1786458212; bh=01aWyB0jO+hirf4mpVEx6ve0TtGZ5raTV9mAo/SKW8I=; b=Z
	uY1Jp6+9BJs/h82f7IVwQgDY7Rmz2Bf+sLuXv8uO5bRdCX0RtrqIfFnSDUHQpIwG
	2aOhcG3PtASv6PvQ68B2Xkpu1QICLk8Drgn2q9ev1J8kDVYynq233YLJgePiRvrZ
	pe+JZM/WINqcvi9BKYfOKIbaS3BT7PVG1bFGep/FelPJiBaj94ivkcTCk9qbc1xT
	871BTQr2tW19Zq30aBehJiHDur/LEO4D6lfmS37R+Kb+TiJyqH+b9U25EVhv4aH2
	99kjPC2lipIwbccMBiH7qt4ixRR9Zwh5QCFiWgJdVqf+YgqiwhfWwa7cHbKd701V
	Qz2+2FMMJZme2iDcl6dMA==
X-ME-Sender: <xms:4N55atfPVErxwJAoWwBm4Tc4Q_V8yLOAK0H2E4gsJCpe0nGp2lMa-Q>
    <xme:4N55amB8msDLHaSHy9TBpeIoC-vNXQjzys7unlYYM9F2Zxj-Ub1aASeIRl6ke5JoI
    zVFd2aggYckbxyPFLhYAFZnVvfzbbvLQi3k5Qy1ICVKBzelcEwEl_v8>
X-ME-Proxy-Cause: dmFkZTGu9DP5HWBOipFngztFbWST67medsxWAfQZS3v94VTt9XfObrU4aI0izZKri29LrU
    auT6uHgQZjplYzA+X8AvnisWNe+fRdd+5Z9C6w09I+Nwvcm5WC2UxzEZ6hc4ChVz5Xe0Lk
    1QKhYmzJtrvA8JVwrygv3fOmv8NtRD0351ajohwzIjpb69nBZ7B4KvILyF4eQk0O2M9q0b
    eHhshtaD/9RL6s4L055hfZpufjA+I2TtSt8VBXXzdtw/oyzK8UQDdyRqsvc1R+9aCxlsf7
    21D+r31FtofR4uOt4D3fAKR7QmAUH9jfXOt/cUcRmwCSO1uVOEeFVjHynLiXQftaTMLsWH
    B/FNkAY3Urk0qsN4ius6XEGLf3zysZ08wAddKgh4XB71LIEauShVTDvRxLNZkMhBBavka5
    rQ864Kpb1qQYyFw+ZUlbKafAwk85VthnrTvTwdIhPNv6n7GMoFlGIVhTTm1R6N01QbXIOB
    Tv683Ocl5QsVegdeoWDDGN+DmU60NGZ15QA+L0gl2k2H+CdesChLLITgSEVrZxqVZzUt6n
    DosXNUTcJ/M/3tipKRk3KSU3YfHycmjR4JDELvDJ2dAiiH78Qd4PB2bpznytxm6kjvENPK
    4oVmy1PR/+bartb2IndPNj3OswODb9viBAfLiMcMC/E85AeBOqeN9miC2s7g
X-ME-Proxy: <xmx:4t55anHNJBDrjrYIwtJoLCnVhYupi3ZAGdpcJDuZlKCQ3JEtBbbOjg>
    <xmx:4t55auZeuKTvkMHrUCfeMzu-4xkFPecHNDkR1KGp9-5wFNo-bS1LAg>
    <xmx:4t55apBnpSu5cGHhQQ3uxh9w_ocYdULLMFF9IXfowL0zgoORLJx7hQ>
    <xmx:4t55amlzoRflpj_RMG-Grbh7N3RayfKoNAtGO89ntmIq4HDSm2TEwA>
    <xmx:5N55agUEBsGYWAoLlk2g6TjWbOnH69guSc88agZcDm-RdWdNG7zLx05z>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id D3FF132A006C; Mon, 10 Aug 2026 10:23:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Aq3x9tlyO1VR
Date: Mon, 10 Aug 2026 16:22:48 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: linux-kernel@vger.kernel.org, "Masami Hiramatsu" <mhiramat@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
 linux-kbuild@vger.kernel.org, kernel-dev@igalia.com
Message-Id: <3ee5b6f6-8d71-4a01-bd50-3768ddb02b4a@app.fastmail.com>
In-Reply-To: <099046ab-ca4d-4a1e-97ad-e2fe05b9e81b@igalia.com>
References: <20260807-tonyk-syscall_table-v3-0-7c45a23c50b5@igalia.com>
 <20260807-tonyk-syscall_table-v3-2-7c45a23c50b5@igalia.com>
 <fc9361d7-2505-4ec7-9d47-966b4f5a9fc2@app.fastmail.com>
 <099046ab-ca4d-4a1e-97ad-e2fe05b9e81b@igalia.com>
Subject: Re: [PATCH RFC v3 2/8] syscalls: Create unified partial table for all archs
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026, at 15:19, Andr=C3=A9 Almeida wrote:
> Em 07/08/2026 17:40, Arnd Bergmann escreveu:
>>=20
>> I don't see the purpose of this and would prefer to not add that
>> extra option if the scripts works fine without it.
>>=20
>
> Some archs don't define __SYSCALL_WITH_COMPAT() (see x86_64 for=20
> instance), so that's why I have added this option. But I can define=20
> __SYSCALL_WITH_COMPAT() as SYSCALL(nr, native) for those archs.

Yes, I think that is the best solution here, yes. We certainly need
to use the compat version for .tbl files that only have one entry
but do use the compat ones (mips n32, arm64 aarch32), and using it
everywhere helps remove another special case here.

Side note: in the long run, I would hope we can remove those
intermediate macros entirely and just output a readable version
of the switch/case style top-level function that x86 generates
from the table.

      Arnd
