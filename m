Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC74D44A739;
	Wed, 12 Aug 2026 13:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786540306; cv=none; b=W5BBhuKBeesh66HVgWdWCC1MPWNYVdsUzb70A6XpRBujlnBG8uoCjLHAZNpcZdFodz6gEmGcWdhd/eRqseKaF1mOpcemG8eorT4wGOiRKy7lR7DSVYL1pItLHDSNhz4RvszBK/HjYu07co1NF3iWbxbYP2QiKyWJbw909usZ69A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786540306; c=relaxed/simple;
	bh=sfQS5gslEU6tPTW8YNW1AHSOwUshkfXz5dhOm/TjQSE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=LtE/gUEJLPxvhtceluEfa1zxA8SUZvn9m15jV+LZwBzrq1374C72L08JO0Dsa6LcWR31XBTWjg5V/tIx1tgPgEk3NZrSdRYG76PEB/6VnXtjLBAxaKhWt1diQbL7QaUC/O+HJlcCj9Uzc9FUMSCp8TdxCnLcAZy0Qa0BRt5SBss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=aLEwnblD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=D98E1eOv; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="aLEwnblD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="D98E1eOv"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id EDEFA7A00BF;
	Wed, 12 Aug 2026 09:11:42 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 12 Aug 2026 09:11:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786540302;
	 x=1786626702; bh=ZLGCd2gr8HOn9q1y+UdWoupKFx4Pg0SrsCBfr+Quv5Y=; b=
	aLEwnblD+tUMf7uuYRqdsKrupeA7Wppf67BVRqkbjwCBrJzrVatJ8RckK0IX9qVR
	3ReLkfNmOE0wkxvPFyvcmnLvSWKQ+jvk9H0jfSqwoQqudp3QPR3TW6iuWxnwqSKJ
	YnU0t0U4Q4fM8HRImmR5L4SR8n1EKVjkwxArblziR8X1TJ93vDPLqPurN68wOXoP
	xnpuVYfD3RKK4P7u7/TMTjADwfEBlZkwXSYPEvsCIZWaUw/2G59oN8aQiiLHT2mi
	cJuCSmCB2QJsYtA+drLV8xvQSsoyPBN3ofyEd52gapGfsr/ASrZONN5m4d8FvrXL
	WoF7SLOUq8PZr4hVzMKuXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786540302; x=
	1786626702; bh=ZLGCd2gr8HOn9q1y+UdWoupKFx4Pg0SrsCBfr+Quv5Y=; b=D
	98E1eOv9jO6Oi+S+hPAYQr76Edj3wmnFTEVeSf2g3sIRU6Kos5vfK8/f/IvwEOir
	pWMgBGHP0Tch33i1IykGjPv6J+EJJk3NHCBehhFdd3P9U/DmMthwamSdsjvgAYwN
	BD3auwzg2oFndy8tZjccLH34TbSBNSoAZrcyDydobLnhiB+u7/LdegD3wfNQ7Y7s
	c1JEBq4IOTUR6GaluBBa8LddztnUnxA+hSTB7t67V7LV2HwU7rsCI0GbxwTRUzER
	CQAFYtLMQYmFruPruL76zb3HW8vJhhbZBexEOThrQXNGm7NxM8rfrcCU7SZ3dv30
	BSSgfX2IYZWg3mrnxoOaQ==
X-ME-Sender: <xms:CXF8aj6kSsd84YjRe7DPAAn1mzWvsGQCkO5EikdDXgfJcsgmsYNaOw>
    <xme:CXF8ajt2DvPEsIAcIOXkluTKv1gHgzLAAeLKcHLqmcS1u_asAcrIgU3tu8Wrcbnml
    E5CsUG8525Ka0hvEqQDcayLoxaUCYNboY4V5H7CvU-Vd5QXol8E2EI0>
X-ME-Proxy-Cause: dmFkZTF2NisTD4KgfId49ZhP8YR6zIBtyLoxTXPbE8xHk50wFND1B1qb1AFb2YfKxb5e9T
    gQ8h6FXH+RyKrlJ7R5oXmfvrQdi9BxaS1bt7OYXMtqjUTmhB1yVp8ko55SDYy6KQIv28ZN
    ongElVbXeUtN/f96E8qerh37kggwSDKyoelbAFbYdV87rv8ayz5TwZAHsvfqDfW4zY6wIs
    y6FZ0NuW+9g7qWMhGNzSyYSn60NYBH6oBWwpMncRKoaUUYSi3udH327oMLbuMHB7d7oeKl
    qj4FwEw9fiY7lQH5M0MSckWtwx5ooORjz8okQNnpAjTrK9KyUVxPtR8HUDy7QoSuAbsoFz
    e3wbyfuaqFaQqXL0w7DEOyAxOKT2TcCQDojreEmXm02SljDvSLNk1JvGX70W3onnZPwk3Y
    KeKPyFm1kydYnzrOrS5y2Ii5sxD3xnfqdTptP8QMCwXO5nisq432a/taU0n8Sc5vIqdewC
    A6Ua4e8Qa8xXrQxaNbUx9KhMplpwG446MJIU3Ar5JvoTgzRpQOCz5b5k8dMrH9JjCr8fnn
    oRmeOq9PBcLmm7Ib7irNcdPPtEELJRpAhBwWw+vFQnRorK0ls3BmE6d3CYXVVMUNrzfgJB
    eh9cRsiRIlPzomk+Um6N5X9HyWGoLnMQiFVinASwfYmjVsjgAQyB425dkBmQ
X-ME-Proxy: <xmx:C3F8airZy1_UJujqt-27bH8PmkPOfguQbJ8Z1wXu7xzvzoznBkDzEQ>
    <xmx:C3F8ajMTU8DXIa7WrAUWT3B6T99naqCHZqm_IIWwlKV10qPkuoATCA>
    <xmx:C3F8aq3TwPqwVEDM69oL5x5Ll9eARavOHxJ5x-QS6Rje7_sOhsOcBg>
    <xmx:C3F8aiBEUDmwUY6X1yPwhAwcgDy_yM0K4Hkr42-LSLIXnNt1EUK0MA>
    <xmx:DnF8atragDX2okznt2TrxrTqYgysNWHnULEvBTuf9FsxoTTGW7ab0lMF>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 5E16832A0071; Wed, 12 Aug 2026 09:11:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A8cq6fax0o8Z
Date: Wed, 12 Aug 2026 15:11:06 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: linux-kernel@vger.kernel.org, "Masami Hiramatsu" <mhiramat@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
 linux-kbuild@vger.kernel.org, kernel-dev@igalia.com,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Message-Id: <a1d0c110-d23a-418e-9155-23b13b590445@app.fastmail.com>
In-Reply-To: <b1d599ef-bdf2-43e4-9746-4fc8d8f1e817@igalia.com>
References: <20260812-tonyk-syscall_table-v4-0-748d0229ad40@igalia.com>
 <20260812-tonyk-syscall_table-v4-8-748d0229ad40@igalia.com>
 <ca0326a0-ce13-4bfc-b36c-5612d73335fa@app.fastmail.com>
 <b1d599ef-bdf2-43e4-9746-4fc8d8f1e817@igalia.com>
Subject: Re: [PATCH v4 08/12] mips: Get rid of custom mips ABIs for syscall tables
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026, at 14:53, Andr=C3=A9 Almeida wrote:
> Em 12/08/2026 06:16, Arnd Bergmann escreveu:
>> On Wed, Aug 12, 2026, at 05:33, Andr=C3=A9 Almeida wrote:
>> I had expected you to use 'common' instead of '32' and '64' here. Sin=
ce you
>> did not combine the n32/n64 tables, this makes no practical differenc=
e,
>> but it still makes the tables look different from all the other ones,=
 and
>> it means that the following patch to unify the tables is harder to
>> validate since the inputs are still not line-identical.
>>=20
>> Is there some reason you went with this approach?
>>=20
> Ops, no good reason here, it was a mistake :) I will redo it to use=20
> common from [1, 211] syscalls.=20

I can see this done in one of two ways:

a) make everything in the mips specific files 'common' and keep the
   three separate files
b) make only the first 211 syscalls in n32/n64 common, using compat
   entries where those differ, then use 32/64 as the ABI for the
   ones where the numbers went out of sync, and merge the two
   files into one.

I've added Thomas Bogend=C3=B6rfer to Cc, he may have an opinion one
way or the other.

> What about o32? Should I kept it as o32, giving that it doesn't make
> much difference?

I would make all of o32 'common' either way, for consistency with
the other architectures.

     Arnd
