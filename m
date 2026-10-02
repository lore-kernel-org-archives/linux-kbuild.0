Received: from mail-pz2-f21.google.com (mail-pz2-f21.google.com [74.125.228.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCFA4908BB
	for <linux-kbuild@vger.kernel.org>; Fri,  2 Oct 2026 11:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790941726; cv=none; b=OjutfdFFWgcQMIw7nXVvv9jxqN0LzZp/KWTFBxRnTh+/XQQV2eDWB7X5zVmpmOarasj1re//NwAydqdbwCfe9oANbwU0r8cksYiYEdeFCsATyAXlPxAkQkaG4uTkLL0QJCrdx76AGivxxVHi/tzw9Y0gyQXvkeMFvlBa6jQgGJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790941726; c=relaxed/simple;
	bh=gAY+ry7XQppx5kZcg+BfzcVwDqxF38v68qrWhv2EpEU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=tQA3fEyr+hko+IG3QMNoUdeni3G6oeKl6CU15R0TsBdqO7jV4lM2foPyZPRBTgHsIp+XP9Emt6JB60PPgX5iuj2auXGFl3u0HRQzmYmjCqgPmgYOJjHDaq73IQ91ZucjlPaN+oTbMhSSJFvymKsxYQRwIG8REOfbbkZk8t6DWsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MeyZIhmU; arc=none smtp.client-ip=74.125.228.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MeyZIhmU"
Received: by mail-pz2-f21.google.com with SMTP id 41be03b00d2f7-cc4cacd3409so4541626a12.2
        for <linux-kbuild@vger.kernel.org>; Fri, 02 Oct 2026 04:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790941724; x=1791546524; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jDgCZ93FbbC+h+9QAZpC0c3CaTDV4NHqwfDJ+8l3w7I=;
        b=MeyZIhmU8tcw6SYtV+1UZ7tSerG+sxuHQGu95Sf+jXbAr1jEANi1Xr2UvlE2O8dFCC
         Kz4XzfQuSc3KIwWpsVO1Wp9OmjeYf+k2zVFqFV8MrniXv/Iv8UCfKoVfgmpUA3BuiRNo
         E09LSomNq7IqB2WCn+1NYu8sFOkvU0Cu6beoCzkTV3AHfDKdEtalVaFOtKnZkVt+FvBt
         TdkVI6itaXRa85ogpErUJnSIghBnEdXTd3G62zvw8C3M2iygDKn2y0J1J0hsAnGP9hT8
         3SVS+eFmQ2NIyY/3qTsvtmqitlyjb/IelUbO2q1DHTFsAfgRgFm+mHLNtvYT7EJfslZ4
         pFVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790941724; x=1791546524;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jDgCZ93FbbC+h+9QAZpC0c3CaTDV4NHqwfDJ+8l3w7I=;
        b=FFELGyOvtiUt+0kK/VLZefrF9Sb0xYdxxQSzBLGHs4ki7FpwubfeJg+kfryW0a4jJ0
         hTcsi/LzEsmLkFg0rXUkSkrXxwskx24aQCOV5AYZoZ4+yFvheFYX0J7NikmDGxMzqLph
         qnOxPhvYXNxneHtbeS2Ow/HajT0gGFm+1X4waqtisBogrDb2QhGBecv7dfOuDjd0L17F
         cXCrRBYvYWxdfByokoR5RBDpoJx4rWz83h0hywpyUdjPb9Bbots/HSVQr6llBUsdo8l2
         nYptOGkIPiFCrM8KxeC6A9QOmzXyofXBBCivD14tnI9damRFO4YwUxqz1O46XxUL1GSS
         1sTA==
X-Forwarded-Encrypted: i=1; AKwUvBw0wFaeoRskJCxy1lY9YgfmO4TtJfBX2IQ0yuQVpYMhCsKNDUzrPbVtikjvdTA6wToFWnEO4lNM2UEtgRs=@vger.kernel.org
X-Gm-Message-State: AFuF++n0rKO6+M1q/YuqlhLJH36ytEw7jymH11h+wAntuLAsWAhtDfpe
	CFpwYNIih2IhT5qJgqHC1Kvklzw9Itx5Y6165HnPL1cpOIb8a9Gwn7bZ
X-Gm-Gg: AYBFou0pfrCdMNMiDC3jZYdx2qPqQGhFcsbRrbSBP/WJPjoGLVm0DCcbS+XiZvZpOQ/
	KWI8nbqTdCIPfmCLXLwACydIcdeUqSpe3wkaW4BJk1xZsAEz+qn33WYy9dS+eD3kXl4MRcvyh2v
	9tpI8crA5C67kZTlEFOZxrAS/hWX4umE3IdBV+m4yoqERQGFGYaUxVUrgjyB3OEMhB/703kywCs
	XqkOUzkAlO8HI3j/StpJiTpHCujfcB1DCF/IfGPE0NWNP16xMNU6uNFCrfG6Eg9g3z0DcHFrIBy
	oEHIv5Zmm7kdX/dka/klfj0z3gxCGaBCc7c1HNPvwDMkoU7FBSeqOy/x34YRZRZi+wY6elQfEKE
	rnCxNJoHKolJvCWfN0XWvP0cT8HSFGezv5ZzGjlVmgUnHqJDK23YpB8EbLMUsjwt4EllKBGwqr3
	E4ufoxNDI7lgCq8AwYXcLNXZWDNZBm79GKnHWppH1Os1ZMDHDvfUAC5Pjdyyvias7aJU7U8OZNR
	dGjLb3XwUvaIjE5hfdpKRPpD7wnE0Q+cb+FP7O8Yz8lPfBcteh+7zDXcBQwKxY5nFUKl2hOnvS7
	hSw=
X-Received: by 2002:a05:6300:210a:b0:3e0:b937:8844 with SMTP id adf61e73a8af0-3e0bd199342mr2548048637.44.1790941723843;
        Fri, 02 Oct 2026 04:48:43 -0700 (PDT)
Received: from localhost ([153.61.198.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0d247dbcsm743396b3a.55.2026.10.02.04.48.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 04:48:43 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Oct 2026 11:48:42 +0000
Message-Id: <DLUBUT40BBOG.1L6QS7A8CIE79@gmail.com>
Cc: "Alan Maguire" <alan.maguire@oracle.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri
 Olsa" <jolsa@kernel.org>, "Ihor Solodrai" <ihor.solodrai@linux.dev>,
 "Quentin Monnet" <qmo@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nsc@kernel.org>, <linux-kbuild@vger.kernel.org>,
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, "Christian
 Heusel" <christian@heusel.eu>, "Luis Chamberlain" <mcgrof@kernel.org>,
 "Petr Pavlu" <petr.pavlu@suse.com>, "Sami Tolvanen"
 <samitolvanen@google.com>, <linux-modules@vger.kernel.org>, "Steven
 Rostedt" <rostedt@goodmis.org>, "Masami Hiramatsu" <mhiramat@kernel.org>,
 "Mathieu Desnoyers" <mathieu.desnoyers@efficios.com>,
 <linux-trace-kernel@vger.kernel.org>, "Arnaldo Carvalho de Melo"
 <acme@kernel.org>, "Namhyung Kim" <namhyung@kernel.org>, "Ian Rogers"
 <irogers@google.com>, <linux-perf-users@vger.kernel.org>, "Jiri Kosina"
 <jikos@kernel.org>, "Benjamin Tissoires" <bentiss@kernel.org>,
 <linux-input@vger.kernel.org>, "Tejun Heo" <tj@kernel.org>, "David Vernet"
 <void@manifault.com>, "Andrea Righi" <arighi@nvidia.com>, "Changwoo Min"
 <changwoo@igalia.com>, <sched-ext@lists.linux.dev>, "Shuah Khan"
 <shuah@kernel.org>, <linux-kselftest@vger.kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, <rust-for-linux@vger.kernel.org>, "Arnd Bergmann"
 <arnd@arndb.de>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Hazem Mohamed Abuelfotoh"
 <abuehaze@amazon.com>, "Bjoern Doebel" <doebel@amazon.de>, "Martin Pohlack"
 <mpohlack@amazon.de>, <jay.wang.upstream@gmail.com>
Subject: Re: [PATCH bpf-next v4 04/12] bpf: take the vmlinux BTF from the
 btf_vmlinux module
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Jay Wang" <wanjay@amazon.com>, <bpf@vger.kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>
In-Reply-To: <20261001225214.12351-5-wanjay@amazon.com>
References: <20261001225214.12351-1-wanjay@amazon.com> <20261001225214.12351-5-wanjay@amazon.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, Oct 01, 2026 at 10:52 PM Jay Wang <wanjay@amazon.com> wrote:
> +	err = __sys_bpf(cmd, USER_BPFPTR(uattr), size, USER_BPFPTR(uattr_common), size_common);
> +	if (IS_MODULE(CONFIG_DEBUG_INFO_BTF) && err < 0 && bpf_btf_vmlinux_retry(cmd, misses))
> +		err = __sys_bpf(cmd, USER_BPFPTR(uattr), size, USER_BPFPTR(uattr_common),
> +				size_common);

Running the command twice when it failed and a global counter moved
is not going to fly.
Missing BTF is not always an error.
With =m and BTF not loaded yet take
  int prog(struct xdp_md *ctx)
with func_info. That is everything libbpf loads.
do_check_common() calls btf_prepare_func_args(env, 0).
find_canonical_prog_ctx_type() returns NULL, btf_is_prog_ctx_type()
returns false, the arg becomes ARG_PTR_TO_MEM and
func_info_aux[0].unreliable is set.
The prog loads. err == 0. No retry.
From then on freplace of that prog fails with
"Cannot replace static functions" and fentry/fexit see its args
as scalars, even after BTF is loaded.
With =y both work.

That is the only reason why "a socket filter does not load it".
In v3 such prog loaded BTF.
systemd built with BPF_FRAMEWORK loads
  int sd_bind4(struct bpf_sock_addr *ctx)
from manager_setup_cgroup() at every boot.

The result of the verification cannot depend on who touched BTF first.

bpf-ci is right too. The first run writes into uattr.

It's starting to feel that this is dead end.
So much complexity to save few Mbyte.

pw-bot: cr
