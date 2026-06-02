Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84E937B002
	for <linux-kbuild@vger.kernel.org>; Tue,  2 Jun 2026 20:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780432622; cv=none; b=fWpDeIK6UguWuvpDGSLS/I9N6G0ncR236SbpOjA7xdQgSxl8LhppgMpVlQuqpTViKeDICxc01wfZWtjm6IURR6F/6Ukn38nOiVRaE6tBfH2jmpn2lbOUbadTI1XOIJJ573QflD+9nKPhkQP28i2YzhGnJJOH38bvdjl1LEzBHvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780432622; c=relaxed/simple;
	bh=QSbmAqd/sTZ3F0fvQA5IVDgSCR3fHbEcwZCfgBn+mJ4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BtLDw9LZ25SMagZ4qG9JpLk7QiTJo2sF5pA9d9JwZSnXAkhSfDl8HzhR0fJZ5rti6tLnnC2Fpledtvb3kxMzbu5PJMbV88zpGoMNs+3iRkSS4HWW/mzy/YU/MzFdYcugRPUYQbSIAkIF4N3qR6SRkX6oUMTvHvHih+EHUHvmcYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RaCJYd4k; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RaCJYd4k"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490388fd0dbso118748875e9.0
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Jun 2026 13:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780432619; x=1781037419; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8WXEdmdnIoR/6jbguXyziqGc/dq8TkPgdTmfXk5pzNE=;
        b=RaCJYd4kQQo6N7R5C92RpdRlPMKGRbzWFdd4/06HUcvBWhF1TWu3kiQggMeo5AG2W4
         y+rioj7Xeb8IYCjThsJmX82Xjo3LKA4xVD4+C4qBuClh3udamhZwernGANnlmEM57YUi
         ZavF85ix5Jbg3XnP/ptB3Jdx6L2MVhcC/ueawZ43sMYN7VAA7eBhtUXb0nRE7ugG4juu
         YnQHRckoTtFlLqD6p/cMChymZJbaR4yBlDy6jlLAYb2HUUXnzo+7U66Puw5Qnu2HxgT+
         GZCnVyrLlXTJAKerWx8U871JsrC4fPpokL9+S9UouYp4lhtEeJQ87BCzwaHcutRsjqF1
         kybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780432619; x=1781037419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8WXEdmdnIoR/6jbguXyziqGc/dq8TkPgdTmfXk5pzNE=;
        b=WsAnBGW7XSvCLPQK3St02DBPooeLAVOXi45rHqVxrGvgwUvIp4odKtq2m8/xsw+Y4Q
         /1/Fu5UW9hM1w+d7Fpb67y9FW5AbB/4ML7FsCnS+QL5fSIIooRFU4QvXdQWDyuJttEJP
         UrlzvDM63D+VS4UddnM1I50WQBwyRSnb7AsQwZZNI5MBSVzMxueKSaClRROJ3xMdJvno
         v7NoYn2DoIpQCCZnJ8GNQuwggA/+/PFeDme1We2noNmPX/Z8cDsxQtXz/MqswU6Z6Act
         xS94idb1s2sKfkROzI01cMqGkof45/K3g24PU+x4Fd5fejgXFY8XZKq2BqXei5Zbs5MG
         zY+A==
X-Forwarded-Encrypted: i=1; AFNElJ+Ss5KzTt87BIo41xqyElfwJe5IiX5bhFijU/8nylRCDOnn3/YzaNqzdmZXn+nhSxtWycd09MxvHfqzXH8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBfDBt4sMUJOcrkjfFZTRNvF0XnU1CvuVI0Cvf8138kuOywyrq
	/35f9t0PWRwaSu8esLrELwTFQM/LtBKHN2JZMzigcnQPmxAYvkMEy6Yc
X-Gm-Gg: Acq92OEn6lC08upONzH7XinzIX3O1THOFOCt9+Yey3yBBPS1Ssz77JrH8DdWuVVPUtQ
	hYEZzQLcGanuFG4r1IEknPk1WJw20NvFlioHXgsw8m5Om8NoHZvz2mH6WMSE6zOZ1Sj/vmo5kyM
	tdud12gK0rfwgaxjCdUvwJ0UvMyS53u0ewosq5Z4vw7ds1xT14PRfookkDdL//dFwGBUYpgd7iQ
	O7Gaf7061U/5dMfBAeVOy/HYmkaTnxVXS2ykc0rT0JJ3Bg7s6Mj3IuGe7UBztpURM9avSHorBJi
	5lx52mnRBCcMmLqOXEIpN5jFj0pC/YYp5d8HuBiPdekf/yectEaf01rj/Maog2TJbYevpaxJ6dk
	yMSf3Cvepp7J9nuEfgcZmuHOq//xaxoeZtXhbmQ5nBvCcp8pznYJEfICiI5l9eJE4FaegHwLlVA
	otPorzlg4B+nTBGR4+K1h+YA==
X-Received: by 2002:a05:600d:4452:20b0:490:b58a:dcbf with SMTP id 5b1f17b1804b1-490b5e763a4mr4324905e9.27.1780432618875;
        Tue, 02 Jun 2026 13:36:58 -0700 (PDT)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b60f6d5asm5383835e9.0.2026.06.02.13.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 13:36:58 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Tue, 2 Jun 2026 22:36:56 +0200
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Alan Maguire <alan.maguire@oracle.com>, bpf@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH bpf-next v1 06/14] resolve_btfids: Discover kfuncs from
 BTF ID sets
Message-ID: <ah8-6CNIHPCJxAOM@krava>
References: <20260601221805.821394-1-ihor.solodrai@linux.dev>
 <20260601221805.821394-7-ihor.solodrai@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601221805.821394-7-ihor.solodrai@linux.dev>

On Mon, Jun 01, 2026 at 03:17:57PM -0700, Ihor Solodrai wrote:
> collect_kfuncs() currently uses bpf_kfunc decl tags to identify the
> list of kfuncs. The decl tags are generated by pahole, which makes
> current implementation implicitly rely on those tags being generated.
> 
> The authoritative source, used by the the BPF verifier for kfunc
> registration, of functions being BPF kfuncs are
> BTF_KFUNCS_START()/END() declarations. These are BTF_ID_SET8 under the
> hood. Currently resolve_btfids reads kfunc flags from these sets, and
> populates them with BTF IDs.
> 
> Implement kfunc discovery from BTF_ID_SET8 symbols in resolve_btfids,
> removing the dependency on pahole's emmission of decl tags.
> 
> Walk BTF_ID_KIND_SET8 sets, and use the address-to-symbol index to
> look up set entry's BTF_ID symbol name (before .BTF_ids is patched),
> recording the paired flags directly. This makes find_kfunc_flags()
> helper unnecessary, so it's removed.
> 
> Kernel functions can appear in more than one set, which is legitimate,
> since kfunc sets are prog-type dependent in the kernel. So for btf2btf
> processing deduplicate kfuncs by BTF ID, accumulate (OR) the flags,
> and warn on flags mismatch to catch inconsistent declarations.
> 
> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
> ---
>  tools/bpf/resolve_btfids/main.c | 122 ++++++++++++++------------------
>  1 file changed, 55 insertions(+), 67 deletions(-)
> 
> diff --git a/tools/bpf/resolve_btfids/main.c b/tools/bpf/resolve_btfids/main.c
> index 43512af13148..d35a7b2460e8 100644
> --- a/tools/bpf/resolve_btfids/main.c
> +++ b/tools/bpf/resolve_btfids/main.c
> @@ -970,6 +970,23 @@ static int push_kfunc(struct btf2btf_context *ctx, struct kfunc *kfunc)
>  	struct kfunc *arr = ctx->kfuncs;
>  	u32 cap = ctx->max_kfuncs;
>  
> +	/*
> +	 * A kfunc can be listed in multiple BTF ID sets.
> +	 * In this case, dedup by btf_id and accumulate kfunc flags.
> +	 */
> +	for (u32 i = 0; i < ctx->nr_kfuncs; i++) {
> +		if (ctx->kfuncs[i].btf_id != kfunc->btf_id)
> +			continue;
> +
> +		if (ctx->kfuncs[i].flags != kfunc->flags) {
> +			pr_err("WARN: resolve_btfids: inconsistent flags for kfunc %s: 0x%x != 0x%x\n",
> +			       kfunc->name, ctx->kfuncs[i].flags, kfunc->flags);
> +			warnings++;
> +		}

hit few of those

WARN: resolve_btfids: inconsistent flags for kfunc hid_bpf_allocate_context: 0x5 != 0x25
WARN: resolve_btfids: inconsistent flags for kfunc hid_bpf_release_context: 0x2 != 0x22
WARN: resolve_btfids: inconsistent flags for kfunc hid_bpf_hw_request: 0x0 != 0x20
WARN: resolve_btfids: inconsistent flags for kfunc hid_bpf_hw_output_report: 0x0 != 0x20
WARN: resolve_btfids: inconsistent flags for kfunc hid_bpf_input_report: 0x0 != 0x20

I'd think flags like KF_SLEEPABLE might vary in different sets for the same kfunc,
IIUC you don't need to use KF_SLEEPABLE for syscall hook, because syscall programs
are already sleepable.. not sure there are other examples

jirka
