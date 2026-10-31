Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793466432;
	b=BRwIRviIxoXykc1y3APe7P8I2/w+FIbrCFXnMV8XZwR6YVyZNMw2LrjGchoLGbr7hCSz
	 misjOFMpy5rYCSHZUkIcUzkCRQU/CFsZ09YSVsy3sLeheNN0Y46Lpvc3eyJua9lA1L9ZU
	 CfleYSkHkaAw59ql+QHBidggd6S1HGOegseKZwIokYq5lLh80d6aYLN4vr1hL7AP7gmNe
	 F+mK7HJWXhyp2Lojn8RveI1Ghrg/eFFtEk48lWRnA3amObaxx5ZqvHUfJYnZ0/g40JqKj
	 90t4Y75YAOhoXUTaYWfTF2suSEbGQ99St7tNiIvplbrTwFCdWNlGthbVEUqHkCCAviw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793466432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=PqeTs0OEdiP2uTtWFXvUGWh5yzCA93pDqS6ulQ6Xi/U=;
	b=E3Wn5lTJ5STvXPBi1utF4JzJQX0+zPXki79I5GRpYElfF+Z2ucqJeLYrw2B+3KbMUIYJ
	 CpeA4U0W3CJFI770/mbvA4ZZChkqrEP9LN2YwPcWwluy8AlLic1qOjlG8L6zJ7eEEJoAN
	 jej/bUzVAJiezv3RqygD4mc7L04+R98W9nh0+L7LXa49s6WBLjBxxIKQLXLgjUDIaBLhy
	 B5LADmWrtZMtSTMbPI/JEwo265Akl/tu/Lfh3xw0Nhi8vvKejOjvqhuPgAT2GgPAutgzP
	 HMrnp3FSwq7CH3zCsnWpQGb8h+92XnHcp0Lg93ZMcc500vAIjYX+U6WGymXml8oVWVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="vXIZK/vH";
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B8D606A31D
	for <linux-kbuild@vger.kernel.org>; Sat, 31 Oct 2026 17:07:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5B8D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vXIZK/vH
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so699068a12.0
        for <linux-kbuild@vger.kernel.org>; Sat, 31 Oct 2026 10:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793466431; x=1794071231; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PqeTs0OEdiP2uTtWFXvUGWh5yzCA93pDqS6ulQ6Xi/U=;
        b=vXIZK/vH67BDbgcwM4Cb7hOXrAAAQ5hvncYeaLI3z0CprXTvfb0bHlhdAEOjnEFbCl
         kUa6hwsWyXZYiWpHlHfpW4332fM6P3EL0Vy8yzFjo7A2OO2EsiNRAAR51TOafHkLAg+4
         gfsSR5lmtLwMBuqd6Rs0FwvvZWaS9WdZWwN+gRl8GK50NlG2ESNM8BjH2CNvYAcXotXc
         1nXaMPS4oXjaDFBqYWkXU4bv9ZKK1gJHBhqD2CW/O6L9Nhg0H60yMPu9i+wM1eA8xjAd
         lb8zbaNI3El31j4+LPN8YXN9JcSza/Fc1mg4nPCdxwip24m9MHV4woYMACgRUD5GjChd
         Jcmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793466431; x=1794071231;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PqeTs0OEdiP2uTtWFXvUGWh5yzCA93pDqS6ulQ6Xi/U=;
        b=o0pwxN8LhH8I+NXahsblu+IZr3/oKVlVNcNqt9TWbREWBq7jJtQgy16JbmO6GOgMNp
         aHKbdcf9DaMKTzkxPLOLwQKIutWXN4Ot68mkR52kx5KBKfSQnuUs5nnrQyEJsQOKvnmH
         4Aia3scdYDIKDMyMYjCLry+KWbs7NWAXdXAE5o4DkphK8sM6mlQ4ADy4/oZRZAqdRR9B
         JEn+cQW56ARpgZkbYkJ3y2Gay0b4Ie4ZCXRPD4sF9XtTomkWWh1aNcs/3+bTf1A4dxwW
         TunNbOHYJXnyOyOFva6ma2W7aiik7ImsReASxv8suV2uzDmY7DB9MOl55V/XY7PcXuKc
         NBrQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxn9Bg00+XhujA3Uz1NEojzO1NlWDxf35wS2IhJZuVZSdIzFllbZ/11uSwhsk6EW1JVVLAWUeIG0e0VBY=@vger.kernel.org
X-Gm-Message-State: AFq9FYICl+riO6Fj0LI0lr+IFbDHioa494gDObpbqrX8Y4dCoq643UOG
	mQ0HE/jurX0MljAA3t8/jOTDU9JvtO6M/vY4EMfQOVET5XlTviBfVye+
X-Gm-Gg: AYBFou3NCkEI+ExbZVrlZA8pnH8/f9Zm2blPhELTm1Ex0ltUd1yM/j3xocWB7U3w6p9
	HkH7JHNrWaY1oqMtVxqICQIvT2W3uzU7vn+DmnTOgQRE+Axn1O22rpdMx+ushEnaVK37LxCFsa4
	OMTxai4BTOFNceUouRKTojOmW/kJ712z4+CMdbEXVT0mOPgpyE/oeiSx6a/x6ZLjnUfPVrP6RpG
	FdVDlXCYkPC2qg02D2HE1+WJorcngBiYvE+4e7sMkKJvonm4asfIO+Sy1Fc98MfH5dIyuUPVReN
	qCsC+NettAS7hdlutavLBiMGwaS71pmzw+CRpXHuO4gPCBWiW8WDgpUh/EC/sN2f0GIivERCI2e
	ULcTsyo8nV/FNHkB241gEzZEJUlcWywiPlk11Ik5bBItQU2Rv7c86HC/WZyMpg91MBfpSf6fBZv
	eS3lGh+PhSHCBEcFKqZo2ebYY/H2LK8dZNusdCSqRXJZHrJVKfZ15OB+jwjzeNYL/9STSm02gA9
	+IsP8oB3bAWIwSMiNyjylBv5hn9LVZK8gVf5fsztBANzweYn2q2ApOg0L8M1FH9IJJNkaBLsq2q
	sX2srmvob0LbqX8SzEbcaMeQAauS4g6/lJwRyvX9mHhS7A50IefxaigsK+lbI1GjSMNGvmasOqQ
	KPspcRiTsrifTUahay4TBbN3hHNnBBmVaoA==
X-Received: by 2002:a17:90b:5145:b0:3ac:9706:772c with SMTP id 98e67ed59e1d1-3ae8984cefamr5029531a91.60.1793466430956;
        Sat, 31 Oct 2026 10:07:10 -0700 (PDT)
Received: from localhost ([153.61.198.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e9bc6f7sm12221824a91.16.2026.10.31.10.07.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 10:07:10 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Oct 2026 17:07:09 +0000
Message-Id: <DMJ6SFP2GD3X.1AW7OEM6GPY4Z@gmail.com>
To: "Jay Wang" <wanjay@amazon.com>, <bpf@vger.kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>
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
Subject: Re: [PATCH bpf-next 10/13] bpf: defer kfunc and struct_ops
 registrations until first BTF use
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <20261031130959.23472-11-wanjay@amazon.com>
References: <20261031130959.23472-1-wanjay@amazon.com> <20261031130959.23472-11-wanjay@amazon.com>
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
> The first use can run out of memory, also only because its task is
> being killed: vmalloc() gives up then.  A round that fails with
> -ENOMEM, in the parse or in a replayed registration, is not published:
> the new BTF is dropped with whatever was applied to it, the queue stays
> as it is, and the next caller starts over (a struct_ops ->init() then
> runs again with the new BTF; the in-tree ones only look types up or
> store the BTF pointer, which nothing can use before the BTF is
> published).

can we do the first use from a work item ?
A kworker has no signals and is never an OOM victim.
Then -ENOMEM is as unlikely as in an initcall today, and an error can
be final, like without the option.
workqueue_init() runs before the first initcall, so it works at boot.
No need for the retry, for btf_unparse_kept_modules() in patch 11 and
for ->init() that runs twice.

Something like this (not even compile tested):

static void btf_vmlinux_first_use(struct work_struct *work)
{
	struct btf *btf;

	guard(mutex)(&btf_vmlinux_lock);
	if (btf_vmlinux)
		return;
	btf = btf_parse_vmlinux();
	if (IS_ERR(btf)) {
		btf_drop_all_deferred(PTR_ERR(btf));
	} else {
		btf_vmlinux_new = btf;
		WRITE_ONCE(btf_vmlinux_builder, current);
		btf_apply_deferred();
		WRITE_ONCE(btf_vmlinux_builder, NULL);
		btf_vmlinux_new = NULL;
	}
	smp_store_release(&btf_vmlinux, btf);
}

static DECLARE_WORK(btf_vmlinux_work, btf_vmlinux_first_use);

struct btf *bpf_get_btf_vmlinux(void)
{
	struct btf *btf = smp_load_acquire(&btf_vmlinux);

	if (btf || !IS_ENABLED(CONFIG_DEBUG_INFO_BTF))
		return btf;
	if (btf_vmlinux_building())
		return btf_vmlinux_new;
	queue_work(system_dfl_wq, &btf_vmlinux_work);
	flush_work(&btf_vmlinux_work);
	return smp_load_acquire(&btf_vmlinux);
}

The undo has a hole already.
bpf_io_init() and bm_bpf_init() don't only look types up. They register
kfuncs. And bpf_struct_ops_desc_init() turns every ->init() error into
-EINVAL:

  btf_apply_deferred()
    __register_bpf_struct_ops(&bpf_ring_ops)
      bpf_struct_ops_desc_init()
        bpf_io_init()
          register_btf_kfunc_id_set()
            btf_populate_kfunc_set()      krealloc() fails
              btf_free_kfunc_set_tab()    frees all vmlinux kfunc sets
            returns -ENOMEM
        returns -EINVAL
    pr_warn(), next entry

The BTF is published. The kfunc sets that were applied before this
entry are gone until reboot.
