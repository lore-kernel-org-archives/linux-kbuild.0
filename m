Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793466188;
	b=Q02QiOUvrcqJSLahM/+cjje+kKN+n5PliArOILvA1xBjTYeR2tBWGaZSQtm9ynZMQMNo
	 IZ0d5emH8ugnHEEy3SkMSvImc9uedqKxZJimRV3EFNJpq1N3uLyHeaW8h25DMIP9kQlHP
	 LWUApswI2bmuUUvuXrs3ZaR/vwEnNa9xnK+zswebb6BaekOggIjuFmM7u8PuZ+AqiIbjd
	 CZYbzGP8gB6n1OdNY/w3JHAN1eu2Kus4d+GgStGSokcNxig0wYn7gq3WiSF3F4FdjC+ku
	 2TKsXTMpKC6pmdvpsAp7zIhYvGKQNpylqDSZZ8lHGqGACfqo6cyLjWgpvpX3BhyT/rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793466188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=gba0XFZ/wiG7mOW6sD/3lIcnTLkNzkhvuJnY/kVtgnw=;
	b=4Sz3uMyjc8Od9TtI7AdT5c40RBR9q4Ml0hHGO6NYYRSMTgrxttIAbGixcA/cIJSbfYnf
	 tifS0ua37zYz5jdUqNtCsIPtXo7FIYpacx2b+txfiX9abf52kyOtlGINVwxCmZo7oS7ed
	 Y8dk3bfoZ86rdVprLmb39wMvyXMnPanBMV7uEIdLWuBinFEMEnhw+dy8X1AZwZyE5l2Bj
	 x9gZK6iV0MFSAeBNIQq+3kLw2rFryDKENBS22AXxkRE8KO050QYFu6siMVVd9fJAzdWOd
	 V/FSv4XAZQZtt4Q3d1T5hlTxtsxrhA+ixkmp6/afXW13M65Fvdqz87cQT+WwSSqgjvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i8E3v5cp;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE246606A31E
	for <linux-kbuild@vger.kernel.org>; Sat, 31 Oct 2026 17:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE246606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i8E3v5cp
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a070755c8cso777950b3a.0
        for <linux-kbuild@vger.kernel.org>; Sat, 31 Oct 2026 10:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793466187; x=1794070987; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gba0XFZ/wiG7mOW6sD/3lIcnTLkNzkhvuJnY/kVtgnw=;
        b=i8E3v5cpMSfAi1mqqro21Q/8Raqh769HEWZJL46CwnM2v9wK2OLVzJsAuCSE9qf3zq
         tQY50fNwQDpf+SJSRQlAgqkCXH0WUUKhP57b7/iP77Uf3WNogA/laZGasAKdFWEz783R
         toarBNdQRNtB75h9qwyX3N4XLDJa/7DPVsqKt+7a6In8nxnIlpSFdU2WiAXEmjKaF5ks
         XnZGp+AauqkTqlVVZmUVXtl4Ag0HgI6GlxH75NYUPYnvp305gsOHdLStmb2NDkg/ihGG
         sRkldpqZ/xsViTVAvbYKqxtnovFp7bSCwKkO/qhbTEhCAOOAoI1dYAM/lSLdEuekL6SG
         SZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793466187; x=1794070987;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gba0XFZ/wiG7mOW6sD/3lIcnTLkNzkhvuJnY/kVtgnw=;
        b=2eTxhxTwQUQPfiyFHGhtpMRxAoxHxeYTh6EI91N9qLpUrAcoPNs43MKoZLN0TIHHfI
         5nJO7lW5Y3mJQ5BskbHjw+WSRwqrTTq5wE4Yg/9yDobWAftBesS/fvcRHIchP9mOXZ+W
         0PP5rMKAjPEzfKlvs2uYRuKctBIamAXmYML3gTdjPQxpU0jhsXI7xLfS3uvPcsZ57qFS
         S+ljcJgkbsiIOytUPpkWl4kQ36iphh978pMr/yvChisVQgumQ+75E1aFb0bA4ekk4Emv
         rT/UcaZt42BTM0vIfkuyPsqWfeXdOj3kDnLx2FGfyaWyhilWZ9SUwJ7yafeA08IpIHCd
         r/hQ==
X-Forwarded-Encrypted: i=1; AKwUvBx55NCMObTJFoLcAij8nMelr/VDEUmclae/3snNIbwtR8XeEqnkjCw49kZZyHE1VKxIlgojyPs8Mz/9gZM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKsUoyEjZ6yTFC3GaXkWeJp/QIW+Tdjb1xfBlrUbG72PC6e56K
	aVLG5rf7weQqCI8z/eFPesgKCLqX/DAhuVXMhjRo/a43Q6ps/sJLQU5M
X-Gm-Gg: AYBFou3NnrJIVmT7ZkkcgmoZfIEQNRig/OuTCKunknycQzRHBkBVvM37mx0RpqqdEWO
	Hk9VHXYqhMQCa8fnP9ZQHq7+lKCH/mS+jdhy0QvkeVAlKXb474k8AzXnmTSbmmH+Un3f/ahb/r5
	Yq0CdMSsVjzkAHpqBIk5s9hurN3lgnliHQOBM36XH2rjr1/Xv8MbbrgQRwl11BPWVjBPfhF0SWb
	/Sf8r001CzmeNKDtAlx+dL8RqOQ9DNvUKA+WCHT21bg2xWnr252E7fbrbF53MRImWRF3vICCLCR
	vTsHl95wE2hfK1E7+sHpWoHlnZPJqP9v1Wdgwyoic0chwZy+bto1wuQjqVpZdaQZ9suHrPAnqx0
	4+3SWd65aU6UiOd4xK+2cn9rb3KibhL+CEIz2AKga/Uj8zvOHD9KEmxROgJyNXUpLlP03uaWFf5
	DCiMZCCwCdVGns2tD4G+TzrN34LElyuS6PHA03zsnCAiRm9GwItEsWiTcq+jq1IHLJe3W1ZcEz/
	D/8nadR2RMmqlmboDSRE7yZeatLQ0ZRTxmfb3JA5X8pq5ZmdsT7iFxwbOuQe1/toV4Mjh5+sty4
	q2fiY0AVGKMRAoRfhlTuKCGY30QpJx1YUO0C0qQTEtptiUIez/qpsXxJNjkhc8aD+GugdBv9P0d
	D3t4yW+BigpqRUHduwmxXPos2UR7T/YdYvI9kiCiscM65st6m/jMWY00=
X-Received: by 2002:a05:6a21:b91:b0:3e8:e974:e45a with SMTP id adf61e73a8af0-3e928e26581mr4547143637.63.1793466186813;
        Sat, 31 Oct 2026 10:03:06 -0700 (PDT)
Received: from localhost ([153.61.198.246])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aadad94a8esm817264b3a.55.2026.10.31.10.03.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 10:03:05 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Oct 2026 17:03:04 +0000
Message-Id: <DMJ6PAVGV9ND.29T5161F064JL@gmail.com>
Cc: "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Alan Maguire"
 <almagui@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Yonghong
 Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Steven
 Rostedt" <rostedt@goodmis.org>, "Masami Hiramatsu" <mhiramat@kernel.org>,
 "Mathieu Desnoyers" <mathieu.desnoyers@efficios.com>,
 <linux-trace-kernel@vger.kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>,
 <linux-kbuild@vger.kernel.org>, "Arnd Bergmann" <arnd@arndb.de>,
 <linux-arch@vger.kernel.org>, <x86@kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Hazem Mohamed
 Abuelfotoh" <abuehaze@amazon.com>, "Bjoern Doebel" <doebel@amazon.de>,
 "Martin Pohlack" <mpohlack@amazon.de>, <jay.wang.upstream@gmail.com>
Subject: Re: [PATCH bpf-next 03/13] bpf: check CAP_SYS_ADMIN before looking
 up bpffs delegation names
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Jay Wang" <wanjay@amazon.com>, <bpf@vger.kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>
In-Reply-To: <20261031130959.23472-4-wanjay@amazon.com>
References: <20261031130959.23472-1-wanjay@amazon.com> <20261031130959.23472-4-wanjay@amazon.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sat, Oct 31, 2026 at 06:09 AM Jay Wang <wanjay@amazon.com> wrote:
> That is free today because the vmlinux BTF is parsed at boot.  Once it
> is parsed on first use (CONFIG_DEBUG_INFO_BTF_LAZY, later in this
> series), it would let any user make the kernel parse it and keep it
> parsed until reboot, which is what the option is meant to avoid on
> systems that do not use BTF.

Any user can do that without this mount.
/sys/kernel/btf/vmlinux is 0444. With patch 9 one read() decompresses
5.5 MB into vmalloc_user() memory that is never freed.
The parse is the other 2 MB.
After the first use the kernel has what every BTF=y kernel has today.
There is nothing to guard.

> Check the capability first.  An unprivileged caller could only ever set
> an empty mask; such a no-op delegate option, and a malformed value,
> now fail with EPERM as well instead of being accepted or failing with
> EINVAL.  Privileged callers are not affected.

That changes what user space sees, with or without the option.
Drop this patch.
