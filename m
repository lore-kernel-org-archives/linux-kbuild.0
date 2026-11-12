Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492393;
	b=0yZ3POLIoHwct+ySu3HhFvy7PleFeRYf+mrBeYBxvuiSThgIkMtpZsYiv+nIcc5z5UGe
	 gVfOYefaynlQdQNiwrfo4ZYMspCbAhpOO4LpaRbCyZTZ9N2qZkYYL5XmeRl2VSdc3EiR1
	 NpxQf5qu3kAiBfRIKDoh60cX3v8/2+8tit0KbUUv/agNdjEssuNhhc+Ero6gesk59rL4h
	 1EzLlI0wrkmzD0aztXEqrJu9aepLq+ZpyH1M6Tr5XYdCtrt10dlECArEh8VWug+uB1H+f
	 fZs4LiUTPxsk2ARcKpqpjBlYqiKk3yaqLZoxgI7JxyWinN3tRgY+jk9sl7N5TQG3WKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492393;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=/KkZMOTLKDJQcKnM7ovd2Dn2GxF4wr8aJ6Z+ZtRW5lE=;
	b=ZTXUiX0mn83TVDnJCmnnU7micvmbZyM4rsjBeQMUydoHOqhA+r9jw+oqtDNA1QscKX0E
	 9iBs5+HLMwM92HqQSXQQdE/BHf0AhJyp5BqfZRSu89GYUDTJOaBxR31E7f/a0y0uXwBRV
	 G3rw7Gx5D9yKWZ+G/AVdqFGigt57OKAnnW1dk/J0pqJZQhsm1ZPKNfJY5Gezd3qwb5mbR
	 FwRY2LoCrLhnxstgXwuxYf+vOIyHffFflfSmsKn9h52KABQmzzENPd8zoUw0l+9w95him
	 dVJsy+OVNMMSki7iWBHrGlwmhty/zHPAAu7JvmBZqjt68ENKDNvBw9zKacK3OsjiiEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=dbjy4+Z+;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=jsamXKKy;
	arc=none smtp.remote-ip=202.12.124.144
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E66560A2606
	for <linux-kbuild@vger.kernel.org>; Thu, 12 Nov 2026 14:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E66560A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=dbjy4+Z+;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=jsamXKKy
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id 887381D000C9
	for <linux-kbuild@vger.kernel.org>; Thu, 12 Nov 2026 09:06:32 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 12 Nov 2026 09:06:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794492386;
	 x=1794578786; bh=/KkZMOTLKDJQcKnM7ovd2Dn2GxF4wr8aJ6Z+ZtRW5lE=; b=
	dbjy4+Z+hJnfJusW9p8xSSYAEHXM0zVp+ypHcRANXar9+N2RjAIg+JldE6pUGthp
	Lvcf/Il+pN0sPVy+sxMeIf+JTov5CMU2K32yZ/91Q/G9C6rw2DxdJsg3dvCdYINe
	EZQIbjT5sgD6XZ2/0RlJvQdicjt3v/H97hdIRVlmLB+2Enpu2MAwsGFPpoSgHY3h
	U/KqHJ8Q4wyStF8q5qjnAquoxMKJSUP3plId0gsAywmBcuZe4QC2OjfVCtQlfWeg
	WckoId/GvVfsqcgNt0Mb9R3kAnXzNV4NdTHqP8PgOThH7Ok2u7Pv6iJwvu7KJGGs
	ynGZl9a+iBbiVcEBjx2Pgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794492386; x=
	1794578786; bh=/KkZMOTLKDJQcKnM7ovd2Dn2GxF4wr8aJ6Z+ZtRW5lE=; b=j
	samXKKyQcrlGQtGpvUpGp+oRp4ujEWwheRFlyTS2oKjFrvqZ3OJxT8zQVo2wtSLS
	y2z2lUqhHGGDXKE4iIcBBKaVCcF1lMPae/SfaTKgolpV5+DZeNIeL2EiEwsB5HLH
	YteQ+sMl05mL6Qa0MSed67pdWOcmw8DNNuVOC9XMWEuw/WAQuv+u6ukp0fxBH8GI
	3rD8uEkVbMZ/dnaUPE1rIBadBBBHId7UKltBuZT+ikbKxQcprio7MuSLVpk6vDRc
	Yj9DsT4AwO7GP+IqZsaBHdQHfxLsvMG77YBI021VzcHYu9yE7k4H9lqZPrHCcIyS
	Ymo++NmJ9mCgfJnKZjwwg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794492386; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtidWlsZEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:ZwBZ9a9oaZs/DpeOLUmd+V/hyOjGdOl6QC359g+wLMs2vgU
	IJ0QLA2OvHntX1zcnK/CE1voFBsmnB13gWamuSK0BKGbjsAtAuYPMoA7pdnAlIOU
	vWE9pXONo9CejQA9RjlhUMMEmwASyjpXud78ej3P4p1MZZyJwHPUx23wODrQ3PKd
	eVV76Z6kbvLik7yrxJXf9cf9yiTajtyuqtEcbKiXxlilcCEOrI4v1IJrXUxDK8Hr
	wsJBW0b4xPMiITkz/+t4qu3REfd9W/yA4AkI05wkHsWPmZDN85Cle6DrQVTtgT9P
	gZo/57YG87tJKfo6Pq6x2M+Fv5ZAqOLFPuigkeg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:TDEx+2XEDPCwv4i3FL9YSLCi5D8dWp2o3/cQgDiP8ns=:JHxY1gVMr5Yna58r7UfKvy6gRlQIWiwsrWDbIJI7G2c=;
X-ME-Sender: <xms:38f1ap_rJ_jsCsMQ41MAW2hQ3TzEVmEcFUvryDJReN1fekLFDTRq9g>
    <xme:38f1aogA03r26N-KGCidodJks_jV2i2QBQITe8K6lqxYzUtCzOaUbofdiK9mgnl9w
    4ZSp7imGgtUt91NUthq-qz5A_onLXGmHwQOGqHgoeFbSVisrMxAOq7c>
X-ME-Proxy-Cause: dmFkZTGPYkBCc9nvzgnh9CGa6gZKRI+IcEF1fg2G7Wyq7UzVQeV6zNhlYgHQfreqw2bxe9
    xQstIULovF3CK4uhQpR8cEZz7AA0ChTcc22sELOJwvqNoYuolmsRFj0T0BBjeZiEwJOfuC
    8YQUZSg/a2Pp3PAfG0BJ1TzmC3yOR/962VxYr9uTD3HHZcQj7wOtSY5EZ9rz/FmieEs2pt
    ukVFgDGlkLdaPqPT+/JFhrt3WarMufiyGKdUxGynEAYbzdq/V972kexsOQnXXscwtAYcd8
    d+KOCpTn2YnKI3/alMszUky1iaLkLaklciJetmtygaZapBAqTDBO66YloxtQj3IKN6cSTA
    MAGBcSvHE8mQzLvD1RdfnfYWV44W4zZqHFWnK46VkpMPCkZtCvdy1JS+zAdg6ODYWBgKsD
    G8sSlbHqlM7hd4t9mTGAxa1B+jPcF0JHXlo4G4Ns5UrWM79As6MJBBbDQ9pzNL5wmKmp89
    HsTHn1gVjydVG6zngECVmN2OdrumnMCfS/7D+j5FlgpCnRuWsk1vNcaAv2ujcn89BUVEfq
    aLFNbpWVHAZQkgKGXB3cfnG5iKu8XvVRhSk8NbFtdT58W6T/GXeZegPtC8Q5A4B0/fsRCc
    JckAnzZnlsR81jRCGZDPK88pufnNmWTUXHHxN6EbStsauEOutjojfgYf/PJw
X-ME-Proxy: <xmx:4cf1alh_NXAllw19P2oRA6fO455cK5nUCq3vAi2OiZ7imJsGjryqrw>
    <xmx:4cf1aqe7-r9GX8R86cK8PdYqUuBHWMw1K7V0irj7LBNAkhvArEZsOw>
    <xmx:4cf1ak1gMTN2vGrJp-SfOWzM_3j-zFtVjwOA2HoRHWTsnOzc4VECqA>
    <xmx:4cf1amr-GAxp0EUs_TeKwqgOPFj_tHkZmUeu7dDGJJqE9zrC2m2dMg>
    <xmx:4sf1agKKrF8Afl_meq1aS-zdAZZTmLJ8mGoP55xmG21a__LtfRPA2OIF>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 0959B32A0099; Thu, 12 Nov 2026 09:06:23 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AgHRK7OsiQZc
Date: Thu, 12 Nov 2026 15:05:52 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 "Masami Hiramatsu" <mhiramat@kernel.org>
Cc: "Christian Brauner" <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, kernel-dev@igalia.com,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 linux-alpha@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org
Message-Id: <e993ddca-9e64-4a78-adf5-a105dd5d6254@app.fastmail.com>
In-Reply-To: <20261105-tonyk-syscall_table-v9-2-8d1275885d9c@igalia.com>
References: <20261105-tonyk-syscall_table-v9-0-8d1275885d9c@igalia.com>
 <20261105-tonyk-syscall_table-v9-2-8d1275885d9c@igalia.com>
Subject: Re: [PATCH v9 02/15] syscalls: Create unified partial table for all archs
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026, at 21:05, Andr=C3=A9 Almeida wrote:
> To take advantage of the subset of syscall numbers that are guaranteed=
 to
> be shared, create a new table and adapt generation scripts to use it. =
In
> that way, every new syscall can be added to a single file.
>
> Create special ABIs in order to make the table work for different arch=
s:
>
>  - `clone3` for archs that use the common clone3 entry
>  - `__clone3` for archs that use their own special entry point
>
> Create flags for syscall Makefiles to use the common table.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---

Acked-by: Arnd Bergmann <arnd@arndb.de>
