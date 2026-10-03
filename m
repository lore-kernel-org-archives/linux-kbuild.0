Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF423769EC
	for <linux-kbuild@vger.kernel.org>; Sat,  3 Oct 2026 06:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791009487; cv=none; b=on7t890lggmNxHijx5VUtFxOL+FGoUTgi+vQCCCZn+SvREYYayTwhEmrg5jmP6KuTJtBJDkuDxn1OFo4vCq3dcZEQxdKbWNMhgsoVkQj2veRCLWGj1lmKbOb1RrvYFeoGxq/D52XBSnhC52/fFWpyQyhMMvE3mPWVlV600E1qU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791009487; c=relaxed/simple;
	bh=w2CHf/Ruyl0ieMWiVy7QleNiafjxfD+l+EFZ1XXXNB8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=RTBVv+RrZEcVhXjDctZgewopeJLXj5kWV5rP2HNyrpNB97xNshmtgJSt5pDM4SS/Vch1MGkCneu/TA2uRpMoRW4fqDzgBtHBUukSytfWvIYLA6zXXESPY/wo1zBpzzfkQv8enXlmGZojdgvdhrO7lhkiz1HylcAjwoOjmOywEXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ir4gbnxE; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ir4gbnxE"
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc78dd412cfso49909a12.0
        for <linux-kbuild@vger.kernel.org>; Fri, 02 Oct 2026 23:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791009484; x=1791614284; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rn5qy1uct3HxkhX0TLP/tcAeQOQET/L/4W2RbNiSgQ4=;
        b=ir4gbnxEYnj8MisDdoh2wYz7JDHlJTCmhf8medao28SMIzq4NAWkf0ReXrErcyRePu
         KYL62hbQCDuBRabP53yqOzo21q9Z1Qu3JS02vsmrsF8lbmufMc4VpPVBKi79MTCXIo33
         8wUcc7BS5tppb1lzOCyUW7Pbd4tZpmLBF0s9MhdUEdgZxxOIoFlh8nRqh77cIJ+d1Kom
         XVc+9Py5vO/ZY7NNBhTjHYlKbzBd2zgUgxGmrTTjIPGnpaerNNgFmzGLOupGDtJvz9op
         e7c8gqGeTkF4yGlIJr6T4txba4hezFKH+14YeDOtMxg+o3hzr8eeMmp1c+W9zjWzOzVO
         MJ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791009484; x=1791614284;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rn5qy1uct3HxkhX0TLP/tcAeQOQET/L/4W2RbNiSgQ4=;
        b=BjpTazMk2NWDfPZYzR3iIRYxB/iM6icJUv7f11Ah7CebDlcAyMMBQBxXP6ZBALMsS2
         D7Gx59lDEU9bl4T3zQnU4Pg9IeTbTq1kILI0uIaWIhyCb4650n59CQQN+GP1tJpejwy6
         2r6d2hsVCP0QUI6betaTlvg9Vx24qHaEHaWfDks2tUoQB9V4UgoQSsrkqVCIhH/L2Jb0
         W3PdaOAxa/1TLssokXwl2stmNTKwAS8OBbAZUWWxex13rL38EtXBRSd45KgnmJ2knSwG
         5FGhg5RGSPTCJV9QcokiHWuvFgCzGuGBsmg/UFXF+PVgLhe23Wqq1wRXzld+634EFczV
         yAug==
X-Forwarded-Encrypted: i=1; AKwUvBxCfEre1dvaDp2a3QVclXE3ltCcrMndIiaXa/m5th+Yh22UHZiGNMS1oUylf+iMWgnUD5ovbLgE5p7qEyI=@vger.kernel.org
X-Gm-Message-State: AFuF++l+D3i+TueK/l9wWmzztD3ApalG7oU5TEueiAe0QnQNEgca8nOn
	FWXsnIKKyNTb0s+IyfHF95BY6vhYU+V0uemMHMsVueCDExdhfhof22BZ
X-Gm-Gg: AYBFou22eHHPVxoSa7/LVaCdn9yz7Rzk0nXrc0mtX5unmjM5trasF67yaal0gDn65lP
	chay7a3B5BVnYxrxFsdimdDkUSjYREtU9Nw/DL19E65UMaDLj7m8v6IXONBa2SRKCNlE2jv6K9s
	gOjiFW4BG7LwfKlxx+MNMnhFZQxwXw3hht77Gu9hNHYCXf4hbn8J+BSIs/Vb1iAeT3t+PjOURbb
	LSi0pEuMK8Zch8+WWxEc/xGEACdwaZRMo/NHO+eS3WZkhqdoaISadEc1FQgId0H66zjnUi+RmwN
	lk250HnVDOqwalvZNFdrfg5BcsUuv12ghvtpZEBAeuJibgDWiTP4/zBncrEkte85Mj6thshzuWa
	2Ud2LEb7xVqHzxOSjHAI0dM2ie5kWLvl69tgEXA5hl705J+LbuQxFKPII1YkUHPPGr5f9nnwEFn
	jGvtFzJeNFUmG23cIvr9ORmhlZf3g146sPQV8Bp7MDwO2Z4M8KWaHz46imM+3wgFqd6WoFC+gSS
	WfnrYYn37Upi9Drco0One0zdNOIOLBLcE+ogYm7VZJb2L4xWh/ShQgUDBb2/L41+EJ3TJ8jHqg6
	Owk=
X-Received: by 2002:a05:6a20:7495:b0:3e0:b778:d988 with SMTP id adf61e73a8af0-3e0bd4bff2bmr4998287637.83.1791009484332;
        Fri, 02 Oct 2026 23:38:04 -0700 (PDT)
Received: from localhost ([153.61.198.249])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc9f7370db1sm1809155a12.17.2026.10.02.23.38.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 23:38:03 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 03 Oct 2026 06:38:02 +0000
Message-Id: <DLUZVHOLSN1B.115EUX4KJBEA3@gmail.com>
Cc: <alan.maguire@oracle.com>, <martin.lau@linux.dev>,
 <yonghong.song@linux.dev>, <jolsa@kernel.org>, <qmo@kernel.org>,
 <nathan@kernel.org>, <nsc@kernel.org>, <linux-kbuild@vger.kernel.org>,
 <linux@weissschuh.net>, <christian@heusel.eu>, <mcgrof@kernel.org>,
 <petr.pavlu@suse.com>, <samitolvanen@google.com>,
 <linux-modules@vger.kernel.org>, <rostedt@goodmis.org>,
 <mhiramat@kernel.org>, <mathieu.desnoyers@efficios.com>,
 <linux-trace-kernel@vger.kernel.org>, <acme@kernel.org>,
 <namhyung@kernel.org>, <irogers@google.com>,
 <linux-perf-users@vger.kernel.org>, <jikos@kernel.org>,
 <bentiss@kernel.org>, <linux-input@vger.kernel.org>, <tj@kernel.org>,
 <void@manifault.com>, <arighi@nvidia.com>, <changwoo@igalia.com>,
 <sched-ext@lists.linux.dev>, <shuah@kernel.org>,
 <linux-kselftest@vger.kernel.org>, <ojeda@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <arnd@arndb.de>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <abuehaze@amazon.com>, <doebel@amazon.de>, <mpohlack@amazon.de>,
 <jay.wang.upstream@gmail.com>
Subject: Re: [PATCH bpf-next v4 00/12] bpf: make the vmlinux BTF an
 on-demand loadable module (CONFIG_DEBUG_INFO_BTF=m) to save ~5.4 MB memory
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Jay Wang"
 <wanjay@amazon.com>, <bpf@vger.kernel.org>, <daniel@iogearbox.net>,
 <andrii@kernel.org>, <eddyz87@gmail.com>, <memxor@gmail.com>
In-Reply-To: <44315425-c505-46fe-8379-f19d78ff3abb@linux.dev>
References: <596bfb65-db2d-413b-8039-c921031b50fd@linux.dev> <20261002073422.14253-1-wanjay@amazon.com> <44315425-c505-46fe-8379-f19d78ff3abb@linux.dev>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, Oct 02, 2026 at 01:58 PM Ihor Solodrai <ihor.solodrai@linux.dev> wrote:
>      Keep zstd-compressed blob in the kernel image and decompress and
>      parse it synchronously on first use.

imo this is the only one of the three worth considering.
