Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7064E377AB9;
	Fri, 24 Jul 2026 20:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784923778; cv=none; b=NcZPMP+u2ODuteNF4RMOpIy6HljLVikn9C9UxVnlQ/ylEYgqlQkemA+cXa/91yIvvOWhcw1x6vRsSduzmiaVYAhPPlAe1cWqfAw2XtnWrC0JyDxpd90iPC+gLwHKkBSWcxMM4CmjEh4R516DrtSb6L5IqEt6wAkFx7xN/rapLtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784923778; c=relaxed/simple;
	bh=xGUap47vDPyOzGIiwQbtJhPm46Qu52WofeMUY1dNB5s=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=tBkNOUPv8UK5Ek63r0gbaqZ6mg7JXYl8yzBmMG8q1JaWKrNlK3/8TL78Aq626YFPLepxGsi5ElBG1xxmafFDZmAJhV5tLpKIIQDpIZ3E3g57XH3Tm+5dZgSs/spuIbXzMiWdC+LWwjef3Xr27ussTMkBWgeWQJ/qtvn+fL9ucD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=A4oVMbrE; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AFucMXfh; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="A4oVMbrE";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AFucMXfh"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8CE9714000A7;
	Fri, 24 Jul 2026 16:09:35 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Fri, 24 Jul 2026 16:09:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1784923775;
	 x=1785010175; bh=rw3u2ylz3QgHwmqpV5ep8DhCbsINe8W+IzNU33xk2i0=; b=
	A4oVMbrE9Z80XPfXX/Z56XBF1drME9UV6q+zmM9SpMiOSrBoHmYCQIU99mprpc1G
	+B7vMvaDFKD0p4q3HXMSIzHjYcEm9aTXnhLxYOIR459DHpVUqjLy1hc4XfZxevly
	VRRfCo5nWVS4JMBQoNjWXvcaOIxj/wMTTRcc/MQQFJsDgsLn93Nugdh5VA2pDM3I
	GQ1f8jzL5aORLOAfSDJlpCN8H5i6a/Mx2allIJUIHO4pcooHUfbM/de21jOFITTR
	Cj2wuIR/nsz9tMkc1VLm9FqvcGlJlPfzi90aBpBBrFjFyhRR8Gruuc81riwOjfZe
	1L3+oRPTzRESz+Sh0iQFxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784923775; x=
	1785010175; bh=rw3u2ylz3QgHwmqpV5ep8DhCbsINe8W+IzNU33xk2i0=; b=A
	FucMXfhca46KpFHByOrZAOdlaXT5uaFP7FKaCbChiqSYjpC/l9TTh8+vLOz6hRqP
	RATHSvqIPmR5GiytFAgHM9w8qJ2eVAazAR8VWXi0XVcXk9MNAmv3S/Y5qZV5VuGF
	eYagZAbXZTdVxvCRzgxeynnD39J9vxHEgr23xhFgIqnDQRwQ8D5t3/ZDXEBSbQkm
	lcDL+9Vxp3RN2P715XkqMleV4jPnWdPXfMhteKVP85vYwBF3ZVExM/qG5tiPLeQ5
	s2Uh7if7yakI3/tbqAFIzUL7N8s8cqRKnLLikcvGS22UZAJQbc0zPVozStbNfQSF
	9wte18/8Qznd00GketU3w==
X-ME-Sender: <xms:fsZjapDaCmEDrsSlvh2CqAb5T_Ev2AmC-eg9X6E8DsV_QLGyL8CBxg>
    <xme:fsZjaiVDS0qXu4m_Y9lk4_IdRc-oKLnZxu1nJYD0UqOD9YKyz0IGJIG3XW54Sv5UU
    pAIDowjv68YJefs1FtiPWRwsMNRmsD6B4EE5XaNncPW3_YI_zxp_IY>
X-ME-Proxy-Cause: dmFkZTGpjDdrWXRvB/ncNBGXPPAvNs8M5DXfJmRz5zLT4rDuGtEhKVeTfAjQ+hrpZokBBa
    QFsdBKuzP+fC8eLhL+Ajw0v/aWxElwdNSQCQkLIEjjCI4F33TEtHAyasV9aEV5G3OsH2p9
    OL4Am1vdedA6TgTC0AXRqQMD4Yv+dicyticP/wRgiUE7kXlB3TBTf9T79p+amgLLC92qvZ
    EXnZeyF/G+1yiVZaEQLu6NXCeJ4j2hTv9BY24hIZjTINjLKlO1xbiSU7WKnLGXct7+ohD1
    HLknqerghLd6GZuf9NCf6s7WMlqAM0i7n30UyhVJqZzB8rR5h/gu/XDF0btfAHw+XYg+m8
    OVXggDIxJju7zkfoKgvHaM6eROI59x07Xt9s92CjKTK7DFZWcrNrUYamlyITNqeIcSq41g
    WPMhnwiwLTHgpSmIQwSG/zFxq8YLchGIxhMOjKyVhn7a26Y1ej99uW7gH1T0WS6Z7QwTqn
    LGClw4Ut57gdqnu1+oaYLu4uc6Vj+dXVcIDdDsVNSEmduGXuvZ0hxBvFljYmXjXMwI+NzG
    qoPgKvzhR+tx8RiRzPB/q0bHvJom9jp5WsS/tM5cq4H+x6lHwNykuMUpIhOT3+pzdP4A77
    OAgZP9qlgv2WynL0mpV+y7e0+i0XaIj8QdIrdaifxCcsxsjnTReIMzZXBq1Q
X-ME-Proxy: <xmx:fsZjasnDvs6_6myHwYnXUZmBf9SIwD8hZMZmxHCByoMlBM5Mr1MmCg>
    <xmx:fsZjakAD3vj7A2NPIMoNPqsvnDxCNQP9yyi1RIYOMsIrCzS_Iweluw>
    <xmx:fsZjamOk7XV1xJj_UdVO5t6V1fAAQh2Gz-iznXSxs5Z1kL3kQuEj2w>
    <xmx:fsZjajN2nH8Lwd2v-aik8jMwLSWJf1UO4Kq7EE6MorI2Eyuq0HU6tg>
    <xmx:f8ZjauXQLna0smge_jkeASZvBjtmwE5gCa-GsAsM3pxASpbx70QX3U2v>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7DD5B182007E; Fri, 24 Jul 2026 16:09:34 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AEcurKPZ2CIZ
Date: Fri, 24 Jul 2026 22:09:14 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, "Nathan Chancellor" <nathan@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 kernel-dev@igalia.com
Message-Id: <3a481359-72d0-4c58-8a63-b6d941a22482@app.fastmail.com>
In-Reply-To: <20260724-tonyk-syscall_table-v1-1-9c53188423da@igalia.com>
References: <20260724-tonyk-syscall_table-v1-0-9c53188423da@igalia.com>
 <20260724-tonyk-syscall_table-v1-1-9c53188423da@igalia.com>
Subject: Re: [PATCH RFC 1/4] syscalls: Create unified partial table for all archs
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2026, at 22:00, Andr=C3=A9 Almeida wrote:
> To take advantage of the subset of syscall numbers that are guaranteed=
 to
> be shared, create a new table and adapt generation scripts to use it. =
In
> that way, every new syscall can be added to a single file.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>

Thanks a lot for working on this, I had planned to do this myself
for a while but had never quite gotten around to finish it.

> +#
> +# syscall numbers shared by architectures
> +
> +442	common	mount_setattr			sys_mount_setattr
> +443	common	quotactl_fd			sys_quotactl_fd
> +444	common	landlock_create_ruleset		sys_landlock_create_ruleset
> +445	common	landlock_add_rule		sys_landlock_add_rule

It should really be anything starting at 403, not just 442 and higher.

There are some trivial differences that have crept in over time,
but we should be able to work around those.

> index 22e34cd46b9b..77934a2d0f51 100755
> --- a/scripts/syscallhdr.sh
> +++ b/scripts/syscallhdr.sh
> @@ -26,6 +26,7 @@ usage() {
>  	echo >&2 "  --emit-nr          Emit the macro of the number of=20
> syscalls (__NR_syscalls)"
>  	echo >&2 "  --offset OFFSET    The offset of syscall numbers"
>  	echo >&2 "  --prefix PREFIX    The prefix to the macro like=20
> __NR_<PREFIX><NAME>"
> +	echo >&2 "  --common-tbl       Use the common number table"
>  	exit 1

Ideally we shouldn't even need this bit either, though it may
help for the transition phase.

     Arnd
